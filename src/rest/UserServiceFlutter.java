package rest;


import dto.UserDTO;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import java.util.*;

@SuppressWarnings("Duplicates") // Så IDE ikke brokker sig over duplicate code.

@Path("userFlutter")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class UserServiceFlutter { // Start på UserService klasse.

    // I stedet for database
    static Map<Integer, UserDTO> users = new HashMap<>();
    // Dummy data
    static {
        users.put(1, new UserDTO(1, "Tristan", "TES", "Hund123", new ArrayList<>(Arrays.asList("Admin", "Moderator"))));
        users.put(2, new UserDTO(2, "Stig", "SMN", "Kat123", new ArrayList<>(Arrays.asList("Far"))));
        users.put(3, new UserDTO(3, "mcm", "mc", "pass", new ArrayList<>()));
        users.put(4, new UserDTO(4, "d", "mc", "d", new ArrayList<>()));
    }


    // Getter alle brugere i en ArrayListe.
    // Postman GET eksempel ***  http://localhost:8080/Lektion12/rest/user/
    @GET
    public List<UserDTO> getUserList() {
        return new ArrayList<>(users.values());
    }

    // Getter specifik bruger.
    // Postman GET eksempel ***  http://localhost:8080/Lektion12/rest/user/2
    @GET
    @Path("{username}") // parameter
    @Produces(MediaType.TEXT_PLAIN)
    public UserDTO getUser(@PathParam("username") String username) {
        System.out.println("CONTACT BUCKO: "+username);
        for(int i = 1; i<=users.size();i++){
            if(username.equals(users.get(i).getUserName())){
                JSONObject jsonObject = new JSONObject(users.get(i));
                System.out.println(users.get(i).toString());
                System.out.println("get body: "+jsonObject);
                return users.get(i);
            }
        }
    return null;
    }


    @POST
    @Produces(MediaType.TEXT_PLAIN)
    public Response addUserDTOJson(String body) throws InvalidIdException, JSONException {
        System.out.println("Tilføjer indhold...");
        JSONObject jsonObject = new JSONObject(body);

        // roles håndteres fra JSONarray til Java ArrayList.
        ArrayList<String> roles = new ArrayList<String>();
        JSONArray jArray = jsonObject.getJSONArray("roles");
        if (jArray != null) {
            for (int i=0;i<jArray.length();i++){
                roles.add(jArray.getString(i));
            }
        }
        // user oprettes og håndteres fra JSONobjekt til UserDTO.
        UserDTO user = new UserDTO(jsonObject.getInt("userId"), jsonObject.getString("userName"), jsonObject.getString("ini"), jsonObject.getString("password"), roles);

        //putIfAbsent returner null hvis id ikke eksisterer. returner nøgle-værdien(UserDTO) hvis id eksisterer.
        if (users.putIfAbsent(user.getUserId(), user) == null)
        {
            System.out.println("Bruger tilføjet. Det gik godt! (backend)");

            //System.out.println(getUserList()); // printer brugere fra Mappen. Til test formål.
            return Response
                    .status(200)
                    .type("application/json; charset=utf-8")
                    .header("Status", 200 + " OK")
                    .header("Access-Control-Allow-Origin", "*")
                    .header("Access-Control-Allow-Credentials", true)
                    .header("X-Frame-Options", "SAMEORIGIN")
                    .header("X-XSS-Protection", "1; mode=block")
                    .header("X-Content-Type-Options", "nosniff")
                    .header("Connection", "keep-alive")
                    .entity(user)
                    .build();
        }
        else {
            //System.out.println(getUserList());
            throw new InvalidIdException("ID " + user.getUserId() + " er allerede i brug!");
        }
    }


    // Sletter specifik bruger.
    // Postman DELETE eksempel ***  http://localhost:8080/Lektion12/rest/user/2
    // Med Content-Type: Application/json
    @DELETE
    @Path("{id}") // parameter
    public Response deleteUserDTO(@PathParam("id") int id) {
        UserDTO existing = users.get(id);
        if (existing != null) { //hvis noget eksisterer, så slet. ellers.
            users.remove(id);
            //System.out.println(getUserList());
            return Response.ok("Bruger med ID: "+ id +" slettet.").build();
        } else {
            return Response.status(Status.BAD_REQUEST).entity("Bruger med ID: "+ id +" kan ikke slettes, da den ikke findes.").build();
        }
    }

    @POST
    @Path("{login}")
    @Produces(MediaType.TEXT_PLAIN)
    public Response loginConfirmation(String loginbody) throws InvalidIdException, JSONException {
        JSONObject jsonObject = new JSONObject(loginbody);
        System.out.println("loginbody: "+loginbody);
        int tal = 0;
        UserDTO loginUser = new UserDTO(1,jsonObject.getString("userName"),"ini",jsonObject.getString("password"),new ArrayList<>(Arrays.asList("Admin", "Moderator")));
        boolean b = false;
        for(int i = 1; i<=users.size(); i++){
            System.out.println(i);
            if(users.get(i).getUserName().equals(loginUser.getUserName()) &&
                    users.get(i).getPassword().equals(loginUser.getPassword())){
                b = true;
                tal = i;
                System.out.println("User found!");
            }
        }
        if(b==true){
            System.out.println("Returning success statement");
            return Response
                    .status(200)
                    .type("application/json; charset=utf-8")
                    .header("Status", 200 + " OK")
                    .header("Access-Control-Allow-Origin", "*")
                    .header("Access-Control-Allow-Credentials", true)
                    .header("X-Frame-Options", "SAMEORIGIN")
                    .header("X-XSS-Protection", "1; mode=block")
                    .header("X-Content-Type-Options", "nosniff")
                    .header("Connection", "keep-alive")
                    .entity(users.get(tal))
                    .build();
        }
        else{
            System.out.println("User not found");
            throw new InvalidIdException("Bruger ikke fundet");        }
    }

//    @GET
//    @Path("{username}") // parameter
//    @Produces(MediaType.TEXT_PLAIN)
//    public UserDTO getUser(@PathParam("username") String username) {
//        System.out.println("Fetching userdata from username: "+username);
//        for(int i = 1; i<=users.size(); i++){
//            if(users.get(i).getUserName().equals(username)){
//                System.out.println("User found!");
//                return users.get(i);
//            }
//        }
//        return null;
//    }
} // Slut på UserService klasse.





















