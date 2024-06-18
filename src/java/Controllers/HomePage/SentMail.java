/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers.HomePage;

import Model.User;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author FPT
 */
public class SentMail {
    public void sentEmail(String emailReceive, String title, String message){
        final String from = "fanjfla1989@gmail.com";
        final String password2 = "ggkcowdffnophotg";
        final String to = emailReceive;


        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //smtp host
        props.put("mail.smtp.port", "587"); // tls 582 ssl 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        //create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password2);
            }
        };

        //phiên làm việc
        Session session = Session.getInstance(props, auth);

        //Tạo tin nhắn 
        MimeMessage msg = new MimeMessage(session);

        try {
            //kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //người gửi
            msg.setFrom(from);
            //người nhận
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //tiêu đề email
            msg.setSubject(title);
            //nội dung 
            msg.setContent(message, "text/HTML; charset=UTF-8");
            //gửi email
            Transport.send(msg);
        } catch (Exception e) {
        }
    }
    
}
