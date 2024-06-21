/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author haoto
 */
public class DAOProfile extends DBContext {

    public User getUserbyId(int UserID) {
        String sql = """
                     Select * from [User] 
                     where UserID = ?""";
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

    public void UpdateProfile(String name, String email, String phone, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Email] = ?\n"
                + "      ,[Phone] = ?     \n"
                + "      ,[Full_Name] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, phone);
            statement.setString(3, name);
            statement.setInt(4, id);
            ResultSet rs = statement.executeQuery();
        } catch (Exception e) {
        }
    }
    
     public void UpdateAvatarProfile(String avtUrl, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [AvatarUrl] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
           
            statement.setString(1, avtUrl);
            statement.setInt(2, id);
            ResultSet rs = statement.executeQuery();
        } catch (Exception e) {
        }
    }

    public void UpdateLocation(String district, String commune, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [District] = ?\n"
                + "      ,[Commune] = ?     \n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, district);
            statement.setString(2, commune);

            statement.setInt(3, id);
            ResultSet rs = statement.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAOProfile dao = new DAOProfile();
         User n = dao.getUserbyId(2);
         System.out.println(n.toString());   
    }

   
}
