package lk.exon.gray.arc.servlets; /**
 * Created by IntelliJ IDEA Ultimate.
 * User: Pasindu Raveen
 * Date: 11/17/2021
 * Time: 3:50 PM
 * FlutterWavePayementGateway
 */

import com.google.gson.Gson;
import lk.exon.gray.arc.entities.Customer;
import okhttp3.*;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "ServletTransfer", value = "/servlettransfer")
public class ServletTransfer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        for (Map.Entry<String, String[]> en : map.entrySet()) {
            String key = en.getKey();
            String[] value = en.getValue();
            System.out.println("Key : " + key);
            System.out.println("Values : " + Arrays.toString(value));
        }
        String status = request.getParameter("status");
        if (status.equals("success")) {
            System.out.println(request.getParameter("message"));
            JSONObject data = new JSONObject(request.getParameter("data"));
            response.addHeader("data", data.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("amount");
        /*Map<String, String[]> map = request.getParameterMap();
        for (Map.Entry<String, String[]> en : map.entrySet()) {
            String key = en.getKey();
            String[] value = en.getValue();
            System.out.println("Key : " + key);
            System.out.println("Values : " + Arrays.toString(value));
        }*/
        System.out.println("amount " + amount);
        if (amount != null) {
            Gson g = new Gson();
            OkHttpClient client = new OkHttpClient();
            JSONObject reqBody = new JSONObject();
            reqBody.put("account_bank", request.getParameter("account_bank"));
            reqBody.put("account_number", request.getParameter("account_number"));
            reqBody.put("amount", Double.valueOf(request.getParameter("amount")));
            reqBody.put("callback_url", "http://5.189.163.58:8080/flutterwavepayementgateway/servlettransfer");
            reqBody.put("narration", request.getParameter("narration"));
            reqBody.put("currency", request.getParameter("currency"));
            reqBody.put("reference", request.getParameter("reference"));
            reqBody.put("debit_currency", request.getParameter("debit_currency"));
            MediaType mediaType = MediaType.parse("application/json");
            RequestBody body = RequestBody.create(mediaType, reqBody.toString());
            Request req = new Request.Builder()
                    .url("https://api.flutterwave.com/v3/transfers")
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
            System.out.println(respObj);
            String status = respObj.getString("status");
            if (status.equals("success")) {
                System.out.println(respObj.get("message").toString());
                request.setAttribute("data", respObj);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PaymentCheckout.jsp");
                dispatcher.forward(request, response);
            } else if (status.equals("error")) {
                response.getWriter().write(respObj.get("message").toString());
            }
        }
    }
}
