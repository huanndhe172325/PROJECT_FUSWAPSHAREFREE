/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.User;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOLoginSystem extends DBContext {
    
    public User login(String username, String password) {
        String sql = "SELECT * FROM [User] \n"
                + "WHERE UserName = ?\n"
                + "AND PassWord = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
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
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {

    }
    
}
