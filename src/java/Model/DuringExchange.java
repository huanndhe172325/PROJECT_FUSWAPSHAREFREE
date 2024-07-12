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
public class DuringExchange {
    private int postId;
    private int userRequest;

    public DuringExchange() {
    }

    public DuringExchange(int postId, int userRequest) {
        this.postId = postId;
        this.userRequest = userRequest;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserRequest() {
        return userRequest;
    }

    public void setUserRequest(int userRequest) {
        this.userRequest = userRequest;
    }
    public Post getPost(){
        DAOManagePost dao = new DAOManagePost();
        return dao.getPostByIdPost(postId);
    }
    
    public User getUser(){
        DAOManagePost dao = new DAOManagePost();
        return dao.getUserIdByUserId(userRequest);
    }
}
