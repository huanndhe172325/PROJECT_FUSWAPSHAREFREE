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
        String sql = "Select * from [User] \n"
                + "where UserID = ?";
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

    public void UpdateProfile(String name, String email, String phone,String avatarUrl, String district, String commune, String snumber, String id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Email] = ?\n"
                + "      ,[Phone] = ?     \n"
                + "      ,[AvatarUrl] = ?     \n"
                + "      ,[Full_Name] = ?\n"
                + "      ,[District] = ?\n"
                + "      ,[Commune] = ?\n"
                + "      ,[StreetNumber] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, phone);
            statement.setString(3, avatarUrl);
            statement.setString(4, name);
            statement.setString(5, district);
            statement.setString(6, commune);
            statement.setString(7, snumber);
            statement.setString(8, id);

            ResultSet rs = statement.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAOProfile dao = new DAOProfile();
//        dao.UpdateProfile("vinhhao", "123@123", "01234567", "https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg", "thanh oai", "kim bai", "12", "1");
        
    }
}
