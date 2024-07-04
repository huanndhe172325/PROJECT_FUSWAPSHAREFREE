/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManagePost;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class HaveSwap {
    private String requestTime;
    private String description;
    private String status;
    private String image;
    private int myPostIdSwap;
    private int userID;
    private int postID;

    public HaveSwap() {
    }

    public HaveSwap(String requestTime, String description, String status, String image, int myPostIdSwap, int userID, int postID) {
        this.requestTime = requestTime;
        this.description = description;
        this.status = status;
        this.image = image;
        this.myPostIdSwap = myPostIdSwap;
        this.userID = userID;
        this.postID = postID;
    }

    public String getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(String requestTime) {
        this.requestTime = requestTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getMyPostIdSwap() {
        return myPostIdSwap;
    }

    public void setMyPostIdSwap(int myPostIdSwap) {
        this.myPostIdSwap = myPostIdSwap;
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
    
    public String firstImage(){
        String[] i = image.split(",");
        return i[0];
    }
    public List<String> getListImg() {
        if (image == null || image.isEmpty()) {
            return List.of();
        }
        List<String> listImg = new ArrayList<>();
        String[] allImg = image.split(",");
        for (String img : allImg) {
            listImg.add(img);
        }
        return listImg;
    }
}
