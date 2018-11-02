/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ASUS
 */
public class Database {
    static Connection getMyConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventos", "root", "");
        return c;
    }

    public ResultSet getData(String sql) throws Exception {

        Statement st = Database.getMyConnection().createStatement();
        ResultSet rset = st.executeQuery(sql);
        return rset;
    }

    public void setData(String sql) throws Exception {

        Statement st = Database.getMyConnection().createStatement();
        st.executeUpdate(sql);
    }
    
    
}
