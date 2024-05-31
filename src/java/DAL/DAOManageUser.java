/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Quanlity;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public  ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setDistrict(rs.getString("District"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setStatusID(rs.getInt("StatusID"));
                users.add(user);
            }

            // Sắp xếp danh sách users theo thuộc tính Point
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public void updateUser(User user) {

        try {
            String sql = "UPDATE [User]\n"
                    + "   SET [RoleID] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, user.getRoleID());
            stm.setInt(2, user.getUserID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void updateStatus(int UserID, int stt) {

        try {
            String sql = "UPDATE [User]\n"
                    + "   SET [StatusID] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, stt);
            stm.setInt(2, UserID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public User getUserByID(int UserID) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE UserID = ?\n";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("AvatarUrl"),
                        rs.getString("PassWord"),
                        rs.getString("JoinDate"),
                        rs.getString("UserName"),
                        rs.getString("Full_Name"),
                        rs.getString("District"),
                        rs.getString("Commune"),
                        rs.getString("StreetNumber"),
                        rs.getInt("Point"),
                        rs.getInt("RoleID"),
                        rs.getInt("StatusID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        DAOManageUser dao = new DAOManageUser();
        List<User> users = dao.getAllUsersSortedByPoint();

        for (User user : users) {

            System.out.println("Point: " + user.getPoint());
        }

    }
}
