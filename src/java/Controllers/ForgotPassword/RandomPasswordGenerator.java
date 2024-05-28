/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers.ForgotPassword;

import java.util.Random;

/**
 *
 * @author Binhtran
 */
public class RandomPasswordGenerator {

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final Random RANDOM = new Random();

    public static String generateRandomString() {
        char[] randomChars = new char[14];
        for (int i = 0; i < 14; i++) {
            randomChars[i] = CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length()));
        }
        return String.valueOf(randomChars);
    }
}
