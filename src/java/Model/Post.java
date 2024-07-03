/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManagePost;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class Post {

    private int PostID;
    private String Title;
    private String Description;
    private String intructions;
    private String ExpiresDate;
    private String ImageUrl;
    private String Desire;
    private String Commune;
    private String District;
    private String Street_Number;
    private String CreateTime;
    private int UserID;
    private int StatusID;
    private int QuanlityID;
    private int TypeID;

    public Post() {
    }

    public Post(int PostID, String Title, String Description, String intructions, String ExpiresDate, String ImageUrl, String Desire, String Commune, String District, String Street_Number, String CreateTime, int UserID, int StatusID, int QuanlityID, int TypeID) {
        this.PostID = PostID;
        this.Title = Title;
        this.Description = Description;
        this.intructions = intructions;
        this.ExpiresDate = ExpiresDate;
        this.ImageUrl = ImageUrl;
        this.Desire = Desire;
        this.Commune = Commune;
        this.District = District;
        this.Street_Number = Street_Number;
        this.CreateTime = CreateTime;
        this.UserID = UserID;
        this.StatusID = StatusID;
        this.QuanlityID = QuanlityID;
        this.TypeID = TypeID;
    }

    public int getPostID() {
        return PostID;
    }

    public void setPostID(int PostID) {
        this.PostID = PostID;
    }

    public String getTitle() {
        return Title.substring(0, 1).toUpperCase() + Title.substring(1).toLowerCase();
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getIntructions() {
        return intructions;
    }

    public void setIntructions(String intructions) {
        this.intructions = intructions;
    }

    public String getExpiresDate() {
        return ExpiresDate;
    }

    public void setExpiresDate(String ExpiresDate) {
        this.ExpiresDate = ExpiresDate;
    }

    public String getImageUrl() {
        return ImageUrl;
    }

    public void setImageUrl(String ImageUrl) {
        this.ImageUrl = ImageUrl;
    }

    public String getDesire() {
        return Desire;
    }

    public void setDesire(String Desire) {
        this.Desire = Desire;
    }

    public String getCommune() {
        return Commune;
    }

    public void setCommune(String Commune) {
        this.Commune = Commune;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public String getStreet_Number() {
        return Street_Number;
    }

    public void setStreet_Number(String Street_Number) {
        this.Street_Number = Street_Number;
    }

    public String getCreateTime() {
        return CreateTime.substring(0, 10);
    }

    public void setCreateTime(String CreateTime) {
        this.CreateTime = CreateTime;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    public int getQuanlityID() {
        return QuanlityID;
    }

    public void setQuanlityID(int QuanlityID) {
        this.QuanlityID = QuanlityID;
    }

    public int getTypeID() {
        return TypeID;
    }

    public void setTypeID(int TypeID) {
        this.TypeID = TypeID;
    }

    public User getUserOwner() {
        DAOManagePost dao = new DAOManagePost();
        User user = dao.getUserIdByUserId(UserID);
        return user;
    }

    public String getAvatarOwner() {
        return getUserOwner().getAvatarUrl();
    }

    public String getFullNameOwner() {
        return getUserOwner().getFull_Name();
    }

    public String getDateFormat() {
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SS");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MMMM dd yyyy, hh:mma");
        String formattedDate = "";
        try {
            LocalDateTime dateTime = LocalDateTime.parse(getCreateTime(), inputFormatter);
            formattedDate = dateTime.format(outputFormatter);
        } catch (DateTimeParseException e) {
            inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
            LocalDateTime dateTime = LocalDateTime.parse(getCreateTime(), inputFormatter);
            formattedDate = dateTime.format(outputFormatter);
        }
        return formattedDate;
    }

    public boolean avaiAbleRequest(int userId) {
        DAOManagePost dao = new DAOManagePost();
        if (dao.checkRequested(userId, PostID)) {
            return false;
        }
        if(userId == UserID || StatusID != 1){
            return false;
        }
        return true;
        
    }

    public String getStatusName() {
        DAOManagePost dao = new DAOManagePost();
        return dao.getStatusPostByIdStatus(StatusID);
    }

    public String getTypeName() {
        DAOManagePost dao = new DAOManagePost();
        return dao.getTypePostByTypeID(TypeID);
    }

    public String getAddress() {
        return Street_Number + ", " + Commune + ", " + District;
    }

    public String getQuanlityName() {
        DAOManagePost dao = new DAOManagePost();
        return dao.getQuanlityNameByIdQuanlity(QuanlityID);
    }

    public boolean avaiableArchivePost(int idUser) {
        if (idUser == UserID && StatusID == 1) {
            return true;
        }
        return false;
    }

    public List<String> getListImg() {
        if (ImageUrl == null || ImageUrl.isEmpty()) {
            return List.of();
        }
        List<String> listImg = new ArrayList<>();
        String[] allImg = ImageUrl.split(",");
        for (String img : allImg) {
            listImg.add(img);
        }
        return listImg;
    }

    public boolean avaiableEditPost(int idUser) {
        if (idUser == UserID) {
            return true;
        }
        return false;
    }

    public int getCountLikeOfPost() {
        DAOManagePost dao = new DAOManagePost();
        return dao.getNumberLikeOfPost(PostID);
    }

    public boolean isLikedByUser(int userId) {
        DAOManagePost dao = new DAOManagePost();
        return dao.checkPostLikedByUser(PostID, userId);
    }
}
