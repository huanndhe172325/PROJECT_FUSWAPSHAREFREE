/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class ReportPost {
     private int postID;
    private String title;
    private String description;
    private String createTime;
    private String reportTime;
    private String message;
    private int idUserSend;
    private String commune;
    private String district;
    private String streetNumber;

    // Constructors
    public ReportPost() {
    }

    public ReportPost(int postID, String title, String description, String createTime, String reportTime, String message, int idUserSend, String commune, String district, String streetNumber) {
        this.postID = postID;
        this.title = title;
        this.description = description;
        this.createTime = createTime;
        this.reportTime = reportTime;
        this.message = message;
        this.idUserSend = idUserSend;
        this.commune = commune;
        this.district = district;
        this.streetNumber = streetNumber;
    }

    // Getters and setters
    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
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

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    // toString method for easy printing
    @Override
    public String toString() {
        return "ReportPost{" +
                "postID=" + postID +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", createTime='" + createTime + '\'' +
                ", reportTime='" + reportTime + '\'' +
                ", message='" + message + '\'' +
                ", idUserSend=" + idUserSend +
                ", commune='" + commune + '\'' +
                ", district='" + district + '\'' +
                ", streetNumber='" + streetNumber + '\'' +
                '}';
    }
}