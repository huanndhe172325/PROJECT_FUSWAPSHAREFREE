/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Quanlity;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class DAOGetUserNearMe extends DBContext {
    public int getIdByUser(String username){
        int n=-1;
        String sql="Select UserID from [User] where UserName=?";
        try{
                        PreparedStatement st = connect.prepareStatement(sql);
                        st.setString(1, username);
                                    ResultSet rs = st.executeQuery();
                                    
                                    while(rs.next()){
                                        n= rs.getInt("UserID");
                                    }
        }catch(Exception e){
            System.out.println(e);
        }
        return n;
    }
    public String getDistrict(int userId) {
        String sql = "SELECT District FROM [User] WHERE UserID = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("District");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<User> getUsersInSameDistrict(String district){
        List<User> users = new ArrayList<>();
        String sql = "SELECT UserName, District FROM [User] WHERE District =?";
  try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, district);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("UserName"));

                user.setDistrict(rs.getString("District"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public static void main(String[] args) {
        DAOGetUserNearMe dao = new DAOGetUserNearMe();
        String id = dao.getDistrict(1);
        List<User> s=dao.getUsersInSameDistrict(id);
       for(User x:s){
           System.out.println(x.getUserName());
           System.out.println(x.getDistrict());
       }
        System.out.println(id);
    }

}
