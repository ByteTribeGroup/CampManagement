package camping.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import camping.DAO.*;
import camping.Model.Customer;
import camping.Model.Staff;

/**
 * Servlet implementation class UserController
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private String action="",foward="";
	private final String VIEW = "rooms.jsp";
	private final String VIEW2 = "room_before.jsp";
	private final String BOOKING = "bookinglist.jsp";
	private final String USER = "userprofile.jsp";
	private final String LOGIN = "welcome.jsp";
	private final String MAIN = "login.jsp";
	private final String INVOICE = "invoice.jsp";
	private final String INVOICE2 = "invoice2.jsp";
	private final String ADMIN = "homeadmin.jsp";
	private final String LOGADMIN = "loginadmin.jsp";
	int id;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	action = request.getParameter("action");
    	
    	if(action.equalsIgnoreCase("view")) {
    		foward = VIEW;
    		
    		request.setAttribute("packages",PackageDAO.getAllPackage());
    	}
    	else if(action.equalsIgnoreCase("view2")) {
    		foward = VIEW2;
    		
    		request.setAttribute("packages",PackageDAO.getAllPackage());
    	}
    	else if(action.equals("booking")) {
    		foward = BOOKING;
    		
    		HttpSession session = request.getSession();

            id = (Integer) session.getAttribute("sessionId");
    		request.setAttribute("bookings", BookingDAO.getAllCustomerBooking(id));
    	}
    	else if(action.equalsIgnoreCase("userProfile")) {
    		foward = USER;
    		
    		HttpSession session = request.getSession();
            id = (Integer) session.getAttribute("sessionId");
    		request.setAttribute("users", CustomerDAO.getCustomer(id));
    	}
    	else if(action.equalsIgnoreCase("update")) {
    		foward = USER;
    		
    		Customer customer = new Customer();
    		customer.setCustId(Integer.parseInt(request.getParameter("userId")));
    		customer.setAddress(request.getParameter("address"));
    		customer.setFirstName(request.getParameter("firstName"));
    		customer.setLastName(request.getParameter("lastName"));
    		customer.setPhoneNum(request.getParameter("phone"));
    		customer.setPassword(request.getParameter("password"));
    		

    		try {
    			boolean updateSuccess = CustomerDAO.updateCustomer(customer);
    			if (updateSuccess) {
    		        request.setAttribute("status", "success");
    		    } else {
    		        request.setAttribute("status", "failure");
    		    }
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    		
    		request.setAttribute("users", CustomerDAO.getCustomer(id));
    		
    	}else if(action.equals("invoiceGet")) {
    		
    		foward = INVOICE2;
    		id = Integer.parseInt(request.getParameter("bookId"));
    		System.out.println(id);
			request.setAttribute("bookings", CustomerDAO.getCustomerDetail(id));
    	}
    	
    	
    	RequestDispatcher req = request.getRequestDispatcher(foward);
		req.forward(request, response);
    	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("login")) {
			//login for customer and staff
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String user = request.getParameter("login_type");
			
			if(user.equals("user")) {
				
				Customer customer = new Customer();
				
				customer.setUsername(username);
				customer.setPassword(password);
				
				CustomerDAO login = new CustomerDAO();
				
				if(login.customerLogin(customer)) {
					session = request.getSession(true);
					session.setAttribute("sessionId",CustomerDAO.getUserId(username));
					request.setAttribute("id", CustomerDAO.getUserId(username));
					request.setAttribute("packages",PackageDAO.getAllPackage());
					foward= LOGIN;
				}else {
					request.setAttribute("status", "failed_login");
					foward = MAIN;
				}
				
			}else if(user.equals("staff")){
				Staff staffs = new Staff();
				
				staffs.setUsername(username);
				staffs.setPassword(password);
				
				CustomerDAO login = new CustomerDAO();
				
				if(login.StaffLogin(staffs)) {
					session = request.getSession(true);
					session.setAttribute("sessionId",StaffDAO.getStaffId(username));
					foward=ADMIN;
				}else {
					request.setAttribute("status", "failed_login");
					foward = LOGADMIN;
				}
			}
		}else if(action.equalsIgnoreCase("register")) {
			//register customer
			Customer customer = new Customer();
			
			customer.setEmail(request.getParameter("email"));
			customer.setUsername(request.getParameter("username"));
			customer.setPassword(request.getParameter("password"));
			
			try {
				if(CustomerDAO.isEmailRegistered(customer.getEmail())) {
					request.setAttribute("status", "email_exists");
		            foward = MAIN;
				}else if(CustomerDAO.isUsernameRegistered(customer.getUsername())) {
					request.setAttribute("status", "username_taken");
					foward = MAIN;
				}
				else {
					CustomerDAO.RegisterUser(customer);
					request.setAttribute("status", "success");
					foward = MAIN;
				}
			}catch(Exception e) {
				e.printStackTrace();
				request.setAttribute("status", "failure");
				foward = MAIN;
			}
			
		}else if(action.equalsIgnoreCase("invoice")) {
    		
    		foward = INVOICE;
    		id = Integer.parseInt(request.getParameter("bookId"));
			request.setAttribute("bookings", CustomerDAO.getCustomerDetail(id));
    	}
		
		RequestDispatcher req = request.getRequestDispatcher(foward);
		req.forward(request, response);
	}

}
