/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManageUser;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author FPT
 */
public class Notification {
    private int notiId;
    private String descripton;
    private String createTime;
    private int userSendID;
    private int postID;
    private int userReceiveID;
    private int statusNoti;

    public Notification() {
    }

    public Notification(int notiId, String descripton, String createTime, int userSendID, int postID, int userReceiveID, int statusNoti) {
        this.notiId = notiId;
        this.descripton = descripton;
        this.createTime = createTime;
        this.userSendID = userSendID;
        this.postID = postID;
        this.userReceiveID = userReceiveID;
        this.statusNoti = statusNoti;
    }

    
    
    public int getStatusNoti() {
        return statusNoti;
    }

    public void setStatusNoti(int statusNoti) {
        this.statusNoti = statusNoti;
    }

    public int getNotiId() {
        return notiId;
    }

    public void setNotiId(int notiId) {
        this.notiId = notiId;
    }

    public String getDescripton() {
        return descripton;
    }

    public void setDescripton(String descripton) {
        this.descripton = descripton;
    }

    public String getCreateTime() {
        return createTime.substring(0, 10);
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getUserSendID() {
        return userSendID;
    }

    public void setUserSendID(int userSendID) {
        this.userSendID = userSendID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getUserReceiveID() {
        return userReceiveID;
    }

    public void setUserReceiveID(int userReceiveID) {
        this.userReceiveID = userReceiveID;
    }

    public User getUserSent(){
        DAOManageUser dao = new DAOManageUser();
        User user = dao.getUserByID(userSendID);
        return user;
    }
    
    public String getAvatarUserSent(){
        return getUserSent().getAvatarUrl();
    }
        
    public String getFullNameUserSent(){
        return getUserSent().getFull_Name();
    }
    
    public String calulateDate(){
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        LocalDateTime pastDateTime = LocalDateTime.parse(getCreateTime(), formatter);
        LocalDateTime now = LocalDateTime.now();

        Duration duration = Duration.between(pastDateTime, now);
        long minutes = duration.toMinutes();
        long hours = duration.toHours();
        long days = duration.toDays();

        if (minutes < 60) {
            return minutes + " minutes";
        } else if (hours < 24) {
            return hours + " hours";
        } else {
            return days + " days";
        }
    }
}
