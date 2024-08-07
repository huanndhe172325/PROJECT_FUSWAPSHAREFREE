/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers.HomePage;

import DAL.DAOManagePost;
import Model.Post;
import Model.User;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
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
    private static SentMail instance;
    private final String from = "fanjfla1989@gmail.com";
    private final String password = "ggkcowdffnophotg";
    private Session session;

    public SentMail() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // Enable Authentication
        props.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS

        // Create Authenticator object to pass in Session.getInstance argument
        Authenticator auth = new Authenticator() {
            // override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        session = Session.getInstance(props, auth);
    }

    public void sentEmail(String emailReceive, String title, String message) {
        new Thread(() -> {
            try {
                MimeMessage msg = new MimeMessage(session);
                // Content type
                msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
                // Sender
                msg.setFrom(new InternetAddress(from));
                // Recipient
                msg.setRecipient(Message.RecipientType.TO, new InternetAddress(emailReceive));
                // Subject
                msg.setSubject(title);
                // Content
                msg.setContent(message, "text/HTML; charset=UTF-8");
                // Send email
                Transport.send(msg);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }).start();
    }
    
    public static SentMail getInstance() {
        if (instance == null) {
            synchronized (SentMail.class) {
                if (instance == null) {
                    instance = new SentMail();
                }
            }
        }
        return instance;
    }

    public String contentEmailApprove(Post postApproved, User userReceive) {
        String content = "<!DOCTYPE html>\n"
                + "<html lang=\"vi\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>" + postApproved.getFullNameOwner() + " đã đồng ý yêu cầu của bạn</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: Arial, sans-serif;\n"
                + "            line-height: 1.6;\n"
                + "            background-color: #f4f4f4;\n"
                + "            padding: 20px;\n"
                + "        }\n"
                + "        .container {\n"
                + "            max-width: 600px;\n"
                + "            margin: 0 auto;\n"
                + "            background-color: #ffffff;\n"
                + "            padding: 20px;\n"
                + "            border-radius: 10px;\n"
                + "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n"
                + "        }\n"
                + "        h1 {\n"
                + "            color: #333333;\n"
                + "        }\n"
                + "        p {\n"
                + "            color: #555555;\n"
                + "        }\n"
                + "        .address {\n"
                + "            font-weight: bold;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <h1>" + postApproved.getFullNameOwner() + " đã đồng ý yêu cầu của bạn</h1>\n"
                + "        <p>Chào bạn " + userReceive.getFull_Name() + ",</p>\n"
                + "        <p>" + postApproved.getFullNameOwner() + " đã đồng ý trao đổi " + postApproved.getTitle() + " với bạn. Hãy tới địa chỉ sau để trao đổi:</p>\n"
                + "        <p class=\"address\"> Address: " + postApproved.getAddress() + "</p>\n"
                + "        <p class=\"address\"> Intrucsion: " + postApproved.getIntructions() + "</p>\n"
                + "        <p>Rất mong được trao đổi.</p>\n"
                + "        <p>Trân trọng,</p>\n"
                + "        <p>" + postApproved.getFullNameOwner() + "</p>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";
        return content;
    }

}
