/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package application;

import bean.Room;
import bean.RoomType;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "PopulateRoomServlet", urlPatterns = {"/PopulateRoomServlet"})
public class PopulateRoomServlet extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;
    
    public void init() throws ServletException
    {
        String driver = "com.mysql.jdbc.Driver";

        String dbName = "hostel";
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
        HttpSession session = request.getSession();
        
        String roomtype = "%";
        String block = "%";        
        RoomType rt;
        Room room = new Room();
        
        if(session.getAttribute("roomtype") == null){
            try{
                PreparedStatement ps = jdbcUtility.getPsSelectAllFromRoomType();
                ResultSet rs = ps.executeQuery();
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

                session.setAttribute("roomtype", roomtypeList);
            }
            catch (SQLException ex) 
            {            
            }    
        }
        
        String change = request.getParameter("typeChange");
         /* if(change.equals("1")){
           try{
                PreparedStatement ps = jdbcUtility.getPsSelectAllFromRoomType();
                ResultSet rs = ps.executeQuery();
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

                session.setAttribute("roomtype", roomtypeList);
            }
            catch (SQLException ex) 
            {            
            }  
        }*/
        
       // sendPage(request, response, "/apply.jsp");
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
