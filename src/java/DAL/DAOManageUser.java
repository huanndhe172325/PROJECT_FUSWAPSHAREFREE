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
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author admin
 */
public class DAOManageUser extends DBContext {

   

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

    public List<User> getUsersInSameDistrict(String district) {
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
       
    public List<User> getAllUsersSortedByPoint() {
        List<User> users = new ArrayList<>();
    String sql = "SELECT UserName, Point FROM [User] order by Point desc";
    try {
        PreparedStatement st = connect.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            User user = new User();
            user.setUserName(rs.getString("UserName"));
            user.setPoint(rs.getInt("Point"));
            users.add(user);
        }

        // Sắp xếp danh sách users theo thuộc tính Point

    } catch (Exception e) {
        e.printStackTrace();
    }
    return users;
    }
    public static void main(String[] args) {
        DAOManageUser dao = new DAOManageUser();
        List<User> users = dao.getAllUsersSortedByPoint(); 

        for (User user : users) {
           
            System.out.println("Point: " + user.getPoint());
        }

    }
}


