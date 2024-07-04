/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManagePost;

/**
 *
 * @author FPT
 */
public class Request {
    private String requestTime;
    private String message;
    private String status;
    private int userID;
    private int postID;

    public Request() {
    }

    public Request(String requestTime, String message, String status, int userID, int postID) {
        this.requestTime = requestTime;
        this.message = message;
        this.status = status;
        this.userID = userID;
        this.postID = postID;
    }

    public String getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(String requestTime) {
        this.requestTime = requestTime;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }
    
    public User getUserOwner() {
        DAOManagePost dao = new DAOManagePost();
        User user = dao.getUserIdByUserId(userID);
        return user;
    }
    
    public String getAvatarOwner() {
        return getUserOwner().getAvatarUrl();
    }

    public String getFullNameOwner() {
        return getUserOwner().getFull_Name();
    }
    
    
}
