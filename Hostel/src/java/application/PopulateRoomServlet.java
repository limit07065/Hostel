/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package application;

import bean.Room;
import bean.RoomType;
import bean.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        
        HttpSession session = request.getSession();
        
        String roomtype = request.getParameter("type");
        String block = request.getParameter("block");    
        int gender = ((User)session.getAttribute("user")).getGender();
        
        if(roomtype != null){            
           try{
                PreparedStatement ps = jdbcUtility.getPsSelectBlockViaRoomTypeNGender();
                ps.setString(1, roomtype);
                ps.setInt(2, gender);
                ResultSet rs = ps.executeQuery();
                ArrayList blockList = new ArrayList();
                Room rm;
                
                while(rs.next()){
                    rm = new Room();
                    rm.setBlock(rs.getString("Block"));
                    blockList.add(rm);
                }
                
                session.setAttribute("block", blockList);
            }
            catch (SQLException ex) 
            {            
            }  
        }
       
        if(block != null){
            try{
                PreparedStatement ps = jdbcUtility.getPsSelectRoomViaTypeBlockNGender();
                ps.setString(1, roomtype);
                ps.setString(2, block);
                ps.setInt(3, gender);
                ResultSet rs = ps.executeQuery();
                ArrayList roomList = new ArrayList();
                Room rm;
                
                while(rs.next()){
                    rm = new Room();
                    rm.setRoom_PK(rs.getInt("Room_PK"));
                    rm.setBlock(rs.getString("Block"));
                    rm.setNumber(rs.getString("Number"));
                    
                    roomList.add(rm);
                }
                
                session.setAttribute("roomAvailable", roomList);
            }
            catch(SQLException ex){}
        }
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
