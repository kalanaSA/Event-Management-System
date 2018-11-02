/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class IdeaHub implements Serializable{
    
    Database db = new Database();
    
    
    private int ideaID;
    private int userID;
    private String idea;

    public IdeaHub() {
    }

    public IdeaHub(int ideaID, int userID, String idea) {
        this.ideaID = ideaID;
        this.userID = userID;
        this.idea = idea;
    }

    public int getIdeaID() {
        return ideaID;
    }

    public void setIdeaID(int ideaID) {
        this.ideaID = ideaID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getIdea() {
        return idea;
    }

    public void setIdea(String idea) {
        this.idea = idea;
    }
    
    
    public ResultSet getIdeaDetails(){
        ResultSet rs = null;
        String query = "SELECT * FROM ideahub";
        try {
            rs = db.getData(query);
        } catch (Exception ex) {
            Logger.getLogger(IdeaHub.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public ResultSet getIdeaDetails(int id){
        ResultSet rs = null;
        String query = "SELECT * FROM ideahub where ideaID="+id+"";
        try {
            rs = db.getData(query);
        } catch (Exception ex) {
            Logger.getLogger(IdeaHub.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public void addComment(String comment,String userID, String ideaID){
        
        String query ="INSERT INTO ideacomments(comment,userID,ideaID) VALUES ('"+comment+"',"+userID+","+ideaID+")";
        System.out.println(query);
        try{
        db.setData(query);
        }catch (Exception e){

        }finally{
           
        } 
        
    }
    
    
     public void addIdea(String title,String desc, String usrerID){
        
        String query ="INSERT INTO ideahub(ideaTitle,ideaDesc,userID) VALUES ('"+title+"','"+desc+"',"+usrerID+")";
        System.out.println(query);
        try{
        db.setData(query);
        }catch (Exception e){

        }finally{
           
        } 
        
    }
    
    public ResultSet getComments(String id){
        ResultSet rs = null;
        String query = "SELECT * FROM ideacomments where ideaID="+id+"";
        try {
            rs = db.getData(query);
        } catch (Exception ex) {
            Logger.getLogger(IdeaHub.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    
}
