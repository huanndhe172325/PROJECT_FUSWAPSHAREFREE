/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManagePost;

/**
 *
 * @author Binhtran
 */
public class Friends {

    private int userID;
    private int friendUserID;

    public Friends() {
    }

    public Friends(int userID, int friendUserID) {
        this.userID = userID;
        this.friendUserID = friendUserID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getFriendUserID() {
        return friendUserID;
    }

    public void setFriendUserID(int friendUserID) {
        this.friendUserID = friendUserID;
    }

    @Override
    public String toString() {
        return "ListFriends{"
                + "userID=" + userID
                + ", friendUserID=" + friendUserID
                + '}';
    }

    public User getUserOwner() {
        DAOManagePost dao = new DAOManagePost();
        User user = dao.getUserIdByUserId(friendUserID);
        return user;
    }

    public String getAvatarOwner() {
        return getUserOwner().getAvatarUrl();
    }

    public String getFullNameOwner() {
        return getUserOwner().getFull_Name();
    }

    public int getNumberPostOfFriends() {
        DAOManagePost dao = new DAOManagePost();
        return dao.getNumberPostOfFriends(friendUserID);
    }

    public int getNumberFriends() {
        DAOManagePost dao = new DAOManagePost();
        return dao.getNumberFriends(friendUserID);
    }

    public int getPoint() {
        return getUserOwner().getPoint();
    }
    public String getdistrict() {
        return getUserOwner().getCommune() + " , " +getUserOwner().getDistrict();
    }
}
