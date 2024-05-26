/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author Binhtran
 */
public class PasswordReset {

    private int UserID;
    private String Password;
    private String ExpiryDateTime;

    public PasswordReset() {
    }

    public PasswordReset(int UserID, String Password, String ExpiryDateTime) {
        this.UserID = UserID;
        this.Password = Password;
        this.ExpiryDateTime = ExpiryDateTime;
    }

   

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getExpiryDateTime() {
        return ExpiryDateTime;
    }

    public void setExpiryDateTime(String ExpiryDateTime) {
        this.ExpiryDateTime = ExpiryDateTime;
    }

    

}
