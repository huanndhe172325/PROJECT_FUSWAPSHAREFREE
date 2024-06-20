/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManageUser;

/**
 *
 * @author haoto
 */
public class BlockList {
    int userId;
    int userBlockId;

    public BlockList() {
    }

    public BlockList(int userId, int userBlockId) {
        this.userId = userId;
        this.userBlockId = userBlockId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserBlockId() {
        return userBlockId;
    }

    public void setUserBlockId(int userBlockId) {
        this.userBlockId = userBlockId;
    }
    
    public User getInfoUser() {
        DAOManageUser db = new DAOManageUser();
        return db.getUserByID(userBlockId);
    }
    @Override
    public String toString() {
        return "BlockList{" + "userId=" + userId + ", userBlockId=" + userBlockId + '}';
    }
    
    
}
