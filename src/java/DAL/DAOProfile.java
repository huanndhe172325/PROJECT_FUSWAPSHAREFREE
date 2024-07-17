/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Like;
import Model.Post;
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

    public void UpdateProfile(String name, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "     SET [Full_Name] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            statement.setInt(2, id);
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

    public boolean UpdateEmailProfile(String email, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Email] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            statement.setInt(2, id);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean UpdatePhoneProfile(String phone, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Phone] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, phone);
            statement.setInt(2, id);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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

    public ArrayList<Like> getPostsByLike(int userId) {
        ArrayList<Like> listLike = new ArrayList<>();
        try {
            String sql = "select * from [Like] \n"
                    + "where UserID = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Like like = new Like(rs.getInt("UserID"), rs.getInt("PostID"));
                listLike.add(like);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listLike;
    }

    public static void main(String[] args) {
        DAOProfile dao = new DAOProfile();
//         ArrayList<Like> listLike = dao.getPostsByLike(2);
//        for (Like like : listLike) {
//            System.out.println(like.toString());
//        }
            
         dao.UpdateEmailProfile("haotom03@gmail.com", 2);
          
    }

}
