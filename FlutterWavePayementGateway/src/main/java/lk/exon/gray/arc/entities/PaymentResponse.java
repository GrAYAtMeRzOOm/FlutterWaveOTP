package lk.exon.gray.arc.entities;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA Ultimate.
 * User: Pasindu Raveen
 * Date: 11/16/2021
 * Time: 7:42 PM
 * FlutterWaveOTP
 */
public class PaymentResponse {
    private String status;
    private String message;
    private ArrayList<Data> data;

    public PaymentResponse() {
    }

    public PaymentResponse(String status, String message, ArrayList<Data> data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ArrayList<Data> getData() {
        return data;
    }

    public void setData(ArrayList<Data> data) {
        this.data = data;
    }
}
