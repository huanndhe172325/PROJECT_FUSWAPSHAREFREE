/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.BlockList;
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
        String sql = "      SELECT * FROM Have_ReportUser h join [User] u on h.IdUserReceive=u.UserID where h.IdUserReceive=?";
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

    public static void main(String[] args) {
        DAOManageUser userDAO = new DAOManageUser();
        boolean userDAO1 = userDAO.ReportUser("alknf", 2, 65);
//        List<BlockList> userB = userDAO.listBlockUser(1);
//        System.out.println(userB);

        System.out.println();
//   public static void main(String[] args) {
//        DAOManageUser userDAO = new DAOManageUser();
//        ArrayList<User> users = userDAO.getAllUsers();
//
//        for (User user : users) {
//            System.out.println("UserID: " + user.getUserID());
//            System.out.println("Email: " + user.getEmail());
//            System.out.println("Phone: " + user.getPhone());
//            System.out.println("AvatarUrl: " + user.getAvatarUrl());
//            System.out.println("PassWord: " + user.getPassWord());
//            System.out.println("JoinDate: " + user.getJoinDate());
//            System.out.println("UserName: " + user.getUserName());
//            System.out.println("Full_Name: " + user.getFull_Name());
//            System.out.println("District: " + user.getDistrict());
//            System.out.println("Commune: " + user.getCommune());
//            System.out.println("StreetNumber: " + user.getStreetNumber());
//            System.out.println("Point: " + user.getPoint());
//            System.out.println("RoleID: " + user.getRoleID());
//            System.out.println("StatusID: " + user.getStatusID());
//            System.out.println("--------------------------------");
//        }
//    User u=userDAO.getUserByIdUserSend(1);
//        System.out.println(u.getEmail());
    }
//    }
//    public static void main(String[] args) {
//        DAOManageUser daomu = new DAOManageUser();
//        User u = daomu.getUserByIdUserSend(2);
////        System.out.println(u.getUserID());
//        Map<ReportUser, Integer> map = daomu.reportRankUser();
//        for (Map.Entry<ReportUser, Integer> entry : map.entrySet()) {
//            System.out.println(entry.getKey().getNameIdUserReceive().getFull_Name() + ":" + entry.getValue());
//        }
//    }

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

}
