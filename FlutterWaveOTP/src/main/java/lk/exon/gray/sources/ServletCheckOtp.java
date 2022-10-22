package lk.exon.gray.sources; /**
 * Created by IntelliJ IDEA Ultimate.
 * User: Pasindu Raveen
 * Date: 11/16/2021
 * Time: 6:44 PM
 * FlutterWaveOTP
 */

import com.google.gson.Gson;
import lk.exon.gray.entity.Customer;
import lk.exon.gray.entity.OtpResponse;
import okhttp3.*;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "ServletCheckOtp", value = "/servletcheckotp")
public class ServletCheckOtp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson g = new Gson();
        OkHttpClient client = new OkHttpClient();
        Customer cus = new Customer("Test", "fashionoptical268@gmail.com", "+2348104939419");
        String[] medium = {"whatsapp"};
        JSONObject j = new JSONObject();
        j.put("length", "7");
        j.put("customer", new JSONObject(cus));
        j.put("sender", "EXON");
        j.put("send", true);
        j.put("medium", medium);
        j.put("expiry", 5);
        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, j.toString());
//        RequestBody body = RequestBody.create(mediaType, "{\"length\":0,\"customer\":\"string\",\"sender\":\"string\",\"send\":\"string\",\"medium\":\"string\",\"expiry\":0}");
        Request req = new Request.Builder()
                .url("https://api.flutterwave.com/v3/otps")
                .post(body)
                .addHeader("Accept", "application/json")
//                .addHeader("Authorization", "Bearer FLWSECK_TEST-SANDBOXDEMOKEY-X")
                .addHeader("Authorization", "Bearer FLWSECK_TEST-feba6399784729b1bb3418edf079cb25-X")
                .addHeader("Content-Type", "application/json")
                .build();
        Response resp = client.newCall(req).execute();
        System.out.println("Response : " + resp.message());
        OtpResponse fromJson = g.fromJson(resp.peekBody(2048).string(), OtpResponse.class);
        System.out.println(fromJson.getMessage());
        if (fromJson.getMessage() != null) {
            JSONObject obj = new JSONObject();
            System.out.println("Response Data ---- " + resp.peekBody(2048).string());
            obj.put("status", true);
            obj.put("msg", fromJson.getMessage());
            obj.put("otp", fromJson.getData().get(0).getOtp());
            obj.put("ref", fromJson.getData().get(0).getReference());
            response.getWriter().write(obj.toString());
        } else {
            response.getWriter().write("Fail");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OkHttpClient client = new OkHttpClient();
        HashMap<String, Object> j = new HashMap<String, Object>();
        String otp = request.getParameter("otp");
        String ref = request.getParameter("ref");
        System.out.println("OTP--------- :" + otp);
//        j.put("otp", Integer.valueOf(otp));
        MediaType mediaType = MediaType.parse("application/json");
//        System.out.println("JSON----- " + j);
//        RequestBody body = RequestBody.create(mediaType, j.toString());
        RequestBody body = RequestBody.create(mediaType, "{\"otp\":"+otp+"}");
        Request req = new Request.Builder()
                .url("https://api.flutterwave.com/v3/otps/" + ref + "/validate")
                .post(body)
                .addHeader("Accept", "application/json")
//                .addHeader("Authorization", "Bearer FLWSECK_TEST-SANDBOXDEMOKEY-X")
                .addHeader("Authorization", "Bearer FLWSECK_TEST-feba6399784729b1bb3418edf079cb25-X")
                .addHeader("Content-Type", "application/json")
                .build();
        Response resp = client.newCall(req).execute();
        System.out.println("Response : " + resp.code());
        System.out.println("Response : " + resp.peekBody(2048).string());
        new JSONObject(resp.peekBody(2048).string());
    }
}
