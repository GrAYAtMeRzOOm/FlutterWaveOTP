package lk.exon.gray.arc.servlets; /**
 * Created by IntelliJ IDEA Ultimate.
 * User: Pasindu Raveen
 * Date: 11/17/2021
 * Time: 11:17 AM
 * FlutterWavePayementGateway
 */

import com.google.gson.Gson;
import lk.exon.gray.arc.entities.Customer;
import lk.exon.gray.arc.entities.PaymentResponse;
import okhttp3.*;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "ServletPayement", value = "/servletpayement")
public class ServletPayement extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<String, String[]> map = request.getParameterMap();
        for (Map.Entry<String, String[]> en : map.entrySet()) {
            String key = en.getKey();
            String[] value = en.getValue();
            System.out.println("Key : " + key);
            System.out.println("Values : " + Arrays.toString(value));
        }
        if (request.getParameter("status").equals("cancelled")) {
            System.out.println("Transaction Cancelled for the ref no : " + request.getParameter("tx_ref"));
        }else if (request.getParameter("status").equals("successful")){
            response.sendRedirect("http://5.189.163.58:8080/flutterwavepayementgateway/PaymentSuccess.jsp?ref="+request.getParameter("tx_ref"));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("amount");
        String uuid = request.getParameter("uuid");
        System.out.println("amount " + amount);
        System.out.println("uuid " + uuid);
        if (amount != null) {
            Gson g = new Gson();
            OkHttpClient client = new OkHttpClient();
            Customer cus = new Customer("Test", "fashionoptical268@gmail.com", "+947850w" +
                    "52002");
            JSONObject reqBody = new JSONObject();
            JSONObject meta = new JSONObject();
            JSONObject customizations = new JSONObject();
            meta.put("consumer_id", 1);
            meta.put("consumer_mac", "00-14-22");
            customizations.put("title", "ARC Payments");
            customizations.put("description", "Unified E-commerce Platform, Descentralised Chain Operation");
            customizations.put("logo", "http://responseaquire.me/assets/frontend/images/Logo1.png");
            reqBody.put("tx_ref", UUID.randomUUID().toString() + "ARC.EXON.PAY");
            reqBody.put("amount", Integer.valueOf(amount));
            reqBody.put("customer", new JSONObject(cus));
            reqBody.put("redirect_url", "http://5.189.163.58:8080/flutterwavepayementgateway/servletpayement");
            reqBody.put("payment_options", "card");
            reqBody.put("currency", "NGN");
            reqBody.put("meta", meta);
            reqBody.put("customizations", customizations);
            MediaType mediaType = MediaType.parse("application/json");
            RequestBody body = RequestBody.create(mediaType, reqBody.toString());
            Request req = new Request.Builder()
                    .url("https://api.flutterwave.com/v3/payments")
                    .post(body)
                    .addHeader("Accept", "application/json")
                    .addHeader("Authorization", "Bearer FLWSECK_TEST-SANDBOXDEMOKEY-X")
//                .addHeader("Authorization", "Bearer FLWSECK_TEST-feba6399784729b1bb3418edf079cb25-X")
                    .build();
            Response resp = client.newCall(req).execute();
            System.out.println("Response : " + resp.message());
//        PaymentResponse fromJson = g.fromJson(resp.peekBody(2048).string(), PaymentResponse.class);
            System.out.println("Response Body : " + resp.peekBody(2048).string());
            JSONObject respObj = new JSONObject(resp.peekBody(2048).string());
            JSONObject sendResponse = new JSONObject();
            if (respObj.get("status").equals("success")) {
                System.out.println("msg : " + respObj.get("message"));
                sendResponse.put("status", true);
                sendResponse.put("link", new JSONObject(respObj.get("data").toString()).get("link").toString());
            } else {
                sendResponse.put("status", false);
                sendResponse.put("massage", "flutterwave payment error");
            }
            response.getWriter().println(sendResponse);
        }
    }
}
