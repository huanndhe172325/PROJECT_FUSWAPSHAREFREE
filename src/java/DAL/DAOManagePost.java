    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Controllers.HomePage.SentMail;
import Model.DuringExchange;
import Model.HaveSwap;
import Model.Notification;
import Model.Post;
import Model.Quanlity;
import Model.Request;
import Model.Type;
import Model.User;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import DAL.DBContext;

import DAL.DBContext;

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

    public boolean archivePost(int postId) {
        String sql = "";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public ArrayList<Post> getFilteredPosts(int userID, String keyword) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * "
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] p "
                    + "WHERE p.StatusID = 1 "
                    + "AND p.UserID NOT IN ( "
                    + "    SELECT BlockUserID "
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList] "
                    + "    WHERE UserID = ? "
                    + ") "
                    + "AND (p.Title LIKE ? OR p.Description LIKE ?) "
                    + "ORDER BY p.CreateTime DESC";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setString(2, "%" + keyword + "%");
            statement.setString(3, "%" + keyword + "%");

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
            e.printStackTrace();
            // Xử lý exception nếu cần
        }

        return listPost;
    }

    public ArrayList<Post> getTop5PostsSameDistrict(int userID, String district) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT TOP 3 * \n"
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] p\n"
                    + "WHERE p.StatusID = 1\n"
                    + "AND p.Commune = ?\n"
                    + "AND p.UserID != ?\n"
                    + "AND p.UserID NOT IN (\n"
                    + "    SELECT BlockUserID \n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList]\n"
                    + "    WHERE UserID = ?  \n"
                    + ")\n"
                    + "ORDER BY p.CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, district);
            statement.setInt(2, userID);
            statement.setInt(3, userID);
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

    public ArrayList<Post> getAllPost(int userID) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] p\n"
                    + "WHERE p.StatusID = 1\n"
                    + "AND p.UserID NOT IN (\n"
                    + "    SELECT BlockUserID \n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "AND p.UserID != ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, userID);
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

    public ArrayList<Post> getAllPostOfFriends(int userID) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] p\n"
                    + "WHERE p.StatusID = 1\n"
                    + "AND p.UserID IN (\n"
                    + "    SELECT [FriendUserID]\n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[ListFriends]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "AND p.UserID NOT IN (\n"
                    + "    SELECT BlockUserID\n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "AND p.UserID != ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, userID);
            statement.setInt(3, userID);
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

    public boolean isPostOfFriend(int postID, int userID) {
        boolean isFriendPost = false;
        try {
            String sql = "SELECT TOP 1 1\n"
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] p\n"
                    + "WHERE p.PostID = ?\n"
                    + "AND p.StatusID = 1\n"
                    + "AND p.UserID IN (\n"
                    + "    SELECT [FriendUserID]\n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[ListFriends]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "AND p.UserID NOT IN (\n"
                    + "    SELECT BlockUserID\n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "AND p.UserID != ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postID);
            statement.setInt(2, userID);
            statement.setInt(3, userID);
            statement.setInt(4, userID);
            ResultSet rs = statement.executeQuery();
            isFriendPost = rs.next();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return isFriendPost;
    }
    
    public ArrayList<Post> getPostNewest(int userID) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] p\n"
                    + "WHERE p.StatusID = 1\n"
                    + "AND p.UserID NOT IN (\n"
                    + "    SELECT BlockUserID \n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "ORDER BY p.CreateTime DESC;";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userID);
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

    public ArrayList<Post> getPostsByTypeID(int typeId, int userID) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] \n"
                    + "WHERE TypeID = ?\n"
                    + "AND StatusID = 1\n"
                    + "AND UserID NOT IN (\n"
                    + "    SELECT BlockUserID \n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "ORDER BY CreateTime DESC;";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, typeId);
            statement.setInt(2, userID);
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
    
    public ArrayList<Post> getPostsByQuanlityID(int quanlityId, int userID) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM [FUSWAPSHAREFREE].[dbo].[Post] \n"
                    + "WHERE QuanlityID = ? \n"
                    + "AND StatusID = 1\n"
                    + "AND UserID NOT IN (\n"
                    + "    SELECT BlockUserID \n"
                    + "    FROM [FUSWAPSHAREFREE].[dbo].[BlockList]\n"
                    + "    WHERE UserID = ?\n"
                    + ")\n"
                    + "ORDER BY CreateTime DESC;";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, quanlityId);
            statement.setInt(2, userID);
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

    public boolean approveRequestSwap(int userId, int postId) {
        String sql = "UPDATE [dbo].[have_swap]\n"
                + "   SET [Status] = N'approved'\n"
                + " WHERE UserID = ? and PostID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public void updatePoint(int point, int userId) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Point] = Point + ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, point);
            statement.setInt(2, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean approveRequest(int userId, int postId) {
        String sql = "UPDATE [dbo].[Request]\n"
                + "   SET [Status] = N'approved'\n"
                + " WHERE UserID = ? and PostID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean rejectRequestSwap(int userId, int postId) {
        String sql = "UPDATE [dbo].[have_swap]\n"
                + "   SET [Status] = N'reject'\n"
                + " WHERE UserID = ? and PostID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean rejectRequest(int userId, int postId) {
        String sql = "UPDATE [dbo].[Request]\n"
                + "   SET [Status] = N'reject'\n"
                + " WHERE UserID = ? and PostID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateStatusPost(int postId, int statusId) {
        String sql = "UPDATE [dbo].[Post]\n"
                + "   SET [StatusID] = ?\n"
                + " WHERE PostID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, statusId);
            statement.setInt(2, postId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
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

    public boolean createNotifycation(String desc, int idUserSent, int postId, int userIdReceive, int status) {
        String sql = "INSERT INTO [dbo].[Notification]\n"
                + "           ([Descripton]\n"
                + "           ,[CreateTime]\n"
                + "           ,[UserSendID]\n"
                + "           ,[PostID]\n"
                + "           ,[UserReceiveID]\n"
                + "           ,[StatusNoti])\n"
                + "     VALUES\n"
                + "           (?,GETDATE(),?,?,?,?)";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, desc);
            statement.setInt(2, idUserSent);
            statement.setInt(3, postId);
            statement.setInt(4, userIdReceive);
            statement.setInt(5, status);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean createRequestSwap(HaveSwap newSwap) {
        String sql = "INSERT INTO [dbo].[have_swap]\n"
                + "           ([requestTime]\n"
                + "           ,[Description]\n"
                + "           ,[Status]\n"
                + "           ,[Image]\n"
                + "           ,[MyPostIdSwap]\n"
                + "           ,[UserID]\n"
                + "           ,[PostID])\n"
                + "     VALUES\n"
                + "           (GETDATE(),?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, newSwap.getDescription());
            statement.setString(2, newSwap.getStatus());
            statement.setString(3, newSwap.getImage());
            statement.setString(4, null);
            statement.setInt(5, newSwap.getUserID());
            statement.setInt(6, newSwap.getPostID());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean checkRequested(int idUser, int postId) {
        String sql = "SELECT * FROM Request WHERE [UserID] = ? AND [PostID] = ?";
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, idUser);
            statement.setInt(2, postId);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean checkAvaiableViewRequest(int idUser, int postId) {
        String sql = "SELECT * FROM have_swap WHERE [UserID] = ? AND [PostID] = ?";
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, idUser);
            statement.setInt(2, postId);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }

    public ArrayList<Post> getAllPostByIdUser(int idUser) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Post where UserID = ? And [StatusID] <> 5 ORDER BY CreateTime DESC";
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

    public ArrayList<Request> getListRequestByPostId(int postId) {
        ArrayList<Request> listRequest = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Request] WHERE PostID = ? and [Status] = N'pending' ORDER BY requestTIme DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Request req = new Request();
                req.setRequestTime(rs.getString("requestTIme"));
                req.setMessage(rs.getString("Message"));
                req.setStatus(rs.getString("Status"));
                req.setUserID(rs.getInt("UserID"));
                req.setPostID(rs.getInt("PostID"));
                listRequest.add(req);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listRequest;
    }

    public ArrayList<Request> getListRequestApprovedByPostId(int postId) {
        ArrayList<Request> listRequest = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Request] WHERE PostID = ? and [Status] = N'approved' ORDER BY requestTIme DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Request req = new Request();
                req.setRequestTime(rs.getString("requestTIme"));
                req.setMessage(rs.getString("Message"));
                req.setStatus(rs.getString("Status"));
                req.setUserID(rs.getInt("UserID"));
                req.setPostID(rs.getInt("PostID"));
                listRequest.add(req);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listRequest;
    }

    public ArrayList<HaveSwap> getListRequesSwaptByPostId(int postId) {
        ArrayList<HaveSwap> listRequestSwap = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [have_swap] WHERE PostID = ? and [Status] = N'pending' ORDER BY requestTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                HaveSwap haSwp = new HaveSwap();
                haSwp.setRequestTime(rs.getString("requestTime"));
                haSwp.setDescription(rs.getString("Description"));
                haSwp.setStatus(rs.getString("Status"));
                haSwp.setImage(rs.getString("Image"));
                haSwp.setMyPostIdSwap(rs.getInt("MyPostIdSwap"));
                haSwp.setUserID(rs.getInt("UserID"));
                haSwp.setPostID(rs.getInt("PostID"));
                listRequestSwap.add(haSwp);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listRequestSwap;
    }

    public ArrayList<HaveSwap> getListRequesApproveSwaptByPostId(int postId) {
        ArrayList<HaveSwap> listRequestSwap = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [have_swap] WHERE PostID = ? and [Status] = N'approved' ORDER BY requestTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, postId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                HaveSwap haSwp = new HaveSwap();
                haSwp.setRequestTime(rs.getString("requestTime"));
                haSwp.setDescription(rs.getString("Description"));
                haSwp.setStatus(rs.getString("Status"));
                haSwp.setImage(rs.getString("Image"));
                haSwp.setMyPostIdSwap(rs.getInt("MyPostIdSwap"));
                haSwp.setUserID(rs.getInt("UserID"));
                haSwp.setPostID(rs.getInt("PostID"));
                listRequestSwap.add(haSwp);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listRequestSwap;
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

    public ArrayList<DuringExchange> getListDuringExchange(int userLogin) {
        ArrayList<DuringExchange> list = new ArrayList<>();
        try {
            String sql1 = "Select P.PostID, R.UserID AS userRequest from Post p\n"
                    + "  inner join Request r on r.PostID = p.PostID \n"
                    + "  where r.Status = 'approved' and p.StatusID = 2 and p.UserID = ?";
            String sql2 = "Select P.PostID, hs.UserID AS userRequest from Post p\n"
                    + "  inner join have_swap hs on hs.PostID = p.PostID \n"
                    + "  where hs.Status = 'approved' and p.StatusID = 2 and p.UserID = ?";
            PreparedStatement statement1 = connect.prepareStatement(sql1);
            statement1.setInt(1, userLogin);
            ResultSet rs1 = statement1.executeQuery();
            while (rs1.next()) {
                DuringExchange de = new DuringExchange();
                de.setPostId(rs1.getInt("PostID"));
                de.setUserRequest(rs1.getInt("userRequest"));
                list.add(de);
            }
            rs1.close();
            statement1.close();

            
            PreparedStatement statement2 = connect.prepareStatement(sql2);
            statement2.setInt(1, userLogin);
            ResultSet rs2 = statement2.executeQuery();
            while (rs2.next()) {
                DuringExchange de = new DuringExchange();
                de.setPostId(rs2.getInt("PostID"));
                de.setUserRequest(rs2.getInt("userRequest"));
                list.add(de);
            }
            rs2.close();
            statement2.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
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

    public void deleteImgByIdPost(String idPost) {
        Path projectDirectory = Paths.get("").toAbsolutePath();

        Path uploadDirectory = projectDirectory.resolve("web/FolderImages/ImagePost");
        try {
            deleteFilesWithId(uploadDirectory, idPost);
        } catch (IOException e) {
            System.err.println("Error while deleting files: " + e.getMessage());
        }
    }

    public static void deleteFilesWithId(Path directory, String id) throws IOException {
        try (Stream<Path> files = Files.list(directory)) {
            files
                    .filter(Files::isRegularFile)
                    .filter(file -> file.getFileName().toString().contains(id))
                    .forEach(file -> {
                        try {
                            Files.delete(file);
                            System.out.println("Deleted file: " + file);
                        } catch (IOException e) {
                            System.err.println("Failed to delete file: " + file + " - " + e.getMessage());
                        }
                    });
        }
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

    public ArrayList<Notification> getListNotiByUserId(int idUser) {
        ArrayList<Notification> listNoti = new ArrayList<>();
        try {
            String sql = "SELECT * From [Notification] where UserReceiveID = ? ORDER BY CreateTime DESC";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, idUser);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Notification noti = new Notification();
                noti.setNotiId(rs.getInt("NotiId"));
                noti.setDescripton(rs.getString("Descripton"));
                noti.setCreateTime(rs.getString("CreateTime"));
                noti.setUserSendID(rs.getInt("UserSendID"));
                noti.setPostID(rs.getInt("PostID"));
                noti.setUserReceiveID(rs.getInt("UserReceiveID"));
                noti.setStatusNoti(rs.getInt("StatusNoti"));
                listNoti.add(noti);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listNoti;
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

    public int getNumberLikeOfPost(int PostID) {
        int numberOfLikes = 0;

        String sql = "SELECT COUNT(*) AS NumberOfLikes FROM [FUSWAPSHAREFREE].[dbo].[Like] WHERE PostID = ?";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, PostID);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    numberOfLikes = rs.getInt("NumberOfLikes");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return numberOfLikes;
    }

    public String calulateDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        LocalDateTime pastDateTime = LocalDateTime.parse("2024-06-25 00:55:13.430", formatter);
        LocalDateTime now = LocalDateTime.now();

        Duration duration = Duration.between(pastDateTime, now);
        long minutes = duration.toMinutes();
        long hours = duration.toHours();
        long days = duration.toDays();

        if (minutes < 60) {
            return minutes + " minutes";
        } else if (hours < 24) {
            return hours + " hours";
        } else {
            return days + " days";
        }
    }

    public void addLikePost(String postId, String userId) {
        String sql = "INSERT INTO [FUSWAPSHAREFREE].[dbo].[Like] (PostID, UserID) VALUES (?, ?)";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {

            statement.setString(1, postId);
            statement.setString(2, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteLikePost(String postId, String userId) {
        String sql = "DELETE FROM [FUSWAPSHAREFREE].[dbo].[Like] WHERE PostID = ? AND UserID = ?";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {

            statement.setString(1, postId);
            statement.setString(2, userId);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkPostLikedByUser(int postId, int userId) {
        String sql = "SELECT 1 FROM [FUSWAPSHAREFREE].[dbo].[Like] WHERE PostID = ? AND UserID = ?";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {

            statement.setInt(1, postId);
            statement.setInt(2, userId);

            try (ResultSet rs = statement.executeQuery()) {

                return rs.next();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public int getNumberPostOfFriends(int friendUserID) {
        int numberOfPosts = 0;
        String sql = "SELECT COUNT(*) AS NumberOfPosts "
                + "FROM [FUSWAPSHAREFREE].[dbo].[Post] "
                + "WHERE [UserID] = ?";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, friendUserID);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    numberOfPosts = rs.getInt("NumberOfPosts");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return numberOfPosts;
    }

    public int getNumberFriends(int friendUserID) {
        int numberOfFriends = 0;
        String sql = "SELECT COUNT(*) AS NumberOfFriends\n"
                + "FROM (\n"
                + "    SELECT DISTINCT FriendUserID\n"
                + "    FROM [FUSWAPSHAREFREE].[dbo].[ListFriends]\n"
                + "    WHERE [UserID] = ?\n"
                + "    UNION\n"
                + "    SELECT DISTINCT UserID\n"
                + "    FROM [FUSWAPSHAREFREE].[dbo].[ListFriends]\n"
                + "    WHERE [FriendUserID] = ?\n"
                + ") AS UniqueFriends";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, friendUserID);
            statement.setInt(2, friendUserID);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    numberOfFriends = rs.getInt("NumberOfFriends");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return numberOfFriends;
    }

    public static void main(String[] args) {
        DAOManagePost dao = new DAOManagePost();
        ArrayList<DuringExchange> list = new ArrayList<>();
        list = dao.getListDuringExchange(1);
        for(DuringExchange a : list){
            System.out.println(a.getUserRequest());
        }
    }
}
