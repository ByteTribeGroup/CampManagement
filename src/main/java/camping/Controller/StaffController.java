package camping.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import camping.Model.*;
import camping.DAO.*;

/**
 * Servlet implementation class AdminController
 */
@SuppressWarnings("unused")
public class StaffController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String action = "", forward = "";
    private final String VIEW = "stafflist.jsp";
    private final String EDIT= "updateStaff.jsp";
    private final String INSERT= "insertstaff.jsp";


    private int id;

    public StaffController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");

        if (action.equalsIgnoreCase("view")) {
    
            forward = VIEW;
            
            request.setAttribute("staffs",StaffDAO.getAllStaff());
            
        } else if (action.equalsIgnoreCase("edit")) {
            
            id = Integer.parseInt(request.getParameter("staffIC"));
            forward = EDIT;
            request.setAttribute("staff", StaffDAO.getStaffDetail(id));
            request.setAttribute("staffIC", id);
            
        } else if (action.equalsIgnoreCase("delete")) {
            
        	forward = VIEW;
            id = Integer.parseInt(request.getParameter("staffIC"));

             try {
				StaffDAO.deleteStaff(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            request.setAttribute("staffs", StaffDAO.getAllStaff());
        }else if(action.equalsIgnoreCase("insert")) {
        	
        	forward = INSERT;
        	
        	request.setAttribute("staff", StaffDAO.getAllStaff());
        }
        RequestDispatcher req = request.getRequestDispatcher(forward);
        req.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Staff staff = new Staff();
        
        
        if (action.equalsIgnoreCase("insert")) 
        {
        	System.out.print("inserting...");
        	forward=INSERT;
        	
        	staff.setStaffIC(Integer.parseInt(request.getParameter("staffIC")));
        	staff.setStaffName(request.getParameter("staffName"));
            staff.setStaffEmail(request.getParameter("staffEmail"));
            staff.setStaffPhoneno(request.getParameter("staffPhoneno"));
            staff.setUsername(request.getParameter("staffUserName"));
            staff.setPassword(request.getParameter("staffPassword"));
            try {
                StaffDAO.insertStaff(staff); // Call DAO method to insert staff
                System.out.println("New staff added successfully.");
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Redirect or forward as needed
            request.setAttribute("staffs", StaffDAO.getAllStaff());
            RequestDispatcher req = request.getRequestDispatcher(VIEW);
            req.forward(request, response);
        }
        else if (action.equalsIgnoreCase("edit")) 
        {
            
            staff.setStaffName(request.getParameter("staffName"));
            staff.setStaffEmail(request.getParameter("staffEmail"));
            staff.setStaffPhoneno(request.getParameter("staffPhoneno"));
            
            id = Integer.parseInt(request.getParameter("staffIC"));
            
            staff.setStaffIC(id);
            try {
                if (id != 0) {
                    StaffDAO.updateStaff(staff);
                    System.out.print("Updating staff...\n");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            request.setAttribute("staffs", StaffDAO.getAllStaff());
            RequestDispatcher req = request.getRequestDispatcher(VIEW);
            req.forward(request, response);
        }
        
        

}
}