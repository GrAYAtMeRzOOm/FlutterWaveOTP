package lk.exon.gray.arc.entities;

import java.util.Date;

/**
 * Created by IntelliJ IDEA Ultimate.
 * User: Pasindu Raveen
 * Date: 11/16/2021
 * Time: 7:45 PM
 * FlutterWaveOTP
 */
public class Data {
    private String medium;
    private String reference;
    private String otp;
    private Date expiry;

    public Data() {
    }

    public Data(String medium, String reference, String otp, Date expiry) {
        this.medium = medium;
        this.reference = reference;
        this.otp = otp;
        this.expiry = expiry;
    }

    public String getMedium() {
        return medium;
    }

    public void setMedium(String medium) {
        this.medium = medium;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public Date getExpiry() {
        return expiry;
    }

    public void setExpiry(Date expiry) {
        this.expiry = expiry;
    }
}
