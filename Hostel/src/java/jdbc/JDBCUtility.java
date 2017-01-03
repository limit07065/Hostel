/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import java.util.*;
import java.sql.*;

/**
 *
 * @author U
 */
public class JDBCUtility {
   Connection con;
   String driver;
   String url;
   String userName;
   String password;
   PreparedStatement psInsertUser = null;
   PreparedStatement psSelectAllFromUserViaUsername = null;
   PreparedStatement psSelectUserViaUserPass = null;
   PreparedStatement psUpdateUserViaUsername= null;
   PreparedStatement psChangePasswordViaUsername = null;
   PreparedStatement psUpdateProfilePicViaUsername = null;
   PreparedStatement psInsertRoom = null;
   PreparedStatement psSelectAllFromRoom = null;
   PreparedStatement psSelectAllFromRoomViaId = null;
   PreparedStatement psUpdateRoomViaId = null;
   PreparedStatement psUpdateRoomStatusViaId = null;
   PreparedStatement psDeleteRoomViaId = null;
   PreparedStatement psInsertRoomType = null;
   PreparedStatement psSelectAllFromRoomType = null;
   PreparedStatement psUpdateRoomTypeViaId = null;
   PreparedStatement psUpdateRoomTypeViaStatusId = null;
   PreparedStatement psDeleteRoomTypeViaId = null;
   PreparedStatement psInsertSession = null;
   PreparedStatement psSelectAllFromSession = null;
   PreparedStatement psSelectAllFromActiveSession = null;
   PreparedStatement psUpdateSessionViaId = null;
   PreparedStatement psDeleteSessionViaId = null;
   PreparedStatement psDeactivateAllSession = null;
   PreparedStatement psUpdateSessionStatusViaId = null;
   PreparedStatement psInsertApplication = null;
   PreparedStatement psSelectAllFromApplication = null;
   PreparedStatement psSelectAllFromApplicationViaActiveSession = null;
   PreparedStatement psSelectApplicationViaUserName = null;
   PreparedStatement psUpdateApplicationStatusViaId = null;
   PreparedStatement psSelectBlockViaRoomTypeNGender = null;
   PreparedStatement psSelectRoomViaTypeBlockNGender = null;
   PreparedStatement psUpdateRoomTypeImage = null;
   PreparedStatement psCountApprovedApplication = null;
   PreparedStatement psCountRejectedApplication = null;
   PreparedStatement psCountTotalApplication = null;
   PreparedStatement psCountUnoccupiedSingleRoom = null;
   PreparedStatement psCountOccupiedSingleRoom = null;
   PreparedStatement psCountUnoccupiedSingleRoomWBathroom = null;
   PreparedStatement psCountOccupiedSingleRoomWBathroom = null;
   PreparedStatement psCountUnoccupiedDoubleRoom = null;
   PreparedStatement psCountOccupiedDoubleRoom = null;
   
   //use this constructor if using ConnectionPool
   public JDBCUtility()
   {
   }
   
    //use this constructor if not using ConnectionPool
    //ConnectionPool is used for multi user!
    public JDBCUtility(String driver,
            String url,
            String userName,
            String password) {
        this.driver = driver;
        this.url = url;
        this.userName = userName;
        this.password = password;
    }

