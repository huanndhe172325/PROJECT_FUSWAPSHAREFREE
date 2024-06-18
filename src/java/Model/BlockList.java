/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author haoto
 */
public class BlockList {
    int idUser;
    User idBlockUser;

    public BlockList() {
    }

    public BlockList(int idUser, User idBlockUser) {
        this.idUser = idUser;
        this.idBlockUser = idBlockUser;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public User getIdBlockUser() {
        return idBlockUser;
    }
    
    public String getFulL_Name() {
        return getIdBlockUser().getFull_Name();
    }
    public void setIdBlockUser(User idBlockUser) {
        this.idBlockUser = idBlockUser;
    }
    
    @Override
    public String toString() {
        return "BlockList{" + "idUser=" + idUser + ", idBlockUser=" + idBlockUser + '}';
    }

    
    
    
}
