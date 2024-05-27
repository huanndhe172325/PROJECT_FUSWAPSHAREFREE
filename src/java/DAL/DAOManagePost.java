/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Post;
import Model.Quanlity;
import Model.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author FPT
 */
public class DAOManagePost extends DBContext {

    public ArrayList<Type> getAllType() {
        ArrayList<Type> listType = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Type";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Type type = new Type();
                type.setTypeID(rs.getInt("TypeID"));
                type.setName(rs.getString("Name"));
                listType.add(type);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listType;
    }

    public ArrayList<Quanlity> getAllQuanlity() {
        ArrayList<Quanlity> listQuanlity = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Quanlity";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Quanlity quan = new Quanlity();
                quan.setQuanlityID(rs.getInt("QuanlityID"));
                quan.setName(rs.getString("Name"));
                listQuanlity.add(quan);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listQuanlity;
    }

    public boolean createPost(Post newPost, int dateExpires, String desire, int userId) {
        String sql = "INSERT INTO [dbo].[Post]\n"
                + "           ([Title]\n"
                + "           ,[Description]\n"
                + "           ,[intructions]\n"
                + "           ,[ExpiresDate]\n"
                + "           ,[ImageUrl]\n"
                + "           ,[Desire]\n"
                + "           ,[Commune]\n"
                + "           ,[District]\n"
                + "           ,[Street_Number]\n"
                + "           ,[CreateTime]\n"
                + "           ,[UserID]\n"
                + "           ,[StatusID]\n"
                + "           ,[QuanlityID]\n"
                + "           ,[TypeID])\n"
                + "     VALUES\n"
                + "           (?,?,?,DATEADD(day, ?, GETDATE()),?,?,?,?,?,GETDATE(),?,?,?,?)";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, newPost.getTitle());
            statement.setString(2, newPost.getDescription());
            statement.setString(3, newPost.getIntructions());
            statement.setInt(4, dateExpires);
            statement.setString(5, newPost.getImageUrl());
            statement.setString(6, desire);
            statement.setString(7, newPost.getCommune());
            statement.setString(8, newPost.getDistrict());
            statement.setString(9, newPost.getStreet_Number());
            statement.setInt(10, userId);
            statement.setInt(11, newPost.getStatusID());
            statement.setInt(12, newPost.getQuanlityID());
            statement.setInt(13, newPost.getTypeID());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public int getMaxIdPost() {
        int maxId = 1;
        try {
            String sql = "select max(PostID) as MaxIdPost from Post";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt("MaxIdPost");
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            return maxId;
        }
        return maxId;
    }

    public static void main(String[] args) {
        DAOManagePost dao = new DAOManagePost();
//        Post newPost = new Post();
//        newPost.setTitle("Post Title");
//        newPost.setDescription("Post Description");
//        newPost.setIntructions("Post Instructions");
//        newPost.setImageUrl("http://example.com/image.jpg");
//        newPost.setCommune("Commune Name");
//        newPost.setDistrict("District Name");
//        newPost.setStreet_Number("Street Number");
//        newPost.setStatusID(1);
//        newPost.setQuanlityID(1);
//        newPost.setTypeID(1);
//
//        boolean result = dao.createPost(newPost, 7, null, 1);
//
//        System.out.println("Post creation successful: " + result);


    }
}
