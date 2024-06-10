/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Binhtran
 */
public class EmailVerification {

    private int userId;
    private String otp;
    private String expiryDateTime;

    public EmailVerification() {
    }

    public EmailVerification(int userId, String otp, String expiryDateTime) {
        this.userId = userId;
        this.otp = otp;
        this.expiryDateTime = expiryDateTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public String getExpiryDateTime() {
        return expiryDateTime;
    }

    public void setExpiryDateTime(String expiryDateTime) {
        this.expiryDateTime = expiryDateTime;
    }

}
