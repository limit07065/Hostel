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
        
        HttpSession httpsession = request.getSession(true);
        
        ArrayList applications = new ArrayList();
        Application application = null;    
        
        ArrayList rooms = new ArrayList();
        Room room = null;
        
        ArrayList roomTypes = new ArrayList();
        RoomType roomtype = null;
        
        ArrayList sessions = new ArrayList();
        Session session = null;
        
        try {   
            //select all from application
            ResultSet rs = jdbcUtility.getPsSelectAllFromApplication().executeQuery();
            
            while (rs.next()) {           
                application = new Application();
                application.setApplication_PK(rs.getInt("Application_PK"));
                application.setUsername(rs.getString("Username"));
                application.setNumber(rs.getString("Number"));
                application.setBlock(rs.getString("Block"));
                application.setStatus(rs.getInt("Status"));
                application.setApplyDate(rs.getString("ApplyDate"));
                application.setApprovedDate(rs.getString("ApprovedDate"));
                applications.add(application);
            }
            
            //select all from room
            ResultSet rs1 = jdbcUtility.getPsSelectAllFromRoom().executeQuery();
            
            while (rs.next()) {     
                room = new Room();
                room.setRoom_PK(rs.getInt("Room_PK"));
                room.setNumber(rs.getString("Number"));
                room.setBlock(rs.getString("Block"));
                room.setGender(rs.getInt("Gender"));
                room.setRoomType(rs.getInt("RoomType_PK"));
                room.setOccupied(rs.getInt("Occupied"));
                
                application = new Application();
                application.setApplication_PK(rs.getInt("Application_PK"));
                application.setUsername(rs.getString("Username"));
                application.setNumber(rs.getString("Number"));
                application.setBlock(rs.getString("Block"));
                application.setStatus(rs.getInt("Status"));
                application.setApplyDate(rs.getString("ApplyDate"));
                application.setApprovedDate(rs.getString("ApprovedDate"));
                applications.add(application);
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
    
        //put into sessions
        httpsession.setAttribute("applications", applications);
        
        //redirect to managedestination.jsp
        sendPage(request, response, "admin/dashboard.jsp");
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
