/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManagePost;
import DAL.DAOManageUser;

/**
 *
 * @author haoto
 */
public class Like {

    private int userId;
    private int postId;

    public Like(int userId, int postId) {
        this.userId = userId;
        this.postId = postId;
    }

    public Like() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    @Override
    public String toString() {
        return "Like{" + "userId=" + userId + ", postId=" + postId + '}';
    }

    public Post listPostLiked() {
        DAOManagePost dao = new DAOManagePost();
        return dao.getPostByIdPost(postId);
    }

    public User getUserbyPostLiked() {
        DAOManageUser db = new DAOManageUser();        
        return db.getUserByID(userId);
    }
    public static void main(String[] args) {
        Like like = new Like();
        User u = like.getUserbyPostLiked();
        System.out.println(u);
    }

}
