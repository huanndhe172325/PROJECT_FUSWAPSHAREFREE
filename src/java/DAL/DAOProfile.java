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
        String sql = "SELECT * FROM [User] \n"
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

    public void UpdateProfile(String pass, String name, String email,String phone, String district, String commune, String snumber,String id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Email] = ?\n"
                + "      ,[Phone] = ?     \n"
                + "      ,[PassWord] = ?     \n"              
                + "      ,[Full_Name] = ?\n"
                + "      ,[District] = ?\n"
                + "      ,[Commune] = ?\n"
                + "      ,[StreetNumber] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, phone);
            statement.setString(3, pass);
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
        dao.UpdateProfile("12345687", "Khuong Ngu", "haotvhe172558@fpt.edu.vn", "0987654321", "Ung Hoa", "Vien Noi", "12", "1");
        System.out.println();
    }
}
