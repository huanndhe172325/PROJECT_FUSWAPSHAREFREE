/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManagePost;
import DAL.DAOManageUser;

/**
 *
 * @author FPT
 */
public class User {

    private int UserID;
    private String Email;
    private String Phone;
    private String avatarUrl;
    private String PassWord;
    private String JoinDate;
    private String UserName;
    private String Full_Name;
    private String District;
    private String Commune;
    private String StreetNumber;
    private int Point;
    private int RoleID;
    private int StatusID;

    public User(int UserID, String Email, String Phone, String avatarUrl, String PassWord, String JoinDate, String UserName, String Full_Name, String District, String Commune, String StreetNumber, int Point, int RoleID, int StatusID) {
        this.UserID = UserID;
        this.Email = Email;
        this.Phone = Phone;
        this.avatarUrl = avatarUrl;
        this.PassWord = PassWord;
        this.JoinDate = JoinDate;
        this.UserName = UserName;
        this.Full_Name = Full_Name;
        this.District = District;
        this.Commune = Commune;
        this.StreetNumber = StreetNumber;
        this.Point = Point;
        this.RoleID = RoleID;
        this.StatusID = StatusID;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public User() {
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        this.UserID = userID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String PassWord) {
        this.PassWord = PassWord;
    }

    public String getJoinDate() {
        return JoinDate;
    }

    public void setJoinDate(String JoinDate) {
        this.JoinDate = JoinDate;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getFull_Name() {
        return Full_Name;
    }

    public void setFull_Name(String Full_Name) {
        this.Full_Name = Full_Name;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public String getCommune() {
        return Commune;
    }

    public void setCommune(String Commune) {
        this.Commune = Commune;
    }

    public String getStreetNumber() {
        return StreetNumber;
    }

    public void setStreetNumber(String StreetNumber) {
        this.StreetNumber = StreetNumber;
    }

    public int getPoint() {
        return Point;
    }

    public void setPoint(int Point) {
        this.Point = Point;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    public int getPostCount() {
        DAOManagePost dao = new DAOManagePost();
        return dao.countPostsByUserId(UserID);
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", Email=" + Email + ", Phone=" + Phone + ", avatarUrl=" + avatarUrl + ", PassWord=" + PassWord + ", JoinDate=" + JoinDate + ", UserName=" + UserName + ", Full_Name=" + Full_Name + ", District=" + District + ", Commune=" + Commune + ", StreetNumber=" + StreetNumber + ", Point=" + Point + ", RoleID=" + RoleID + ", StatusID=" + StatusID + '}';
    }

}
