/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package application;

import bean.Application;
import bean.Room;
import bean.RoomType;
import bean.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * @author wenhe
 */
@WebServlet(name = "Apply", urlPatterns = {"/Apply"})
public class Apply extends HttpServlet {

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
    
     /* Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        getApplicationRecord(request, response);        
        getRoomType(request, response);
         if(request.getParameter("apply")==null)
         {
              request.getRequestDispatcher("/application.jsp").forward(request,response);
         }
         else{
             request.getRequestDispatcher("/apply.jsp").forward(request,response);
         }
        
       
        
        
            
        
        
    }
    
    void getApplicationRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        
        try {
            //Get active session
            ResultSet rs = jdbcUtility.getPsSelectAllFromSession().executeQuery();
            
            while(rs.next()) {
                if(rs.getInt("Status") == 0) // 0 == active | 1 == inactive      WTF~
                    session.setAttribute("activeSession", rs.getString("Name"));
                
            }
            
            PreparedStatement ps = jdbcUtility.getPsSelectApplicationViaUserName();
            ps.setString(1, ((User)session.getAttribute("user")).getUsername());
            
            rs = ps.executeQuery();
            
            Application application;
            ArrayList appList = new ArrayList();
            session.setAttribute("open", "1");
            
            while(rs.next()) {
                application = new Application();
                application.setSession(rs.getString("Session"));
                application.setUsername(rs.getString("Username"));
                application.setNumber(rs.getString("Number"));
                application.setBlock(rs.getString("Block"));
                application.setRoomtype(rs.getString("RoomType"));
                application.setPrice(rs.getDouble("Price"));
                application.setStatus(rs.getInt("Status"));
                
                SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                String date = format.format(rs.getDate("ApplyDate"));
                application.setApplyDate(date);
                
                appList.add(application);
                
                //reset open to 0 when user already applied for room
                if(application.getSession().equals(session.getAttribute("activeSession")))
                    session.setAttribute("open", "0");
            }
            
            session.setAttribute("applications", appList);
            
        }catch(SQLException ex){}
    }
    
    void getRoomType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        
        RoomType rt;

        try {
            ResultSet rs = jdbcUtility.getPsSelectAllFromRoomType().executeQuery();

            ArrayList roomtypeList = new ArrayList();

            while(rs.next()){
                rt = new RoomType();
                rt.setRoomType_PK(rs.getInt("RoomType_PK"));
                rt.setType(rs.getString("Type"));
                rt.setDescription(rs.getString("Description"));
                rt.setPic(rs.getString("Pic"));
                rt.setPrice(rs.getDouble("Price"));

                roomtypeList.add(rt);
            }

            session.setAttribute("roomTypes", roomtypeList);
        }
        catch(SQLException ex)
        {}
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
        
        HttpSession session = request.getSession();
        
        String activeSession = (String)session.getAttribute("activeSession");
        String username = ((User)session.getAttribute("user")).getUsername();
        String roomNo = request.getParameter("room");
        String block = request.getParameter("block");
        String roomtype = request.getParameter("roomtype");
        double price = 0.0;
        
        // Get ApplyDate from server time
        Date dt = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String applyDate = format.format(dt);
        
        
        try{
            
            // Get roomtype name and room price from database 
            ResultSet rs = jdbcUtility.getPsSelectAllFromRoomType().executeQuery();
            String typeName="";
            
            while(rs.next()){
                if(rs.getString("RoomType_PK").equals(roomtype)){
                    price = rs.getDouble("Price");
                    typeName = rs.getString("Type");
                }
            }
        
            // starting to insert record
            PreparedStatement ps = jdbcUtility.getPsInsertApplication();
            ps.setString(1, activeSession);
            ps.setString(2, username);
            ps.setString(3, roomNo);
            ps.setString(4, block);
            ps.setString(5, typeName);
            ps.setDouble(6, price);
            ps.setString(7, applyDate);
            ps.executeUpdate();
            
            // Get Room_PK from database
            ps = jdbcUtility.getPsSelectRoomViaTypeNBlock();
            ps.setString(1, roomtype);
            ps.setString(2, block);
            
            rs = ps.executeQuery();
            
            String id="";
            while(rs.next()){
                if(rs.getString("Number").equals(roomNo))
                    id = rs.getString("Room_PK");
            }
            
            // Update room status to 1 == occupied
            ps = jdbcUtility.getPsUpdateRoomStatusViaId();
            ps.setString(1, "1");
            ps.setString(2, id);
            ps.executeUpdate();
            
            session.setAttribute("open", "0");
            
            //reload session attr before forwarding view
            getApplicationRecord(request, response);
            request.getRequestDispatcher("/application.jsp").forward(request,response);
        }catch(SQLException ex){}
        
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
