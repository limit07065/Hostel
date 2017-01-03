/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import bean.Application;
import bean.Room;
import bean.RoomType;
import bean.Session;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author Pang
 */
@WebServlet(name = "dashboard", urlPatterns = {"/dashboard"})
public class dashboard extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;
    
    public void init() throws ServletException
    {
        String driver = "com.mysql.jdbc.Driver";

        String dbName = "db_hostel";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";

        jdbcUtility = new JDBCUtility(driver,
                                      url,
                                      userName,
                                      password);

        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
        jdbcUtility.prepareSQLStatement();
    }           
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //HttpSession httpsession = request.getSession(true);
        
        ArrayList applications = new ArrayList();
        Application application = null;    
        
        ArrayList rooms = new ArrayList();
        Room room = null;
        
        ArrayList roomTypes = new ArrayList();
        RoomType roomType = null;
        
        ArrayList sessions = new ArrayList();
        Session session = null;
        
        try {   
            //select all from application
            ResultSet rs = jdbcUtility.getPsSelectAllFromApplicationViaActiveSession().executeQuery();
            
            while (rs.next()) {           
                application = new Application();
                application.setApplication_PK(rs.getInt("Application_PK"));
                application.setSession(rs.getString("Session"));
                application.setUsername(rs.getString("Username"));
                application.setNumber(rs.getString("Number"));
                application.setBlock(rs.getString("Block"));
                application.setRoomtype(rs.getString("RoomType"));
                application.setPrice(rs.getDouble("Price"));
                application.setStatus(rs.getInt("Status"));
                
                String applyDate = rs.getString("ApplyDate");
                String approvedDate = rs.getString("ApprovedDate");
                
                //convert apply date string to date (still mysql date)
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                try {
                   date = formatter.parse(applyDate);
                } catch (Exception ex) {}
                
                //convert mysql date to MY date
                formatter = new SimpleDateFormat("dd-MMM-yyyy");
                applyDate = formatter.format(date); 
                
                application.setApplyDate(applyDate);
                
                //convert approved date to MY format
                formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                date = new Date();
                
                try {
                   date = formatter.parse(approvedDate);
                } catch (Exception ex) {}
                
                formatter = new SimpleDateFormat("dd-MMM-yyyy");
                approvedDate = formatter.format(date);
                
                application.setApprovedDate(approvedDate);
                
                applications.add(application);
            }
            
            //select all from room
            ResultSet rs1 = jdbcUtility.getPsSelectAllFromRoom().executeQuery();
            
            while (rs1.next()) {     
                room = new Room();
                room.setRoom_PK(rs1.getInt("Room_PK"));
                room.setNumber(rs1.getString("Number"));
                room.setBlock(rs1.getString("Block"));
                room.setGender(rs1.getInt("Gender"));
                room.setRoomType(rs1.getInt("RoomType_FK"));
                room.setOccupied(rs1.getInt("Occupied"));
                rooms.add(room);
            }
            
            //select all from roomtype
            ResultSet rs2 = jdbcUtility.getPsSelectAllFromRoomType().executeQuery();
            
            while (rs2.next()) {     
                roomType = new RoomType();
                roomType.setRoomType_PK(rs2.getInt("RoomType_PK"));
                roomType.setPic(rs2.getString("Pic"));
                roomType.setType(rs2.getString("Type"));
                roomType.setPrice(rs2.getDouble("Price"));
                roomType.setDescription(rs2.getString("Description"));
                roomTypes.add(roomType);
            }
            
            //select all from session
            ResultSet rs3 = jdbcUtility.getPsSelectAllFromSession().executeQuery();
            
            while (rs3.next()) {     
                session = new Session();
                session.setId(rs3.getInt("Session_PK"));
                session.setName(rs3.getString("Name"));
                session.setStatus(rs3.getInt("Status"));
                sessions.add(session);
                
                //set active session
                if(rs3.getInt("Status") == 1)
                    request.getSession().setAttribute("activeSession", rs3.getString("Name"));
            }
            
            //count total application
            ResultSet rs4 = jdbcUtility.getPsCountTotalApplication().executeQuery();
            while (rs4.next()) {
                request.setAttribute("totalApplication", rs4.getInt("count"));
            }
            
            //count approved application
            ResultSet rs5 = jdbcUtility.getPsCountApprovedApplication().executeQuery();
            while (rs5.next()) {
                request.setAttribute("approvedApplication", rs5.getInt("count"));
            }
            
            //count rejected application
            ResultSet rs6 = jdbcUtility.getPsCountRejectedApplication().executeQuery();   
            while (rs6.next()) {
                request.setAttribute("rejectedApplication", rs6.getInt("count"));
            }
            
            //count unoccupied single room
            ResultSet rs7 = jdbcUtility.getPsCountUnoccupiedSingleRoom().executeQuery();
            while (rs7.next()) {     
                request.setAttribute("unoccupiedSingleRoom", rs7.getInt("count"));
            }
            
            //count occupied single room
            ResultSet rs8 = jdbcUtility.getPsCountOccupiedSingleRoom().executeQuery();
            while (rs8.next()) {     
                request.setAttribute("occupiedSingleRoom", rs8.getInt("count"));
            }
            
            //count unoccupied single room with bathroom
            ResultSet rs9 = jdbcUtility.getPsCountUnoccupiedSingleRoomWBathroom().executeQuery();
            while (rs9.next()) {     
                request.setAttribute("unoccupiedSingleRoomWBathroom", rs9.getInt("count"));
            }
            
            //count occupied single room with bathroom
            ResultSet rs10 = jdbcUtility.getPsCountOccupiedSingleRoomWBathroom().executeQuery();
            while (rs10.next()) {     
                request.setAttribute("occupiedSingleRoomWBathroom", rs10.getInt("count"));
            }
            
            //count unoccupied double room
            ResultSet rs11 = jdbcUtility.getPsCountUnoccupiedDoubleRoom().executeQuery();
            while (rs11.next()) {     
                request.setAttribute("unoccupiedDoubleRoom", rs11.getInt("count"));
            }
            
            //count occupied double room
            ResultSet rs12 = jdbcUtility.getPsCountOccupiedDoubleRoom().executeQuery();
            while (rs12.next()) {     
                request.setAttribute("occupiedDoubleRoom", rs12.getInt("count"));
            }
            
            //get active session
            ResultSet rs13 = jdbcUtility.getPsSelectAllFromActiveSession().executeQuery();
            while (rs13.next()) {     
                request.setAttribute("activeSession", rs13.getString("Name"));
            }
        }
        catch (SQLException ex)
	{
            while (ex != null)
            {
                System.out.println ("SQLState: " +
                                 ex.getSQLState ());
                System.out.println ("Message:  " +
                                 ex.getMessage ());
		System.out.println ("Vendor:   " +
                                 ex.getErrorCode ());
                ex = ex.getNextException ();
		      System.out.println ("");
            }
            
            System.out.println("Connection to the database error");
	}
	catch (java.lang.Exception ex)
	{
            ex.printStackTrace ();
	}              
    
        //put into request
        request.setAttribute("applications", applications);
        request.setAttribute("rooms", rooms);
        request.setAttribute("roomTypes", roomTypes);
        request.setAttribute("sessions", sessions);
        
        //redirect to managedestination.jsp
        sendPage(request, response, "/admin/dashboard.jsp");
    }
    
    void sendPage(HttpServletRequest req, HttpServletResponse res, String fileName) throws ServletException, IOException
    {
        // Get the dispatcher; it gets the main page to the user
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(fileName);

	if (dispatcher == null)
	{
            System.out.println("There was no dispatcher");
	    // No dispatcher means the html file could not be found.
	    res.sendError(res.SC_NO_CONTENT);
	}
	else
	    dispatcher.forward(req, res);
    }                

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
