/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

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
public class DAOManagePost extends DBContext{
    public ArrayList<Type> getAllType(){
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
    public ArrayList<Quanlity> getAllQuanlity(){
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
    
    public static void main(String[] args) {
        DAOManagePost dao = new DAOManagePost();
        ArrayList<Quanlity> listQuanlity = new ArrayList<>();
        listQuanlity = dao.getAllQuanlity();
        for(Quanlity quan : listQuanlity){
            System.out.println(quan.getName());
        }
    }
}
