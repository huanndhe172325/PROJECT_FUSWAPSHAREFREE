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

    public User getUserbyId(int id) {
        try {
            String sql = "SELECT * FROM [User] where UserId=?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(5),
                        rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11),
                        rs.getInt(12), rs.getInt(13), rs.getInt(14));

            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void UpdateProfile(String name, String email,String phone, String district, String commune, String snumber,String id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Email] = ?\n"
                + "      ,[Phone] = ?     \n"             
                + "      ,[Full_Name] = ?\n"
                + "      ,[District] = ?\n"
                + "      ,[Commune] = ?\n"
                + "      ,[StreetNumber] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, phone);
            statement.setString(3, name);
            statement.setString(4, district);
            statement.setString(5, commune);
            statement.setString(6, snumber);
            statement.setString(7, id);

            ResultSet rs = statement.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAOProfile dao = new DAOProfile();
        dao.UpdateProfile("Khuong Ngu", "haotvhe172558@fpt.edu.vn", "0987654321", "Ung Hoa", "Vien Noi", "12", "1");
        System.out.println();
    }
}
