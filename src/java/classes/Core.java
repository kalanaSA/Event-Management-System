/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class Core {
    Database db = new Database();
    
    public ResultSet getCategoryList(){
        ResultSet rs = null; 
        try{
        String query = "SELECT category from events GROUP BY category";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
    
    public int getNoOfCategorys(){
        ResultSet rs = null; 
        int count = 0;
        try{
        String query = "SELECT category from events GROUP BY category";
        rs = db.getData(query);
        while(rs.next()){
            count++;
        }
        }catch (Exception e){
        }
        return count;
    }
    
    public ResultSet getEventsByUser(int id){
        ResultSet rs = null; 
        try{
        String query = "SELECT * from events WHERE userID ="+id+" ";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
    
    
    
    public int getNoOfItemsPerCat(String category){
        ResultSet rs = null; 
        int count=0;
        try{
        String query = "SELECT category from events WHERE category='"+ category +"' ";
        rs = db.getData(query);
        while(rs.next()){
            count++;
        }
        }catch (Exception e){
        }
        return count;
    }
    
    public ResultSet getItemsByCategory(int no){
         ResultSet rs = null; 
        String category = null;
        int count=0,i;
        try{
        String query = "SELECT category from events GROUP BY category";
        rs = db.getData(query);
        for(i=0;i<=no;i++){
            rs.next();
            category = rs.getString("category");
        }
            System.out.println(category);
        query = "SELECT * from events WHERE category='"+category+"'";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
    
    public ResultSet getItemsByCategoryForUser(int no,int userID){
         ResultSet rs = null; 
        String category = null;
        int count=0,i;
        try{
        String query = "SELECT category from events GROUP BY category";
        rs = db.getData(query);
        for(i=0;i<=no;i++){
            rs.next();
            category = rs.getString("category");
        }
            System.out.println(category);
        query = "SELECT * from events WHERE category='"+category+"' and userID="+userID+"";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
    
    
     
     public ResultSet getItemsByCategoryForUni(int no){
         ResultSet rs = null; 
        String category = null;
        int count=0,i;
        try{
        String query = "SELECT category from events GROUP BY category";
        rs = db.getData(query);
        for(i=0;i<=no;i++){
            rs.next();
            category = rs.getString("category");
        }
            System.out.println(category);
        query = "SELECT * from events WHERE category='"+category+"' and userType='organization'";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
     public ResultSet getItemsByCategoryForOrg(int no){
         ResultSet rs = null; 
        String category = null;
        int count=0,i;
        try{
        String query = "SELECT category from events GROUP BY category";
        rs = db.getData(query);
        for(i=0;i<=no;i++){
            rs.next();
            category = rs.getString("category");
        }
            System.out.println(category);
        query = "SELECT * from events WHERE category='"+category+"'";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
     
      public ResultSet getUserDetailsByType(String type){
        ResultSet rs = null; 
        
        try{
        String query = "SELECT * from users WHERE type ='"+type+"' ";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
      
      public ResultSet getUserDetailsByType(String type,String type2){
        ResultSet rs = null; 
        String query = "SELECT * from users WHERE type='"+type+"' or type='"+type2+"'";
        try{
        
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
     
     
     
     public ResultSet getEventDetails(int id){
        ResultSet rs = null; 
        try{
        String query = "SELECT * from events WHERE eventID ="+id+" ";
        rs = db.getData(query);
        }catch (Exception e){
        }
        return rs;
    }
     
     public ResultSet getRelatedEvents(int id){
        ResultSet rs=null;
        String cat ="";
        try{
        String query = "SELECT category from events WHERE eventID ="+id+" ";
        rs = db.getData(query);
        while(rs.next()){
            cat = rs.getString("category");
        }
        }catch (Exception e){
        }
        
        
        ResultSet rs2=null;
        try{
        String query = "SELECT * from events WHERE category ='"+cat+"' LIMIT 3";
        rs2 = db.getData(query);
        }catch (Exception e){
        }
        return rs2;
    }
     
     
     public String getUserEventOpinion(int userID,int eventID){
         ResultSet rs = null; 
        String opinion = "";
        
        try{
        String query = "SELECT * from eventopinion where userID="+userID+" and eventID="+eventID+"";
        rs = db.getData(query);
        while(rs.next()){
            opinion = rs.getString("opinion");
        }
        
            System.out.println(opinion);
        
        }catch (Exception e){
        }
        return opinion;
    }
     
     
     
     public ResultSet getUserRegEvents(int userID){
         ResultSet rs = null; 
        String opinion = "";
        
        
        String query = "SELECT * from eventopinion where userID="+userID+"";
        try {
            rs = db.getData(query);
            
        } catch (Exception ex) {
            
        }
        return rs;
    }

     
    
}
