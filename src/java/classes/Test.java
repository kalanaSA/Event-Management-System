/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class Test {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        User us = new User();
        
        Boolean x = us.registerUni("h", "ugef", "gyefh", "98948", "hfhw", "hello");
        System.out.println("bh"+x);
    }
}
