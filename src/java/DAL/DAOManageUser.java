/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Controllers.HomePage.ListFriends;
import Controllers.HomePage.SentMail;
import Model.BlockList;
import Model.Friends;
import Model.FriendsRequest;
import Model.Quanlity;
import Model.ReportUser;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author admin
 */
public class DAOManageUser extends DBContext {

    public void UpdateStatus(int id, int Idstatus) {
        String sqlString = "UPDATE [dbo].[User]\n"
                + "   SET\n"
                + "      [StatusID] = ?\n"
                + " WHERE UserID=?";
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);
            st.setInt(2, id);
            st.setInt(1, Idstatus);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DAOManageUser daomu = new DAOManageUser();
        daomu.UpdateStatus(1, 2);
    }

    public User getByID(int id) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE UserID = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<User> getUsersInSameDistrict(String district) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE District = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, district);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public ArrayList<User> getListUserRanking() {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] ORDER BY Point DESC";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public ArrayList<User> getAllUsers(int offset, int limit) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, limit);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public int countUsersByJoinDate(int year, int month) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS UserCount "
                    + "FROM [dbo].[User] "
                    + "WHERE YEAR(JoinDate) = ? AND MONTH(JoinDate) = ?";
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("UserCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countSearchAdministrator(String txtSearch) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS UserCount "
                    + "FROM [User] "
                    + "WHERE RoleID = 3 AND (Full_Name LIKE ? OR Email LIKE ? OR Phone LIKE ?)";
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            st.setString(3, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("UserCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public ArrayList<User> searchAdministrator(String txtSearch, int index, int size) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "WITH a AS (\n"
                + "    SELECT \n"
                + "        ROW_NUMBER() OVER (ORDER BY JoinDate DESC) AS r,\n"
                + "        UserID,\n"
                + "        Email,\n"
                + "        Phone,\n"
                + "        AvatarUrl,\n"
                + "        PassWord,\n"
                + "        JoinDate,\n"
                + "        UserName,\n"
                + "        Full_Name,\n"
                + "        District,\n"
                + "        Commune,\n"
                + "        StreetNumber,\n"
                + "        Point,\n"
                + "        RoleID,\n"
                + "        StatusID\n"
                + "    FROM \n"
                + "        [User]\n"
                + "    WHERE \n"
                + "        RoleID = 3 AND (Full_Name LIKE ? OR Email LIKE ? OR Phone LIKE ?)\n"
                + ")\n"
                + "SELECT * FROM a WHERE r BETWEEN (? - 1) * ? + 1 AND ? * ?";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            st.setString(3, "%" + txtSearch + "%");
            st.setInt(4, index);
            st.setInt(5, size);
            st.setInt(6, index);
            st.setInt(7, size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int countAdministrator() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS UserCount "
                    + "FROM [User] "
                    + "WHERE RoleID = 3";
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("UserCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getTotalRecords() {
        int totalRecords = 0;
        String sql = "SELECT COUNT(*) FROM [User]";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalRecords;
    }

    public ArrayList<User> getAllAdministrator(int index, int size) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "WITH a AS (\n"
                + "    SELECT \n"
                + "        ROW_NUMBER() OVER (ORDER BY JoinDate DESC) AS r,\n"
                + "        UserID,\n"
                + "        Email,\n"
                + "        Phone,\n"
                + "        AvatarUrl,\n"
                + "        PassWord,\n"
                + "        JoinDate,\n"
                + "        UserName,\n"
                + "        Full_Name,\n"
                + "        District,\n"
                + "        Commune,\n"
                + "        StreetNumber,\n"
                + "        Point,\n"
                + "        RoleID,\n"
                + "        StatusID\n"
                + "    FROM \n"
                + "        [User]\n"
                + "    WHERE \n"
                + "        RoleID = 3\n"
                + ")\n"
                + "SELECT * FROM a WHERE r BETWEEN (? - 1) * ? + 1 AND ? * ?";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, index);
            st.setInt(2, size);
            st.setInt(3, index);
            st.setInt(4, size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                users.add(user);
            }
        } catch (SQLException e) {
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

    public User getUserByIdUserSend(int id) {
        String sql = "    SELECT * FROM Have_ReportUser h join [User] u on h.IdUserSend=u.UserID where h.IdUserSend=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
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

    public User getUserByIdUserReceive(int id) {
        String sql = " SELECT * FROM Have_ReportUser h join [User] u on h.IdUserReceive=u.UserID where h.IdUserReceive=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
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

    public ReportUser getByIdUserReceive(int id) {
        String sqlString = "  SELECT * FROM Have_ReportUser where IdUserReceive=?";
        ReportUser rp = new ReportUser();
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                rp.setIdUserReceive(rs.getInt("IdUserReceive"));
                rp.setIdUserSend(rs.getInt("IdUserSend"));
                rp.setMessage(rs.getString("Message"));
                rp.setReportTime(rs.getString("reportTime"));
            }
            return rp;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Map<ReportUser, Integer> reportRankUser() {
        String sqlString = " SELECT TOP 5 IdUserReceive, COUNT(*) as [Count] FROM Have_ReportUser GROUP BY IdUserReceive ORDER BY COUNT(*) DESC ";
        Map<ReportUser, Integer> map = new HashMap<>();
        try {
            PreparedStatement st = connect.prepareStatement(sqlString);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ReportUser rpReportUser = new ReportUser();
                rpReportUser = getByIdUserReceive(rs.getInt("IdUserReceive"));
                int count = rs.getInt("Count");
                map.put(rpReportUser, count);
            }
            return map;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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

    public boolean insertRequestFriends(int senderUserID, int receiverUserID) {
        String sql = "INSERT INTO RequestFriends ( Status,SenderUserID, ReceiverUserID) VALUES ('pending',?, ?)";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, senderUserID);
            statement.setInt(2, receiverUserID);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public void blockUser(int UserID, int BlockID) {

        try {
            String sql = "INSERT INTO [dbo].[BlockList]\n"
                    + "           ([UserID]\n"
                    + "           ,[BlockUserID])\n"
                    + "     VALUES\n"
                    + "           (? , ?)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, UserID);
            stm.setInt(2, BlockID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<BlockList> listBlockUser(int UserID) {
        List<BlockList> userBlock = new ArrayList<>();
        String sql = """
                      select * from [BlockList]
                      where UserID = ?""";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                BlockList userB = new BlockList(rs.getInt("UserID"), rs.getInt("BlockUserID"));
                userBlock.add(userB);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userBlock;
    }

    public void unlockUser(int BlockID, int BlockUserID) {

        try {
            String sql = "DELETE FROM BlockList WHERE UserID = ? AND BlockUserID = ?;";
            PreparedStatement stm = connect.prepareStatement(sql);

            stm.setInt(1, BlockID);
            stm.setInt(2, BlockUserID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public boolean ReportUser(String mess, int userIDSend, int userID) {
        String sql = "INSERT INTO [dbo].[Have_ReportUser]\n"
                + "           ([reportTime]\n"
                + "           ,[Message]\n"
                + "           ,[IdUserSend]\n"
                + "           ,[IdUserReceive])\n"
                + "     VALUES\n"
                + "           (GETDATE()\n"
                + "           ,?,\n"
                + "           ?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, mess);
            st.setInt(2, userIDSend);
            st.setInt(3, userID);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<User> searchUsers(String query, int offset, int limit) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE Email LIKE ? "
                + "OR Phone LIKE ? OR UserName LIKE ? "
                + "ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            String likeQuery = "%" + query + "%";
            st.setString(1, likeQuery);
            st.setString(2, likeQuery);
            st.setString(3, likeQuery);
            st.setInt(4, offset);
            st.setInt(5, limit);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public boolean deleteRejectedRequest(int requestId) {
        String sql = "DELETE FROM RequestFriends WHERE RequestID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, requestId);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Friends> getListFriends(int userID) {
        ArrayList<Friends> listFriends = new ArrayList<>();
        String sql = "SELECT [FriendUserID] "
                + "FROM [FUSWAPSHAREFREE].[dbo].[ListFriends] "
                + "WHERE [UserID] = ?";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int friendUserId = rs.getInt("FriendUserID");

                Friends friend = new Friends(userID, friendUserId);
                listFriends.add(friend);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listFriends;
    }

   


    public ArrayList<FriendsRequest> getListFriendRequest(int userID) {
        ArrayList<FriendsRequest> friendRequests = new ArrayList<>();
        String sql = "SELECT [RequestID], [Status], [SenderUserID], [ReceiverUserID] FROM [RequestFriends] WHERE [ReceiverUserID] = ? AND [Status] = 'pending'";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int requestId = rs.getInt("RequestID");
                String status = rs.getString("Status");
                int senderUserId = rs.getInt("SenderUserID");
                int receiverUserId = rs.getInt("ReceiverUserID");

                FriendsRequest friendRequest = new FriendsRequest(requestId, status, senderUserId, receiverUserId);
                friendRequests.add(friendRequest);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return friendRequests;
    }

    public boolean updateRequestStatus(int requestId, String status) {
        String sql = "UPDATE RequestFriends SET Status = ? WHERE RequestID = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, status);
            statement.setInt(2, requestId);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean insertIntoListFriends(int senderUserId, int receiverUserId) {
        String sql1 = "INSERT INTO ListFriends (UserID, FriendUserID) VALUES (?, ?)";
        String sql2 = "INSERT INTO ListFriends (UserID, FriendUserID) VALUES (?, ?)";
        try {
            PreparedStatement statement1 = connect.prepareStatement(sql1);
            statement1.setInt(1, senderUserId);
            statement1.setInt(2, receiverUserId);
            int rowsInserted1 = statement1.executeUpdate();

            PreparedStatement statement2 = connect.prepareStatement(sql2);
            statement2.setInt(1, receiverUserId);
            statement2.setInt(2, senderUserId);
            int rowsInserted2 = statement2.executeUpdate();

            return rowsInserted1 > 0 && rowsInserted2 > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkisFriends(int userID, int friendID) {
        String sql = "SELECT COUNT(*) AS count FROM ListFriends WHERE (UserID = ? AND FriendUserID = ?) OR (UserID = ? AND FriendUserID = ?)";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, friendID);
            statement.setInt(3, friendID);
            statement.setInt(4, userID);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteFriends(int senderUserID, int receiverUserID) {
        boolean success = false;

        String sql = "DELETE FROM ListFriends WHERE (UserID = ? AND FriendUserID = ?) OR (UserID = ? AND FriendUserID = ?)";

        try (
                PreparedStatement stmt = connect.prepareStatement(sql)) {

            stmt.setInt(1, senderUserID);
            stmt.setInt(2, receiverUserID);
            stmt.setInt(3, receiverUserID);
            stmt.setInt(4, senderUserID);

            int rowsAffected = stmt.executeUpdate();
            success = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public ArrayList<User> getAllUsersToBlockList(int UserID) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT U.*\n"
                + "FROM [User] U\n"
                + "WHERE U.UserID NOT IN (\n"
                + "    SELECT BlockUserID\n"
                + "    FROM BlockList\n"
                + "    WHERE UserID = ?\n"
                + "	)";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
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
                        rs.getInt("StatusID")
                );
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

}
