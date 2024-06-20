/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Post;
import Model.Quanlity;
import Model.Type;
import Model.User;
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

    public ArrayList<Post> getAllPost() {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post ORDER BY CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("PostID"));
                post.setTitle(rs.getString("Title"));
                post.setDescription(rs.getString("Description"));
                post.setIntructions(rs.getString("intructions"));
                post.setExpiresDate(rs.getString("ExpiresDate"));
                post.setImageUrl(rs.getString("ImageUrl"));
                post.setDesire(rs.getString("Desire"));
                post.setCommune(rs.getString("Commune"));
                post.setDistrict(rs.getString("District"));
                post.setStreet_Number(rs.getString("Street_Number"));
                post.setCreateTime(rs.getString("CreateTime"));
                post.setUserID(rs.getInt("UserID"));
                post.setStatusID(rs.getInt("StatusID"));
                post.setQuanlityID(rs.getInt("QuanlityID"));
                post.setTypeID(rs.getInt("TypeID"));
                listPost.add(post);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPost;
    }

    public ArrayList<Post> getPostNewest() {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post ORDER BY CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("PostID"));
                post.setTitle(rs.getString("Title"));
                post.setDescription(rs.getString("Description"));
                post.setIntructions(rs.getString("intructions"));
                post.setExpiresDate(rs.getString("ExpiresDate"));
                post.setImageUrl(rs.getString("ImageUrl"));
                post.setDesire(rs.getString("Desire"));
                post.setCommune(rs.getString("Commune"));
                post.setDistrict(rs.getString("District"));
                post.setStreet_Number(rs.getString("Street_Number"));
                post.setCreateTime(rs.getString("CreateTime"));
                post.setUserID(rs.getInt("UserID"));
                post.setStatusID(rs.getInt("StatusID"));
                post.setQuanlityID(rs.getInt("QuanlityID"));
                post.setTypeID(rs.getInt("TypeID"));
                listPost.add(post);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPost;
    }

    public ArrayList<Post> getPostsByTypeID(int typeId) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post WHERE TypeID = ? ORDER BY CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, typeId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("PostID"));
                post.setTitle(rs.getString("Title"));
                post.setDescription(rs.getString("Description"));
                post.setIntructions(rs.getString("intructions"));
                post.setExpiresDate(rs.getString("ExpiresDate"));
                post.setImageUrl(rs.getString("ImageUrl"));
                post.setDesire(rs.getString("Desire"));
                post.setCommune(rs.getString("Commune"));
                post.setDistrict(rs.getString("District"));
                post.setStreet_Number(rs.getString("Street_Number"));
                post.setCreateTime(rs.getString("CreateTime"));
                post.setUserID(rs.getInt("UserID"));
                post.setStatusID(rs.getInt("StatusID"));
                post.setQuanlityID(rs.getInt("QuanlityID"));
                post.setTypeID(rs.getInt("TypeID"));
                listPost.add(post);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPost;
    }

    public ArrayList<Post> getPostsByQuanlityID(int quanlityId) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post WHERE QuanlityID = ? ORDER BY CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, quanlityId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("PostID"));
                post.setTitle(rs.getString("Title"));
                post.setDescription(rs.getString("Description"));
                post.setIntructions(rs.getString("intructions"));
                post.setExpiresDate(rs.getString("ExpiresDate"));
                post.setImageUrl(rs.getString("ImageUrl"));
                post.setDesire(rs.getString("Desire"));
                post.setCommune(rs.getString("Commune"));
                post.setDistrict(rs.getString("District"));
                post.setStreet_Number(rs.getString("Street_Number"));
                post.setCreateTime(rs.getString("CreateTime"));
                post.setUserID(rs.getInt("UserID"));
                post.setStatusID(rs.getInt("StatusID"));
                post.setQuanlityID(rs.getInt("QuanlityID"));
                post.setTypeID(rs.getInt("TypeID"));
                listPost.add(post);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPost;
    }

    public int countPostsByUserId(int idUser) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM Post WHERE UserID = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, idUser);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public int getStatusIDByPostID(int postID) {
        int statusID = -1;
        try {
            String sql = "SELECT [StatusID] FROM [FUSWAPSHAREFREE].[dbo].[Post] WHERE [PostID] = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                statusID = rs.getInt("StatusID");
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return statusID;
    }

    public boolean requestPost(String message, int userIdSent, int postId) {
        String sql = "INSERT INTO [dbo].[Request]\n"
                + "           ([requestTIme]\n"
                + "           ,[Message]\n"
                + "           ,[Status]\n"
                + "           ,[UserID]\n"
                + "           ,[PostID])\n"
                + "     VALUES\n"
                + "           (GETDATE(),?,?,?,?)";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, message);
            statement.setString(2, "pending");
            statement.setInt(3, userIdSent);
            statement.setInt(4, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public ArrayList<Post> getAllPostByIdUser(int idUser) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post where UserID = ? ORDER BY CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, idUser);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("PostID"));
                post.setTitle(rs.getString("Title"));
                post.setDescription(rs.getString("Description"));
                post.setIntructions(rs.getString("intructions"));
                post.setExpiresDate(rs.getString("ExpiresDate"));
                post.setImageUrl(rs.getString("ImageUrl"));
                post.setDesire(rs.getString("Desire"));
                post.setCommune(rs.getString("Commune"));
                post.setDistrict(rs.getString("District"));
                post.setStreet_Number(rs.getString("Street_Number"));
                post.setCreateTime(rs.getString("CreateTime"));
                post.setUserID(rs.getInt("UserID"));
                post.setStatusID(rs.getInt("StatusID"));
                post.setQuanlityID(rs.getInt("QuanlityID"));
                post.setTypeID(rs.getInt("TypeID"));
                listPost.add(post);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPost;
    }

    public ArrayList<Post> getAllPostHistory(int idUser) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post\n"
                    + "WHERE UserID = ? AND StatusID IN (2, 3, 4)\n"
                    + "ORDER BY CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, idUser);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("PostID"));
                post.setTitle(rs.getString("Title"));
                post.setDescription(rs.getString("Description"));
                post.setIntructions(rs.getString("intructions"));
                post.setExpiresDate(rs.getString("ExpiresDate"));
                post.setImageUrl(rs.getString("ImageUrl"));
                post.setDesire(rs.getString("Desire"));
                post.setCommune(rs.getString("Commune"));
                post.setDistrict(rs.getString("District"));
                post.setStreet_Number(rs.getString("Street_Number"));
                post.setCreateTime(rs.getString("CreateTime"));
                post.setUserID(rs.getInt("UserID"));
                post.setStatusID(rs.getInt("StatusID"));
                post.setQuanlityID(rs.getInt("QuanlityID"));
                post.setTypeID(rs.getInt("TypeID"));
                listPost.add(post);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPost;
    }

    public Post getPostByIdPost(int idPost) {
        Post post = null;
        String sql = "SELECT * FROM Post WHERE PostID = ?";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, idPost);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    post = new Post();
                    post.setPostID(rs.getInt("PostID"));
                    post.setTitle(rs.getString("Title"));
                    post.setDescription(rs.getString("Description"));
                    post.setIntructions(rs.getString("intructions"));
                    post.setExpiresDate(rs.getString("ExpiresDate"));
                    post.setImageUrl(rs.getString("ImageUrl"));
                    post.setDesire(rs.getString("Desire"));
                    post.setCommune(rs.getString("Commune"));
                    post.setDistrict(rs.getString("District"));
                    post.setStreet_Number(rs.getString("Street_Number"));
                    post.setCreateTime(rs.getString("CreateTime"));
                    post.setUserID(rs.getInt("UserID"));
                    post.setStatusID(rs.getInt("StatusID"));
                    post.setQuanlityID(rs.getInt("QuanlityID"));
                    post.setTypeID(rs.getInt("TypeID"));
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return post;
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

    public boolean updatePost(Post newPost, int postId) {
        String sql = "UPDATE [dbo].[Post]\n"
                + "   SET [Title] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[intructions] = ?\n"
                + "      ,[ImageUrl] = ?\n"
                + "      ,[Commune] = ?\n"
                + "      ,[District] = ?\n"
                + "      ,[Street_Number] = ?\n"
                + "      ,[QuanlityID] = ?\n"
                + " WHERE PostID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, newPost.getTitle());
            statement.setString(2, newPost.getDescription());
            statement.setString(3, newPost.getIntructions());
            statement.setString(4, newPost.getImageUrl());
            statement.setString(5, newPost.getCommune());
            statement.setString(6, newPost.getDistrict());
            statement.setString(7, newPost.getStreet_Number());
            statement.setInt(8, newPost.getQuanlityID());
            statement.setInt(9, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateStatusID(int postId) {
        String sql = "UPDATE [dbo].[Post] SET [StatusID] = 5 WHERE [PostID] = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
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

    public String getStatusPostByIdStatus(int idStatus) {
        String status = "";
        try {
            String sql = "select [Name] from StatusPost\n"
                    + "where StatusID = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, idStatus);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                status = rs.getString("Name");
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            return status;
        }
        return status;
    }

    public String getTypePostByTypeID(int idType) {
        String type = "";
        try {
            String sql = "select [Name] from [Type]\n"
                    + "where TypeID = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, idType);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                type = rs.getString("Name");
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            return type;
        }
        return type;
    }

    public String getQuanlityNameByIdQuanlity(int idQuanlity) {
        String quanlity = "";
        try {
            String sql = "Select [Name] From Quanlity\n"
                    + "where QuanlityID = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, idQuanlity);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                quanlity = rs.getString("Name");
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            return quanlity;
        }
        return quanlity;
    }

    public User getUserIdByUserId(int UserID) {
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

    public ArrayList<Post> getNewFeed() {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Quanlity";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                listPost.add(post);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPost;
    }

    public boolean ReportPost(String mess, int userIDSend, int postID) {
        String sql = "INSERT INTO Have_ReportPost (reportTime, Message, IdUserSend, PostID) VALUES (GETDATE(), ?, ?, ?)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, mess);
            st.setInt(2, userIDSend);
            st.setInt(3, postID);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        DAOManagePost dao = new DAOManagePost();
        ArrayList<Post> lP = dao.getAllPostHistory(64);
        System.out.println(lP);
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
