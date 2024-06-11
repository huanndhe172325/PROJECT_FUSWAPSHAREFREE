<%-- 
    Document   : VerifyEmail
    Created on : Jun 8, 2024, 11:49:54 PM
    Author     : Binhtran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Email</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-bottom: 10px;
            }
            input[type="text"] {
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 3px;
                border: 1px solid #ccc;
                font-size: 16px;
            }
            button[type="submit"] {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            button[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
        <script>
            function checkOtpFormat() {
                var otp = document.getElementById("otp").value.trim();
                var otpError = document.getElementById("otpError");
                var otpPattern = /^[0-9]{6}$/;

                if (otp === "") {
                    otpError.innerHTML = "OTP is required";

                } else if (!otpPattern.test(otp)) {
                    otpError.innerHTML = "OTP must be 6 digits long";
                } else {
                    otpError.innerHTML = "";
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h2>Verify Your Email</h2>
            <form action="verifyemail" method="post">
                <label for="otp">Enter OTP:</label>
                <input type="text" id="otp" name="otp" required pattern="[0-9]{6}" maxlength="6" oninput="checkOtpFormat()">
                <span id="otpError" style="color: red;"></span>
                <p style="color: red">${mess}</p>  
                <br>
                <button type="submit">Verify</button>
            </form>
        </div>
    </body>
</html>

