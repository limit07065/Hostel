/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import bean.RoomType;
import bean.User;
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
@WebServlet(name = "Login", urlPatterns = {"/Login", ""})
public class Login extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;

    public void init() throws ServletException {
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

        //Check if login already
        HttpSession session = request.getSession(false);

        //if user not logon
        if (session.getAttribute("user") == null) {
            request.setAttribute("loginError", "");   //Reset loginError attr, just in case
            sendPage(request, response, "/login.jsp");
        } else {
            User user = (User) session.getAttribute("user");

            //Redirect user according to their user level

            //admin
            if(user.getLevel() == 0) 
                response.sendRedirect("dashboard");

            else
            //student
                response.sendRedirect("Apply");
        }
    }

    void sendPage(HttpServletRequest req, HttpServletResponse res, String fileName) throws ServletException, IOException {
        // Get the dispatcher; it gets the main page to the user
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(fileName);

        if (dispatcher == null) {
            System.out.println("There was no dispatcher");
            // No dispatcher means the html file could not be found.
            res.sendError(res.SC_NO_CONTENT);
        } else {
            dispatcher.forward(req, res);
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            PreparedStatement ps = jdbcUtility.getPsSelectUserViaUserPass();
            
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            boolean status = rs.next();

            if (status) {
                User userBean = new User();
                userBean.setUsername(rs.getString("Username"));
                userBean.setPassword(rs.getString("Password"));
                userBean.setLevel(rs.getInt("Level"));
                userBean.setGender(rs.getInt("Gender"));
                userBean.setId(rs.getString("Id"));
                userBean.setName(rs.getString("Name"));
                userBean.setContact(rs.getString("Contact"));
                userBean.setEmail(rs.getString("Email"));
                userBean.setPic(rs.getString("Pic"));

                HttpSession session = request.getSession();
                session.setAttribute("user", userBean);

                if(userBean.getLevel() == 0)
                    response.sendRedirect("dashboard");

                else
                    response.sendRedirect("Apply");    
            }
            else if(!status){
                request.setAttribute("loginError", "Username and Password do not match");

                sendPage(request, response, "/login.jsp");
            }

        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
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
