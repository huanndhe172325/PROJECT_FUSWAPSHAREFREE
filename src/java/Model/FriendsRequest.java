/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.DAOManagePost;

/**
 *
 * @author Binhtran
 */
public class FriendsRequest {

    private int requestId;
    private String status;
    private int senderUserId;
    private int receiverUserId;

    public FriendsRequest() {
    }

    public FriendsRequest(int requestId, String status, int senderUserId, int receiverUserId) {
        this.requestId = requestId;
        this.status = status;
        this.senderUserId = senderUserId;
        this.receiverUserId = receiverUserId;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSenderUserId() {
        return senderUserId;
    }

    public void setSenderUserId(int senderUserId) {
        this.senderUserId = senderUserId;
    }

    public int getReceiverUserId() {
        return receiverUserId;
    }

    public void setReceiverUserId(int receiverUserId) {
        this.receiverUserId = receiverUserId;
    }

    @Override
    public String toString() {
        return "FriendRequest{"
                + "requestId=" + requestId
                + ", status='" + status + '\''
                + ", senderUserId=" + senderUserId
                + ", receiverUserId=" + receiverUserId
                + '}';
    }

    public User getUserSendFr() {
        DAOManagePost dao = new DAOManagePost();
        User user = dao.getUserIdByUserId(senderUserId);
        return user;
    }

    public String getAvatarOwner() {
        return getUserSendFr().getAvatarUrl();
    }

    public String getFullNameOwner() {
        return getUserSendFr().getFull_Name();
    }
}
