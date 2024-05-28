/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DAL.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.User;
import static java.lang.String.format;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author admin
 */
public class DAOSignup extends DBContext {

    public void insertAccount(String email, String phone, String password, String username, String fullname, String district,String commune, String streetnumber, int Point, int RoleID, int StatusID,String joinDate) {
        try {

           
            String sql = "INSERT INTO [User] (Email, Phone, PassWord, JoinDate, UserName, Full_Name, District, Commune, StreetNumber, Point, RoleID, StatusID) VALUES (?, ?, ?, GETDATE(), ?, ?, ?, ?, ?, 0, 1, 1)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, phone);
            stm.setString(3, password);
            stm.setString(4, joinDate);
            stm.setString(5, username);
            stm.setString(6, fullname);
            stm.setString(7, district);
            stm.setString(8, commune);
            stm.setString(9, streetnumber);
            stm.setInt(10, Point);
            stm.setInt(11, RoleID);
            stm.setInt(12, StatusID);
            stm.executeUpdate();
        } catch (SQLException ex) {
          
        }

    }

   

    public List<User> getAllAccount() {
        List<User> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User where isAdmin != 1";
            PreparedStatement stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserID(rs.getInt(1));
                u.setEmail(rs.getString(2));
                u.setPhone(rs.getString(3));

                u.setPassWord(rs.getString(4));
               // rs.getDate(u.getJoinDate());
                u.setUserName(rs.getString(6));
                u.setFull_Name(rs.getString(7));
                u.setDistrict(rs.getString(8));
                u.setCommune(rs.getString(9));
                u.setStreetNumber(rs.getString(10));
                u.setPoint(rs.getInt(11));
                u.setRoleID(rs.getInt(12));
                u.setStatusID(rs.getInt(13));

                list.add(u);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOSignup.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateAccount(User user) {

        try {
            String sql = "UPDATE [User]\n"
                    + "   SET [StatusID] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, user.getStatusID());
            stm.setInt(2, user.getUserID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSignup.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public User getUserIdByEmail(String UserName) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE UserName = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, UserName);
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

}
