package rest;

import dto.UserDTO;
import org.json.JSONArray;
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
        UserDTO user = new UserDTO(1, "Tristan", "TES", "Hund123", new ArrayList<>());
        users.put(1, new UserDTO(1, "Tristan", "TES", "Hund123", new ArrayList<>(Arrays.asList("Admin", "Moderator"))));
        users.put(2, new UserDTO(2, "Stig", "SMN", "Kat123", new ArrayList<>(Arrays.asList("Far"))));
        users.put(3, new UserDTO(3, "mcm", "mc", "pass", new ArrayList<>()));
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
    @Path("{id}") // parameter
    public UserDTO getUser(@PathParam("id") int id) { return users.get(id); }


    @POST
    @Produces(MediaType.TEXT_PLAIN)
    public Response addUserDTOJson(String body) throws InvalidIdException {
        System.out.println("Tilføjer indhold...");
        JSONObject jsonObject = new JSONObject(body);

        // roles håndteres fra JSONarray til Java ArrayList. Akavet måde?
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
            System.out.println("Indhold tilføjet! Wuhu!");

            System.out.println(getUserList()); // printer brugere fra Mappen. Til test formål.
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
            System.out.println(getUserList());
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

} // Slut på UserService klasse.