/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author FPT
 */
public class Quanlity {
    private int QuanlityID;
    private String Name;

    public Quanlity() {
    }

    public Quanlity(int QuanlityID, String Name) {
        this.QuanlityID = QuanlityID;
        this.Name = Name;
    }

    public int getQuanlityID() {
        return QuanlityID;
    }

    public void setQuanlityID(int QuanlityID) {
        this.QuanlityID = QuanlityID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }
    
}
