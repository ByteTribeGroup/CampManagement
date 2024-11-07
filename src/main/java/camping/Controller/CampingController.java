package camping.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import camping.DAO.*;
import camping.Model.Booking;
import camping.Model.Payment;

/**
 * Servlet implementation class CampingController
 */
public class CampingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action="",foward="";
	private final String PACKAGE = "room-details.jsp";
	private final String BOOK = "successPay.jsp";
	private final String ADD = "bookinglist.jsp";
	private final String INVOICE = "payment.jsp";
	private final String VIEW = "justPayment.jsp";
	private int id;
	
	Booking booking = new Booking();
	//private final String ADD = "addShawl.jsp";
	//private final String UPDATE = "updateShawl.jsp";
	//private final String LIST = "listShawl.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("package")) {
			//view package
			id = Integer.parseInt(request.getParameter("type"));
			foward = PACKAGE;
			
			request.setAttribute("packagetype", PackageDAO.getPackage(id));
			request.setAttribute("bookedDates", BookingDAO.getDate());
		}
		/*else if(action.equalsIgnoreCase("invoice")) {
			foward = INVOICE;
			id = Integer.parseInt(request.getParameter("packageID"));
			
			Booking booking = new Booking();

		    booking.setPackageId(Integer.parseInt(request.getParameter("packageID")));
		    booking.setNightNum(Integer.parseInt(request.getParameter("nights")));
		    String dateRange = request.getParameter("daterange");
		    String[] dates = dateRange.split(" - ");
	        String startDate = dates[0];
	        String endDate = dates[1];
	        System.out.println(startDate);
		    booking.setStartDate(startDate);
		    booking.setEndDate(endDate);
		    booking.setAdult(Integer.parseInt(request.getParameter("adults")));
		    booking.setChild(Integer.parseInt(request.getParameter("child")));
		    booking.setLotNum(Integer.parseInt(request.getParameter("lotNum")));
		    
		    HttpSession session = request.getSession();
	        session.setAttribute("booking", booking);
			request.setAttribute("bookings", PackageDAO.getPackage(id));
		}
		else if(action.equalsIgnoreCase("book")) {
			
			foward = ADD;
			
			Booking booking = new Booking();

			booking.setCustId(Integer.parseInt(request.getParameter("userId")));
			booking.setPackageId(Integer.parseInt(request.getParameter("packageID")));
		    booking.setNightNum(Integer.parseInt(request.getParameter("nights")));
		    String dateRange = request.getParameter("daterange");
		    String[] dates = dateRange.split(" - ");
	        String startDate = dates[0];
	        String endDate = dates[1];
	        System.out.println(startDate);
		    booking.setStartDate(startDate);
		    booking.setEndDate(endDate);
		    booking.setAdult(Integer.parseInt(request.getParameter("adults")));
		    booking.setChild(Integer.parseInt(request.getParameter("child")));
		    booking.setLotNum(Integer.parseInt(request.getParameter("lotNum")));
		    
		    try {
		    	boolean status = BookingDAO.insertBooking(booking);
		    	if(status) {
		    		request.setAttribute("status", "success");
		    	}else {
		    		request.setAttribute("status", "failure");
		    	}
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
		    
		    id = Integer.parseInt(request.getParameter("userId"));
    		request.setAttribute("bookings", BookingDAO.getAllCustomerBooking(id));
    		
		    
		}*/
		else if(action.equals("pay")) {
			
			foward = ADD;
			
			Payment payment = new Payment();
		    payment.setCardName(request.getParameter("cardName"));
		    payment.setCardNum(request.getParameter("cardNum"));
		    payment.setCvv(request.getParameter("cvv"));
		    payment.setExpiredDate(request.getParameter("expiryDate"));
		    payment.setCustID(Integer.parseInt(request.getParameter("custId")));
		    
		    Booking booking = new Booking();
		    booking.setBookId(Integer.parseInt(request.getParameter("bookId")));
		    
		    try {
		    	BookingDAO.updatePayment(payment, booking);
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
		    
		    request.setAttribute("status", "successPay");
    		request.setAttribute("bookings", BookingDAO.getAllCustomerBooking(Integer.parseInt(request.getParameter("custId"))));
    		
		}

		RequestDispatcher req = request.getRequestDispatcher(foward);
		req.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		action = request.getParameter("action");

		if (action.equalsIgnoreCase("book")) {
		    Booking booking = new Booking();
		    booking.setCustId(Integer.parseInt(request.getParameter("custID")));
		    booking.setPackageId(Integer.parseInt(request.getParameter("packageID")));
		    booking.setNightNum(Integer.parseInt(request.getParameter("night")));
		    booking.setStartDate(request.getParameter("startDate"));
		    booking.setEndDate(request.getParameter("endDate"));
		    booking.setAdult(Integer.parseInt(request.getParameter("adult")));
		    booking.setChild(Integer.parseInt(request.getParameter("child")));
		    booking.setLotNum(Integer.parseInt(request.getParameter("lot")));

		    Payment payment = new Payment();
		    payment.setCardName(request.getParameter("cardName"));
		    payment.setCardNum(request.getParameter("cardNum"));
		    payment.setCvv(request.getParameter("cvv"));
		    payment.setExpiredDate(request.getParameter("expiryDate"));
		    payment.setCustID(Integer.parseInt(request.getParameter("custID")));

		    boolean bookingSuccess = false;
		    boolean paymentSuccess = false;

		    try {
		        bookingSuccess = BookingDAO.insertBookingPayment(booking);
		        if (bookingSuccess) {
		            paymentSuccess = BookingDAO.updatePayment(payment, booking);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    String status = "failure";
		    if (bookingSuccess && paymentSuccess) {
		        status = "success";
		    }

		    request.setAttribute("status", status);
		    foward = BOOK; // Replace with your actual forward page
		    
		}else if(action.equalsIgnoreCase("invoice")) {
			
			foward = INVOICE;
			id = Integer.parseInt(request.getParameter("packageID"));
			
			Booking booking = new Booking();

		    booking.setPackageId(Integer.parseInt(request.getParameter("packageID")));
		    booking.setNightNum(Integer.parseInt(request.getParameter("nights")));
		    String dateRange = request.getParameter("daterange");
		    String[] dates = dateRange.split(" - ");
	        String startDate = dates[0];
	        String endDate = dates[1];
	        System.out.println(startDate);
		    booking.setStartDate(startDate);
		    booking.setEndDate(endDate);
		    booking.setAdult(Integer.parseInt(request.getParameter("adults")));
		    booking.setChild(Integer.parseInt(request.getParameter("child")));
		    booking.setLotNum(Integer.parseInt(request.getParameter("lotNum")));
		    
		    HttpSession session = request.getSession();
	        session.setAttribute("booking", booking);
			request.setAttribute("bookings", PackageDAO.getPackage(id));
			
		}else if(action.equalsIgnoreCase("booking")) {
			
			foward = ADD;
			
			Booking booking = new Booking();

			booking.setCustId(Integer.parseInt(request.getParameter("userId")));
			booking.setPackageId(Integer.parseInt(request.getParameter("packageID")));
		    booking.setNightNum(Integer.parseInt(request.getParameter("nights")));
		    String dateRange = request.getParameter("daterange");
		    String[] dates = dateRange.split(" - ");
	        String startDate = dates[0];
	        String endDate = dates[1];
	        System.out.println(startDate);
		    booking.setStartDate(startDate);
		    booking.setEndDate(endDate);
		    booking.setAdult(Integer.parseInt(request.getParameter("adults")));
		    booking.setChild(Integer.parseInt(request.getParameter("child")));
		    booking.setLotNum(Integer.parseInt(request.getParameter("lotNum")));
		    
		    try {
		    	boolean status = BookingDAO.insertBooking(booking);
		    	if(status) {
		    		request.setAttribute("status", "success");
		    	}else {
		    		request.setAttribute("status", "failure");
		    	}
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
		    
		    id = Integer.parseInt(request.getParameter("userId"));
    		request.setAttribute("bookings", BookingDAO.getAllCustomerBooking(id));
    		
		}else if(action.equals("view")) {
			
			foward = VIEW;
			id = Integer.parseInt(request.getParameter("bookId"));
			request.setAttribute("bookings", CustomerDAO.getCustomerDetail(id));
			
		}else if(action.equalsIgnoreCase("delete")) {
			foward = ADD;
			
			id = Integer.parseInt(request.getParameter("bookId"));
			try {
				boolean status = CustomerDAO.deleteCustomerBooking(id);
				if(status) {
		    		request.setAttribute("status", "successDelete");
		    	}else {
		    		request.setAttribute("status", "failureDelete");
		    	}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			HttpSession session = request.getSession();

            int custid = (Integer) session.getAttribute("sessionId");
			request.setAttribute("bookings", BookingDAO.getAllCustomerBooking(custid));
		}
		
		RequestDispatcher req = request.getRequestDispatcher(foward);
	    req.forward(request, response);

	}
	

}
