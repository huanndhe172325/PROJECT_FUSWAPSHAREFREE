/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManageUser;

/**
 *
 * @author admin
 */
public class ReportUser {
    private String reportTime;
    private String message;
    private int idUserSend;
    private int idUserReceive;

    public ReportUser() {
    }

    public ReportUser(String reportTime, String message, int idUserSend, int idUserReceive) {
        this.reportTime = reportTime;
        this.message = message;
        this.idUserSend = idUserSend;
        this.idUserReceive = idUserReceive;
    }

    public String getReportTime() {
        return reportTime;
    }

    public void setReportTime(String reportTime) {
        this.reportTime = reportTime;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getIdUserSend() {
        return idUserSend;
    }

    public void setIdUserSend(int idUserSend) {
        this.idUserSend = idUserSend;
    }

    public int getIdUserReceive() {
        return idUserReceive;
    }

    public void setIdUserReceive(int idUserReceive) {
        this.idUserReceive = idUserReceive;
    }
    public User getNameIdUserSend(){
        DAOManageUser dao=new DAOManageUser();
        return dao.getUserByIdUserSend(idUserSend);
    }
    public User getNameIdUserReceive(){
        DAOManageUser dao=new DAOManageUser();
        return dao.getUserByIdUserReceive(idUserReceive);
    }
    public User getStatus(){
                DAOManageUser dao=new DAOManageUser();
                return dao.getByID(idUserSend);
    }
    public String toString() {
        return "ReportUser{" +
                "reportTime='" + reportTime + '\'' +
                ", message='" + message + '\'' +
                ", idUserSend=" + idUserSend +
                ", idUserReceive=" + idUserReceive +
                '}';
    }
}
