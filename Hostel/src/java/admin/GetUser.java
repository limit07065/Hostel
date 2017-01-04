/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.JDBCUtility;
import bean.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ray
 */
@WebServlet(name = "GetUser", urlPatterns = {"/GetUser"})
public class GetUser extends HttpServlet {
    
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
        
        String username = request.getParameter("username");
        User userBean = new User();

        try {
            PreparedStatement ps = jdbcUtility.getPsSelectAllFromUserViaUsername();
            
            ps.setString(1, username);            
            ResultSet rs = ps.executeQuery();

            boolean status = rs.next();

            if (status) {
                
                userBean.setUsername(rs.getString("Username"));
                userBean.setPassword(rs.getString("Password"));
                userBean.setLevel(rs.getInt("Level"));
                userBean.setGender(rs.getInt("Gender"));
                userBean.setId(rs.getString("Id"));
                userBean.setName(rs.getString("Name"));
                userBean.setContact(rs.getString("Contact"));
                userBean.setEmail(rs.getString("Email"));
                userBean.setPic(rs.getString("Pic"));
            }           

        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("{");
            out.println("\"Username\":\""+userBean.getUsername()+"\",");
            out.println("\"Gender\":\""+userBean.getGender()+"\",");
            out.println("\"Id\":\""+userBean.getId()+"\",");
            out.println("\"Name\":\""+userBean.getName()+"\",");
            out.println("\"Contact\":\""+userBean.getContact()+"\",");
            out.println("\"Email\":\""+userBean.getEmail()+"\",");
            out.println("\"Pic\":\""+userBean.getPic()+"\"");
            out.println("}");
           
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