    public void jdbcConnect() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userName, password);
            DatabaseMetaData dma = con.getMetaData();
            System.out.println("\nConnected to " + dma.getURL());
            System.out.println("Driver       " + dma.getDriverName());
            System.out.println("Version      " + dma.getDriverVersion());
            System.out.println("");
        } catch (SQLException ex) {
            while (ex != null) {
                System.out.println("SQLState: "
                        + ex.getSQLState());
                System.out.println("Message:  "
                        + ex.getMessage());
                System.out.println("Vendor:   "
                        + ex.getErrorCode());
                ex = ex.getNextException();
                System.out.println("");
            }

            System.out.println("Connection to the database error");
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
        }
    }

    public Connection jdbcGetConnection() {
        return con;
    }

    public void jdbcConClose() {
        try {
            con.close();
        } catch (Exception ex) {
        }
    }

    public void prepareSQLStatement() {
       try
       {
           //insert user
            String sqlInsertUser = "INSERT INTO user(Username, Password, Level, Gender, Name, Contact, Id, Email, CreatedDate) " +
                                      "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            psInsertUser = con.prepareStatement(sqlInsertUser);
            
            //select all from user
            String sqlSelectAllFromUserViaUsername = "SELECT * FROM user WHERE Username = ?";
            
            psSelectAllFromUserViaUsername = con.prepareStatement(sqlSelectAllFromUserViaUsername);
            
            //select user via username & password (for login)
            String sqlSelectUserViaUserPass = "SELECT * FROM user WHERE Username = ? AND Password = ?";
            
            psSelectUserViaUserPass = con.prepareStatement(sqlSelectUserViaUserPass);
            
            //update user via username
            String sqlUpdateUserViaUsername = "UPDATE user SET Email = ?, Contact = ?" +
                                                "WHERE Username = ?";
            
            psUpdateUserViaUsername = con.prepareStatement(sqlUpdateUserViaUsername);
            
            // Change password
            String sqlChangePasswordViaUsername = "UPDATE user SET Password = ? WHERE Username = ?";
            
            psChangePasswordViaUsername = con.prepareStatement(sqlChangePasswordViaUsername);
            
            //update user profile picture via username
            String sqlUpdateProfilePicViaUsername = "UPDATE user SET Pic = ? WHERE Username = ?";
            
            psUpdateProfilePicViaUsername = con.prepareStatement(sqlUpdateProfilePicViaUsername);
            
            //insert room
            String sqlInsertRoom = "INSERT INTO room(Number, Block, Gender, RoomType_FK, CreatedDate) " +
                                      "VALUES(?, ?, ?, ?, ?, ?)";
            
            psInsertRoom = con.prepareStatement(sqlInsertRoom);
            
            //select all from room
            String sqlSelectAllFromRoom = "SELECT * FROM room";
            
            psSelectAllFromRoom = con.prepareStatement(sqlSelectAllFromRoom);
            
            //select all from room via id
            String sqlSelectAllFromRoomViaId = "SELECT * FROM room WHERE Room_PK = ?";
            
            psSelectAllFromRoomViaId = con.prepareStatement(sqlSelectAllFromRoomViaId);
            
            //update room via id
            String sqlUpdateRoomViaId = "UPDATE room SET Number = ?, Block = ?, Gender = ?, RoomType_FK = ? " +
                                                "WHERE Room_PK = ?";
            
            psUpdateRoomViaId = con.prepareStatement(sqlUpdateRoomViaId);
            
            //update room status via id
            String sqlUpdateRoomStatusViaId = "UPDATE room SET Occupied = ? " +
                                                "WHERE Room_PK = ?";
            
            psUpdateRoomStatusViaId = con.prepareStatement(sqlUpdateRoomStatusViaId);
            
            //insert roomtype
            String sqlInsertRoomType = "INSERT INTO roomtype(Type, Price, Description, CreatedDate) " +
                                      "VALUES(?, ?, ?, ?)";
            
            psInsertRoomType = con.prepareStatement(sqlInsertRoomType);
            
            //select all from roomtype
            String sqlSelectAllFromRoomType = "SELECT * FROM roomtype";
            
            psSelectAllFromRoomType = con.prepareStatement(sqlSelectAllFromRoomType);
            
            //update roomtype via id
            String sqlUpdateRoomTypeViaId = "UPDATE roomtype SET Type = ?, Price = ?, Description = ? " +
                                                "WHERE RoomType_PK = ?";
            
            psUpdateRoomTypeViaId = con.prepareStatement(sqlUpdateRoomTypeViaId);
            
            //insert session
            String sqlInsertSession = "INSERT INTO session(Name, CreatedDate) " +
                                      "VALUES(?, ?)";
            
            psInsertSession = con.prepareStatement(sqlInsertSession);
            
            //select all from session
            String sqlSelectAllFromSession = "SELECT * FROM session";
            
            psSelectAllFromSession = con.prepareStatement(sqlSelectAllFromSession);
            
            //select all from active session
            String sqlSelectAllFromActiveSession = "SELECT * FROM session WHERE status = 1";
            
            psSelectAllFromActiveSession = con.prepareStatement(sqlSelectAllFromActiveSession);
            
            //update session via id
            String sqlUpdateSessionViaId = "UPDATE session SET Name = ? " +
                                                "WHERE Session_PK = ?";
            
            psUpdateSessionViaId = con.prepareStatement(sqlUpdateSessionViaId);
            
            //deactivate all session
            String sqlDeactivateAllSession = "UPDATE session SET Status = ? ";
            
            psDeactivateAllSession = con.prepareStatement(sqlDeactivateAllSession);
            
            //update session status via id
            String sqlUpdateSessionStatusViaId = "UPDATE session SET Status = ? " +
                                                "WHERE Session_PK = ?";
            
            psUpdateSessionStatusViaId = con.prepareStatement(sqlUpdateSessionStatusViaId);
                     
            //insert application
            String sqlInsertApplication = "INSERT INTO application(Session, Username, Number, Block, RoomType, Price, ApplyDate) " +
                                      "VALUES(?, ?, ?, ?, ?, ?, ?)";
            
            psInsertApplication = con.prepareStatement(sqlInsertApplication);
            
            //select all from application
            String sqlSelectAllFromApplication = "SELECT * FROM application";
            
            psSelectAllFromApplication = con.prepareStatement(sqlSelectAllFromApplication);
            
            //select all from application via active session
            String sqlSelectAllFromApplicationViaActiveSession = "SELECT application.Application_PK, application.Session, application.Username, "
                                                                 + "application.Number, application.Block, application.RoomType, application.Price, "
                                                                 + "application.ApplyDate, application.Status, application.ApprovedDate "
                                                                 + "FROM application INNER JOIN session " 
                                                                 + "ON application.Session = session.Name AND session.Status = 1";
            
            psSelectAllFromApplicationViaActiveSession = con.prepareStatement(sqlSelectAllFromApplicationViaActiveSession);
            
            //select application via username
            String sqlSelectApplicationViaUserName = "SELECT * FROM application WHERE Username = ? ORDER BY Session DESC";
                    
            psSelectApplicationViaUserName = con.prepareStatement(sqlSelectApplicationViaUserName);
            
            //update session via id
            String sqlUpdateApplicationStatusViaId = "UPDATE application SET Status = ?, ApprovedDate = ? " +
                                                "WHERE Application_PK = ?";
            
            psUpdateApplicationStatusViaId = con.prepareStatement(sqlUpdateApplicationStatusViaId);
            
            //select available block via roomtype
            String sqlSelectBlockViaRoomTypeNGender = "SELECT DISTINCT Block FROM room WHERE RoomType_FK = ? AND Gender = ? AND Occupied = '0'";
            
            psSelectBlockViaRoomTypeNGender = con.prepareStatement(sqlSelectBlockViaRoomTypeNGender);
            
            //select rooms via roomtype and block
            String sqlSelectRoomViaTypeBlockNGender = "SELECT * FROM room WHERE RoomType_FK = ? AND Block = ? AND Gender = ? AND Occupied = ?";
            
            psSelectRoomViaTypeBlockNGender = con.prepareStatement(sqlSelectRoomViaTypeBlockNGender);
            
            //delete room
            String sqlDeleteRoomViaId = "DELETE FROM room WHERE Room_PK = ?";
            
            psDeleteRoomViaId = con.prepareStatement(sqlDeleteRoomViaId);
            
            //delete room type
            String sqlDeleteRoomTypeViaId = "DELETE FROM roomtype WHERE RoomType_PK = ?";
            
            psDeleteRoomTypeViaId = con.prepareStatement(sqlDeleteRoomTypeViaId);
            
            //delete session
            String sqlDeleteSessionViaId = "DELETE FROM session WHERE Session_PK = ?";
            
            psDeleteSessionViaId = con.prepareStatement(sqlDeleteSessionViaId);
            
            //update destination image
            String sqlUpdateRoomTypeImage = "UPDATE roomtype SET Pic = ? WHERE RoomType_PK = ?"; 
            
            psUpdateRoomTypeImage = con.prepareStatement(sqlUpdateRoomTypeImage); 
            
            //count approved application
            String sqlCountApprovedApplication = "SELECT COUNT(*) AS count " 
                                                + "FROM application INNER JOIN session " 
                                                + "ON application.Session = session.Name AND session.Status = 1 " 
                                                + "WHERE application.Status = 1";
            
            psCountApprovedApplication = con.prepareStatement(sqlCountApprovedApplication);
            
            //count rejected application
            String sqlCountRejectedApplication = "SELECT COUNT(*) AS count " 
                                                + "FROM application INNER JOIN session " 
                                                + "ON application.Session = session.Name AND session.Status = 1 " 
                                                + "WHERE application.Status = 3";
            
            psCountRejectedApplication = con.prepareStatement(sqlCountRejectedApplication);
            
            //count total application
            String sqlCountTotalApplication = "SELECT COUNT(*) AS count " 
                                                + "FROM application INNER JOIN session " 
                                                + "ON application.Session = session.Name AND session.Status = 1 ";                                                
            
            psCountTotalApplication = con.prepareStatement(sqlCountTotalApplication);
            
            //count unonccupied single room
            String sqlCountUnoccupiedSingleRoom = "SELECT COUNT(*) AS count FROM room WHERE RoomType_FK = 1 AND Occupied = 0" ;                                               
            
            psCountUnoccupiedSingleRoom = con.prepareStatement(sqlCountUnoccupiedSingleRoom);
            
            //count onccupied single room
            String sqlCountOccupiedSingleRoom = "SELECT COUNT(*) AS count FROM room WHERE RoomType_FK = 1 AND Occupied = 1" ;                                               
            
            psCountOccupiedSingleRoom = con.prepareStatement(sqlCountOccupiedSingleRoom);
            
            //count unonccupied single room with bathroom
            String sqlCountUnoccupiedSingleRoomWBathroom = "SELECT COUNT(*) AS count FROM room WHERE RoomType_FK = 2 AND Occupied = 0" ;                                               
            
            psCountUnoccupiedSingleRoomWBathroom = con.prepareStatement(sqlCountUnoccupiedSingleRoomWBathroom);
            
            //count onccupied single room with bathroom
            String sqlCountOccupiedSingleRoomWBathroom = "SELECT COUNT(*) AS count FROM room WHERE RoomType_FK = 2 AND Occupied = 1" ;                                               
            
            psCountOccupiedSingleRoomWBathroom = con.prepareStatement(sqlCountOccupiedSingleRoomWBathroom);
            
            //count unonccupied double room
            String sqlCountUnoccupiedDoubleRoom = "SELECT COUNT(*) AS count FROM room WHERE RoomType_FK = 3 AND Occupied = 0" ;                                               
            
            psCountUnoccupiedDoubleRoom = con.prepareStatement(sqlCountUnoccupiedDoubleRoom);
            
            //count onccupied double room
            String sqlCountOccupiedDoubleRoom = "SELECT COUNT(*) AS count FROM room WHERE RoomType_FK = 3 AND Occupied = 1" ;                                               
            
            psCountOccupiedDoubleRoom = con.prepareStatement(sqlCountOccupiedDoubleRoom);
       }
       
       catch(SQLException ex)
       {
           while(ex != null)
           {
               System.out.println("SQLState: " + ex.getSQLState());
               System.out.println("Message:  " + ex.getMessage());
               System.out.println("Vendor:   " + ex.getErrorCode());
               ex = ex.getNextException();
               System.out.println ("");
           }
           System.out.println("Connection to the database error");
       }
       
        catch(java.lang.Exception ex)
	{
            ex.printStackTrace();
        }
    }
   
   public PreparedStatement getPsInsertUser()
   {
       return psInsertUser;
   }
     
   public PreparedStatement getPsSelectAllFromUserViaUsername()
   {
       return psSelectAllFromUserViaUsername;
   }
   
   public PreparedStatement getPsSelectUserViaUserPass()
   {
       return psSelectUserViaUserPass;
   }
   
   public PreparedStatement getPsUpdateUserViaUsername()
   {
       return psUpdateUserViaUsername;
   }

   public PreparedStatement getPsChangePasswordViaUsername()
   {
      return psChangePasswordViaUsername;
   }
   
   public PreparedStatement getPsUpdateProfilePicViaUsername()
   {
      return psUpdateProfilePicViaUsername;
   }
   
   public PreparedStatement getPsInsertRoom()
   {
       return psInsertRoom;
   }
   
   public PreparedStatement getPsSelectAllFromRoom()
   {
       return psSelectAllFromRoom;
   }
   
   public PreparedStatement getPsSelectAllFromRoomViaId()
   {
       return psSelectAllFromRoomViaId;
   }
   
   public PreparedStatement getPsUpdateRoomViaId()
   {
       return psUpdateRoomViaId;
   }
   
   public PreparedStatement getPsUpdateRoomStatusViaId()
   {
       return psUpdateRoomStatusViaId;
   }
   
   public PreparedStatement getPsInsertRoomType()
   {
       return psInsertRoomType;
   }
   
   public PreparedStatement getPsSelectAllFromRoomType()
   {
       return psSelectAllFromRoomType;
   }
   
   public PreparedStatement getPsUpdateRoomTypeViaId()
   {
       return psUpdateRoomTypeViaId;
   }
   
   public PreparedStatement getPsInsertSession()
   {
       return psInsertSession;
   }
   
   public PreparedStatement getPsSelectAllFromSession()
   {
       return psSelectAllFromSession;
   }
   
   public PreparedStatement getPsSelectAllFromActiveSession()
   {
       return psSelectAllFromActiveSession;
   }
   
   public PreparedStatement getPsUpdateSessionViaId()
   {
       return psUpdateSessionViaId;
   }
   
   public PreparedStatement getPsDeactivateAllSession()
   {
       return psDeactivateAllSession;
   }
   
   public PreparedStatement getPsUpdateSessionStatusViaId()
   {
       return psUpdateSessionStatusViaId;
   }
   
   public PreparedStatement getPsInsertApplication()
   {
       return psInsertApplication;
   }
   
   public PreparedStatement getPsSelectAllFromApplication()
   {
       return psSelectAllFromApplication;
   }
   
   public PreparedStatement getPsSelectAllFromApplicationViaActiveSession()
   {
       return psSelectAllFromApplicationViaActiveSession;
   }
 
   public PreparedStatement getPsSelectApplicationViaUserName()
   {
      return psSelectApplicationViaUserName;
   }
   
   public PreparedStatement getPsUpdateApplicationStatusViaId()
   {
       return psUpdateApplicationStatusViaId;
   }
   
   public PreparedStatement getPsSelectBlockViaRoomTypeNGender()
   {
       return psSelectBlockViaRoomTypeNGender;
   }
   
   public PreparedStatement getPsSelectRoomViaTypeBlockNGender()
   {
       return psSelectRoomViaTypeBlockNGender;
   }
   
   public PreparedStatement getPsDeleteRoomViaId()
   {
       return psDeleteRoomViaId;
   }
   
   public PreparedStatement getPsDeleteRoomTypeViaId()
   {
       return psDeleteRoomTypeViaId;
   }
   
   public PreparedStatement getPsDeleteSessionViaId()
   {
       return psDeleteSessionViaId;
   }
   public PreparedStatement getPsUpdateRoomTypeImage()
   {
       return psUpdateRoomTypeImage;
   }
   
   public PreparedStatement getPsCountApprovedApplication()
   {
       return psCountApprovedApplication;
   }
   public PreparedStatement getPsCountRejectedApplication()
   {
       return psCountRejectedApplication;
   }
   public PreparedStatement getPsCountTotalApplication()
   {
       return psCountTotalApplication;
   }
   public PreparedStatement getPsCountUnoccupiedSingleRoom()
   {
       return psCountUnoccupiedSingleRoom;
   }
   public PreparedStatement getPsCountOccupiedSingleRoom()
   {
       return psCountOccupiedSingleRoom;
   }
   public PreparedStatement getPsCountUnoccupiedSingleRoomWBathroom()
   {
       return psCountUnoccupiedSingleRoomWBathroom;
   }
   public PreparedStatement getPsCountOccupiedSingleRoomWBathroom()
   {
       return psCountOccupiedSingleRoomWBathroom;
   }
   public PreparedStatement getPsCountUnoccupiedDoubleRoom()
   {
       return psCountUnoccupiedDoubleRoom;
   }
   public PreparedStatement getPsCountOccupiedDoubleRoom()
   {
       return psCountOccupiedDoubleRoom;
   }
}
