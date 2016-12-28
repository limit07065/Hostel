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
   PreparedStatement psInsertRoom = null;
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
   PreparedStatement psUpdateSessionViaId = null;
   PreparedStatement psDeleteSessionViaId = null;
   PreparedStatement psUpdateSessionStatusViaId = null;
   PreparedStatement psInsertApplication = null;
   PreparedStatement psSelectAllFromApplication = null;
   PreparedStatement psUpdateApplicationStatusViaId = null;
   PreparedStatement psSelectBlockViaRoomType = null;
   PreparedStatement psSelectRoomViaTypeNBlock = null;
   
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
            String sqlInsertUser = "INSERT INTO user(Username, Password, Level, Gender, Name, Contact, Id, Email) " +
                                      "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            
            psInsertUser = con.prepareStatement(sqlInsertUser);
            
            //select all from user
            String sqlSelectAllFromUser = "SELECT * FROM user";
            
            psSelectAllFromUserViaUsername = con.prepareStatement(sqlSelectAllFromUser);
            
            //select user via username & password (for login)
            String sqlSelectUserViaUserPass = "SELECT * FROM user WHERE Username = ? AND Password = ?";
            
            psSelectUserViaUserPass = con.prepareStatement(sqlSelectUserViaUserPass);
            
            //update user via username
            String sqlUpdateUserViaUsername = "UPDATE user SET Password = ?, Contact = ?, Email = ? " +
                                                "WHERE Username = ?";
            
            psUpdateUserViaUsername = con.prepareStatement(sqlUpdateUserViaUsername);
            
            //insert room
            String sqlInsertRoom = "INSERT INTO room(Number, Block, Gender, RoomType_FK) " +
                                      "VALUES(?, ?, ?, ?, ?)";
            
            psInsertRoom = con.prepareStatement(sqlInsertRoom);
            
            //select all from room
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
            String sqlInsertRoomType = "INSERT INTO roomtype(Type, Price, Description) " +
                                      "VALUES(?, ?, ?)";
            
            psInsertRoomType = con.prepareStatement(sqlInsertRoomType);
            
            //select all from roomtype
            String sqlSelectAllFromRoomType = "SELECT * FROM roomtype";
            
            psSelectAllFromRoomType = con.prepareStatement(sqlSelectAllFromRoomType);
            
            //update roomtype via id
            String sqlUpdateRoomTypeViaId = "UPDATE roomtype SET Type = ?, Price = ?, Description = ? " +
                                                "WHERE RoomType_PK = ?";
            
            psUpdateRoomTypeViaId = con.prepareStatement(sqlUpdateRoomTypeViaId);
            
            //insert session
            String sqlInsertSession = "INSERT INTO session(Name) " +
                                      "VALUES(?)";
            
            psInsertSession = con.prepareStatement(sqlInsertSession);
            
            //select all from session
            String sqlSelectAllFromSession = "SELECT * FROM session";
            
            psSelectAllFromSession = con.prepareStatement(sqlSelectAllFromSession);
            
            //update session via id
            String sqlUpdateSessionViaId = "UPDATE session SET Name = ? " +
                                                "WHERE Session_PK = ?";
            
            psUpdateSessionViaId = con.prepareStatement(sqlUpdateSessionViaId);
            
            //insert application
            String sqlInsertApplication = "INSERT INTO application(Username, Number, Block, ApplyDate, ApprovedDate) " +
                                      "VALUES(?, ?, ?, ?, ?)";
            
            psInsertApplication = con.prepareStatement(sqlInsertApplication);
            
            //select all from application
            String sqlSelectAllFromApplication = "SELECT * FROM application";
            
            psSelectAllFromApplication = con.prepareStatement(sqlSelectAllFromApplication);
            
            //update session via id
            String sqlUpdateApplicationStatusViaId = "UPDATE application SET Status = ? " +
                                                "WHERE Application_PK = ?";
            
            psUpdateApplicationStatusViaId = con.prepareStatement(sqlUpdateApplicationStatusViaId);
            
            //select available block via roomtype
            String sqlSelectBlockViaRoomType = "SELECT DISTINCT Block FROM room WHERE RoomType_FK = ?";
            
            psSelectBlockViaRoomType = con.prepareStatement(sqlSelectBlockViaRoomType);
            
            //select rooms via roomtype and block
            String sqlSelectRoomViaTypeNBlock = "SELECT * FROM room WHERE RoomType_FK = ? AND Block = ?";
            
            psSelectRoomViaTypeNBlock = con.prepareStatement(sqlSelectRoomViaTypeNBlock);
            
            //delete room
            String sqlDeleteRoomViaId = "DELETE FROM room WHERE Room_PK = ?";
            
            psDeleteRoomViaId = con.prepareStatement(sqlDeleteRoomViaId);
            
            //delete room type
            String sqlDeleteRoomTypeViaId = "DELETE FROM roomtype WHERE RoomType_PK = ?";
            
            psDeleteRoomTypeViaId = con.prepareStatement(sqlDeleteRoomTypeViaId);
            
            //delete session
            String sqlDeleteSessionViaId = "DELETE FROM session WHERE Session_PK = ?";
            
            psDeleteRoomTypeViaId = con.prepareStatement(sqlDeleteRoomTypeViaId);
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
   
   public PreparedStatement getPsInsertRoom()
   {
       return psInsertRoom;
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
   
   public PreparedStatement getPsUpdateSessionViaId()
   {
       return psUpdateSessionViaId;
   }
   
   public PreparedStatement getPsInsertApplication()
   {
       return psInsertApplication;
   }
   
   public PreparedStatement getPsSelectAllFromApplication()
   {
       return psSelectAllFromApplication;
   }
   
   public PreparedStatement getPsUpdateApplicationStatusViaId()
   {
       return psUpdateApplicationStatusViaId;
   }
   
   public PreparedStatement getPsSelectBlockViaRoomType()
   {
       return psSelectBlockViaRoomType;
   }
   
   public PreparedStatement getPsSelectRoomViaTypeNBlock()
   {
       return psSelectRoomViaTypeNBlock;
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
}
