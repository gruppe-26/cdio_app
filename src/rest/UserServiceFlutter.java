package rest;


import android.annotation.TargetApi;
import android.os.Build;
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
        users.put(3, new UserDTO(3, "mcm", "mc", "d", new ArrayList<>(Arrays.asList("Admin"))));
        users.put(4, new UserDTO(4, "jenje", "jj", "d", new ArrayList<>(Arrays.asList("Admin"))));
    }

    static PriorityQueue<Integer> queue = new PriorityQueue<Integer>();
    static Queue<Integer> que = new PriorityQueue<>();

    public static int createUserID() {
        if (que.peek() != null) {
            return que.remove();
        } else {
            return users.size() + 1;
        }
    }


    // Getter specifik bruger.
    // Postman GET eksempel ***  http://localhost:8080/Lektion12/rest/userFlutter/2
    @GET
    @Path("{id}") // parameter
    public UserDTO getUserfromID(@PathParam("id") int id) {
        return users.get(id);
    }

    // Getter alle brugere og returnere dem i en  ArrayListe.
    // Postman GET eksempel ***  http://localhost:8080/Lektion12/rest/userFlutter/
    @GET
    public List<UserDTO> getUserList() {
        return new ArrayList<>(users.values());
    }


    @GET
    @Path("{username}") // parameter
    @Produces(MediaType.TEXT_PLAIN)
    public UserDTO getUser(@PathParam("username") String username) {
        for (int i = 1; i <= users.size(); i++) {
            if (username.equals(users.get(i).getUserName())) {
                return users.get(i);
            }
        }
        return null;
    }


    @TargetApi(Build.VERSION_CODES.N)
    @POST
    @Produces(MediaType.TEXT_PLAIN)
    public Response addUserDTOJson(String body) throws InvalidIdException, JSONException {
        System.out.println("Tilføjer indhold...");
        JSONObject jsonObject = new JSONObject(body);

        // roles håndteres fra JSONarray til Java ArrayList.
        ArrayList<String> roles = new ArrayList<String>();
        JSONArray jArray = jsonObject.getJSONArray("roles");
        if (jArray != null) {
            for (int i = 0; i < jArray.length(); i++) {
                roles.add(jArray.getString(i));
            }
        }
        // user oprettes og håndteres fra JSONobjekt til UserDTO.
        UserDTO user = new UserDTO(createUserID(), jsonObject.getString("userName"), jsonObject.getString("ini"), jsonObject.getString("password"), roles);

        //putIfAbsent returner null hvis id ikke eksisterer. returner nøgle-værdien(UserDTO) hvis id eksisterer.
        if (users.putIfAbsent(user.getUserId(), user) == null) {
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
        } else {
            //System.out.println(getUserList());
            throw new InvalidIdException("ID " + user.getUserId() + " er allerede i brug!");
        }
    }

    @PUT
    @Path("{update}")
    @Produces(MediaType.TEXT_PLAIN)
    public Response updateUser(String body) throws InvalidIdException, JSONException {
        System.out.println("Updating user");
        System.out.println("Body" + body);
        JSONObject jsonObject = new JSONObject(body);
        ArrayList<String> roles = new ArrayList<String>();
        JSONArray jArray = jsonObject.getJSONArray("roles");
        if (jArray != null) {
            for (int i = 0; i < jArray.length(); i++) {
                roles.add(jArray.getString(i));
            }
        }
        int userID = jsonObject.getInt("userId");
        // user oprettes og håndteres fra JSONobjekt til UserDTO.
        UserDTO user = new UserDTO(userID, jsonObject.getString("userName"), jsonObject.getString("ini"), jsonObject.getString("password"), roles);
        System.out.println("User" + user);
        users.put(userID, user);
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

    // Sletter specifik bruger.
    // Postman DELETE eksempel ***  http://localhost:8080/Lektion12/rest/user/2
    // Med Content-Type: Application/json
    @DELETE
    @Path("{id}") // parameter
    public Response deleteUserDTO(@PathParam("id") int id) {
        UserDTO existing = users.get(id);
        if (existing != null) { //hvis noget eksisterer, så slet. ellers.
            que.add(id);
            users.remove(id);
            //System.out.println(getUserList());
            return Response.ok("Bruger med ID: " + id + " slettet.").build();
        } else {
            return Response.status(Status.BAD_REQUEST).entity("Bruger med ID: " + id + " kan ikke slettes, da den ikke findes.").build();
        }
    }

    @POST
    @Path("{login}")
    @Produces(MediaType.TEXT_PLAIN)
    public Response loginConfirmation(String loginbody) throws InvalidIdException, JSONException {
        System.out.println("loginbody 1: " + loginbody);
        JSONObject jsonObject = new JSONObject(loginbody);
        System.out.println("loginbody 2: " + loginbody);
        for (int i = 1; i <= users.size(); i++) {
            System.out.println(i);
            if (users.get(i).getUserName().equals(jsonObject.getString("userName")) &&
                    users.get(i).getPassword().equals(jsonObject.getString("password"))) {
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
                        .entity(users.get(i))
                        .build();
            }
        }
        return null;
    }
} // Slut på UserService klasse.





















