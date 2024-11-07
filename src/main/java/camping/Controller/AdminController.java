package camping.Controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import camping.Model.*;
import camping.DAO.*;

/**
 * Servlet implementation class AdminController
 */
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String action = "", forward = "";
    private final String VIEW = "bookingrecordadmin.jsp";
    private final String EDIT = "updatebooking.jsp";
    private final String REPORT = "reportbooking.jsp";
    private final String PENDING ="bookingrecordadmin.jsp";
    private final String SUM ="bookingrecordadmin.jsp";
    private final String APPROVE ="bookingrecordadmin.jsp";
    private final String DENIED ="bookingrecordadmin.jsp";

    private int id;

    public AdminController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");

        if (action.equalsIgnoreCase("view")) {
    
            forward = VIEW;
            request.setAttribute("bookings", BookingDAO.getAllBooking());
            request.setAttribute("action", action);
            
        } else if (action.equalsIgnoreCase("sum")) {
            
            forward = SUM;
            request.setAttribute("bookings", BookingDAO.getCountAllBooking());
            request.setAttribute("action", action);
            
        } else if (action.equalsIgnoreCase("approve")) {
            
            forward = APPROVE;
            request.setAttribute("bookings", BookingDAO.getApproveBookings());
            request.setAttribute("action", action);
         
        } else if (action.equalsIgnoreCase("pending")) {
            
            forward = PENDING;
            request.setAttribute("bookings", BookingDAO.getPendingBookings());
            request.setAttribute("action", action);
            
        } else if (action.equalsIgnoreCase("deny")) {
            
            forward = DENIED;
            request.setAttribute("bookings", BookingDAO.getDenyBookings());
            request.setAttribute("action", action);
         
        } else if (action.equalsIgnoreCase("edit")) {
         
            id = Integer.parseInt(request.getParameter("bookId"));
            forward = EDIT;
            request.setAttribute("customers", CustomerDAO.getCustomerDetail(id));
            
        } else if (action.equalsIgnoreCase("delete")) {
            forward = VIEW;
       
            int bookId = Integer.parseInt(request.getParameter("bookId"));

            try {
                BookingDAO.deleteBooking(bookId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
            request.setAttribute("bookings", BookingDAO.getAllBooking());
            
        } else if (action.equalsIgnoreCase("report")) {
         
            forward = REPORT;
            request.setAttribute("bookings", BookingDAO.getAllBooking());
        }
        
        RequestDispatcher req = request.getRequestDispatcher(forward);
        req.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			
					Booking booking=new Booking();
					
					booking.setBookStatus(request.getParameter("bookStatus"));
					System.out.println(booking.getBookStatus());
					
					int id = Integer.parseInt(request.getParameter("bookId"));
					booking.setBookId(id);
						try
						{
							if(id!=0)
							{
								booking.setBookId(id);
								BookingDAO.updateBooking(booking);
								System.out.print("updating...");
							}
							
						}
						catch (Exception e) 
						{
							e.printStackTrace();
						}
							
					//set attribute to a servlet request. 
						request.setAttribute("bookings",BookingDAO.getAllBooking());
						
					//Obtain the RequestDispatcher from the request object. 
						RequestDispatcher req=request.getRequestDispatcher(VIEW);
					
					//Dispatch the request to another resource using forward() methods of the RequestDispatcher
					 req.forward(request, response);

		}

}
