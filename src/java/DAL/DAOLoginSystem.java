/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.PasswordReset;
import Model.User;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class DAOLoginSystem extends DBContext {

    public boolean login(String email, String password) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE Email = ?\n"
                + "AND PassWord = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public User getUser(String email, String password) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE Email = ?\n"
                + "AND PassWord = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
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

    public User getUserLoginByPassReset(String email, String passwordReset) {
        String sql = "SELECT u.*\n"
                + "FROM [User] u\n"
                + "JOIN PasswordReset pr ON u.UserID = pr.UserID\n"
                + "WHERE u.Email = ? AND pr.Password = ?;";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, passwordReset);
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

    public User getUserByUserName(String username) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE UserName = ?\n";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, username);
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

    public PasswordReset getPasswordResetByEmail(String username) {
        String sql = "SELECT * FROM PasswordReset \n"
                + "WHERE UserID = (SELECT UserID FROM [User] WHERE Email = ?)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new PasswordReset(rs.getInt("UserID"),
                        rs.getString("Password"),
                        rs.getString("ExpiryDateTime"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [User]";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setEmail(rs.getString("Email"));
                user.setPhone(rs.getString("Phone"));
                user.setAvatarUrl(rs.getString("AvatarUrl"));
                user.setPassWord(rs.getString("PassWord"));
                user.setJoinDate(rs.getString("JoinDate"));
                user.setUserName(rs.getString("UserName"));
                user.setFull_Name(rs.getString("Full_Name"));
                user.setDistrict(rs.getString("District"));
                user.setCommune(rs.getString("Commune"));
                user.setStreetNumber(rs.getString("StreetNumber"));
                user.setPoint(rs.getInt("Point"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setStatusID(rs.getInt("StatusID"));
                listUser.add(user);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listUser;
    }

    public boolean checkEmailExits(String email, ArrayList<User> listUser) {
        for (User user : listUser) {
            if (user.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkUserNameExits(String userName, ArrayList<User> listUser) {
        for (User user : listUser) {
            if (user.getUserName().equals(userName)) {
                return true;
            }
        }
        return false;
    }

    public User getUserIdByEmail(String email) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE Email = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, email);
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

    public void insertPasswordReset(int idUser, String password, String expiryTime) {
        String sql = "INSERT INTO PasswordReset (UserID, Password, ExpiryDateTime) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, idUser);
            st.setString(2, password);
            st.setString(3, expiryTime);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePasswordReset(int userId, String password, String expiryDateTime) {
        String sql = "UPDATE PasswordReset SET Password = ?, ExpiryDateTime = ? WHERE UserID = ?";
        try (PreparedStatement st = connect.prepareStatement(sql)) {
            st.setString(1, password);
            st.setString(2, expiryDateTime);
            st.setInt(3, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updatePassword(String userName, String newPassword) {
        String sql = "UPDATE [User] SET PassWord = ? WHERE UserName = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, userName);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isUserInPasswordReset(int userId) {
        String sql = "SELECT 1 FROM PasswordReset WHERE UserID = ?";
        try (PreparedStatement st = connect.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
  
}
