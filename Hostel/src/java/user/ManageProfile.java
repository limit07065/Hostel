/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

@WebServlet(name = "ManageProfile", urlPatterns = {"/Profile"})
public class ManageProfile extends HttpServlet {

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
        
        // Check if POST data is not null. If not null, then updating profile
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        
        if(email != null || contact != null)
            updateProfile(request, response);
        // End Updating profile
        
        // Check if POST data is not null. If not null, then changing password
        String oldpass = request.getParameter("oldpassword");
        String newpass = request.getParameter("newpassword");
        String cnewpass = request.getParameter("cnewpassword");
        
        if(oldpass != null && newpass != null && cnewpass != null){
            // Check if 2 new password match or not. Can be done in front end but need front end UI to display maybe? 
            if(!newpass.equals(cnewpass)){
                request.setAttribute("passNotMatch", "New password do not match each other");
                sendPage(request, response, "/profile.jsp");
            }
            else // If new password matched then call changePassword method
                changePassword(request, response);
        }
        // End changing password
        
        // Dispatch to view after all actions done
        sendPage(request, response, "/profile.jsp");

                
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

   void updateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
       HttpSession session = request.getSession();
       
       String email = request.getParameter("email");
       String contact = request.getParameter("contact");
       String username = ((User)session.getAttribute("user")).getUsername();
       
       // If user left blank for one of the field then use default, getting default value
       if(email == null || email.equals(""))
           email = ((User)session.getAttribute("user")).getEmail();
       if(contact == null || contact.equals(""))
           contact = ((User)session.getAttribute("user")).getContact();
       
       try{
           
           PreparedStatement ps = jdbcUtility.getPsUpdateUserViaUsername();
           ps.setString(1, email);
           ps.setString(2, contact);
           ps.setString(3, username);
           
           ps.executeUpdate();
           
       }catch(SQLException ex){}
       
       // to reflect data changed immediately after update (because we get data from session attribute so have to update here)
       User user = (User)session.getAttribute("user");
       user.setEmail(email);
       user.setContact(contact);
       session.setAttribute("user", user);
       request.setAttribute("changeSuccess", "Email and Contact No update successfully!");
   }
   
   void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
       HttpSession session = request.getSession();
       
       String oldPass = ((User)session.getAttribute("user")).getPassword();
       String cOldPass = request.getParameter("oldpassword"); 
       
       // Check if old password matched or not
       if(!oldPass.equals(cOldPass)){
           request.setAttribute("passNotMatch", "Old password does not match with database");
           sendPage(request, response, "/profile.jsp");
       }
       else{
            String newpass = request.getParameter("newpassword");
            String username = ((User)session.getAttribute("user")).getUsername();

            try {
                PreparedStatement ps = jdbcUtility.getPsChangePasswordViaUsername();
                ps.setString(1, newpass);
                ps.setString(2, username);

                ps.executeUpdate();

            }catch(SQLException ex){}

            // to reflect data changed immediately after update
            User user = (User)session.getAttribute("user");
            user.setPassword(newpass);
            session.setAttribute("user", user);
            request.setAttribute("passNotMatch", "");
            request.setAttribute("changeSuccess", "Password Update Successfully!");
       }
   }
   
}
