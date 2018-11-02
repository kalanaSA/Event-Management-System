/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class User implements Serializable{
    
    Database db = new Database();
    
    private String name;
    private String dName;
    private String address;
    private String email;
    private String userID;
    private String Type;
    private int phone;
    private String approval;
    
    public User(){
        
    }


    public User(String name, String dName, String address, String email, String userID, String Type,int phone) {
        this.name = name;
        this.dName = dName;
        this.address = address;
        this.email = email;
        this.userID = userID;
        this.Type = Type;
        this.phone = phone;
    }
    
    
    
    public String getApproval() {
        return approval;
    }

    public void setApproval(String approval) {
        this.approval = approval;
    }
    
    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
    
    public Database getDb() {
        return db;
    }

    public void setDb(Database db) {
        this.db = db;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }
    
    
    
    public void getUserDetails(String email,String pass){
        ResultSet rs = null;
        int id = 0;
        String query = "SELECT * from users where pass='"+pass+"' AND email='"+email+"'";
        System.out.println(query);
        
        try {
            rs = db.getData(query);
            while(rs.next()){
                setUserID(rs.getString("userID"));
                setType(rs.getString("type"));
                setdName(rs.getString("displayName"));
                setAddress(rs.getString("address"));
                setEmail(rs.getString("email"));
                setName(rs.getString("name"));
                setApproval(rs.getString("approval"));
                setPhone(rs.getInt("phone"));
                
            }
        } catch (Exception ex) {
            
        }
       
       
    }
    
    public boolean loginAttempt(String username , String password) throws SQLException, Exception{
        boolean attempt = false;
        String query="SELECT email , pass FROM users WHERE email= '"+ username +"' and pass= '"+password+"' ";
        ResultSet rs = db.getData(query);
        while(rs.next()){
            attempt = true;
        }
       
        return attempt;
    }
    
    
    public boolean registerUni(String name,String dName,String address,String phone,String email,String pass){
        String query = "INSERT INTO users (name, displayName, address, phone, email, pass, type) VALUES ('"+name+"','"+dName+"','"+address+"','"+phone+"','"+email+"','"+pass+"','university')";
        System.out.println(query);
        try{
        db.setData(query);
        return true;
        }catch (Exception e){
            
            return false;
        }finally{
           
        } 
    }
    
    public boolean registerOrg(String name,String dName,String address,String phone,String email,String pass){
        String query = "INSERT INTO users (name, displayName, address, phone, email, pass, type) VALUES ('"+name+"','"+dName+"','"+address+"','"+phone+"','"+email+"','"+pass+"','organization')";
        System.out.println(query);
        try{
        db.setData(query);
        return true;
        }catch (Exception e){
            
            return false;
        }finally{
           
        } 
    }
    
    public ResultSet getUserDetails(){
        
        ResultSet rs = null;
        String query = "SELECT * FROM users";
        try {
            rs = db.getData(query);
            
        } catch (Exception ex) {
            
        }
        return rs;
    }
    
    public ResultSet getDetailsByID(String id){
        
        ResultSet rs = null;
        String query = "SELECT * FROM users where userID="+id+"";
        try {
            rs = db.getData(query);
            
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public ResultSet getDetailsByID(int id){
        
        ResultSet rs = null;
        String query = "SELECT * FROM users where userID="+id+"";
        try {
            rs = db.getData(query);
            
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    
    public void editUser(String name,String dName,String address,String phone,String email,String userImage,String id){
        
        String query ="UPDATE users SET name='"+name+"',displayName='"+dName+"',address='"+address+"',phone='"+phone+"',email='"+email+"',userImage='"+userImage+"' WHERE userID="+id+"";
        System.out.println(query);
        try{
        db.setData(query);
        }catch (Exception e){

        }finally{
           
        } 
        
    }
    
    public void approveUser(String approval,String id){
        
        String query ="UPDATE users SET approval='"+approval+"' WHERE userID="+id+"";
        System.out.println(query);
        try{
        db.setData(query);
        }catch (Exception e){

        }finally{
           
        } 
        
    }
    
    
    public void removeUser(int id){
        String query ="DELETE FROM users WHERE userID="+id+"";
        System.out.println(query);
        try{
        db.setData(query);
        }catch (Exception e){

        }finally{
           
        } 
        
    }
    
    
}
