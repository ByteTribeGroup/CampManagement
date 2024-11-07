package camping.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import camping.Connection.ConnectionManager;
import camping.Model.*;

public class BookingDAO {

    private static Connection con = null;
    private static PreparedStatement ps = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Get all bookings
    public static List<Booking> getAllBooking() {
	    List<Booking> bookingList = new ArrayList<>();
	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;

	    try {
	        con = ConnectionManager.getConnection();
	        stmt = con.createStatement();

	        String sql = "SELECT booking.*, payment.payStatus, package.packageName " +
	                     "FROM booking " +
	                     "JOIN payment ON booking.bookID = payment.bookID " +
	                     "JOIN package ON booking.packageID = package.packageID " +
	                     "ORDER BY booking.bookID";

	        rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            Booking booking = new Booking();
	            booking.setStartDate(rs.getString("startDate"));
	            booking.setEndDate(rs.getString("endDate"));
	            booking.setLotNum(rs.getInt("lotNum"));
	            booking.setBookId(rs.getInt("bookID"));
	            booking.setCustId(rs.getInt("custID"));
	            booking.setTotalPrice(rs.getInt("totalPrice"));
	            booking.setPackageId(rs.getInt("packageID"));
	            booking.setBookStatus(rs.getString("bookStatus"));
	            
	            
	            booking.setPackageName(rs.getString("packageName"));
	            booking.setPayStatus(rs.getString("payStatus"));

	            bookingList.add(booking);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (con != null) con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return bookingList;
	}
	
	public static List<Booking> getPendingBookings() {
	    List<Booking> bookingList = new ArrayList<Booking>();

	    try {
	        con = ConnectionManager.getConnection();
	        stmt = con.createStatement();
	        String query = "SELECT * FROM booking WHERE bookStatus = 'Review'";
	        rs = stmt.executeQuery(query);

	        while (rs.next()) {
	        	 Booking booking = new Booking();
		            booking.setStartDate(rs.getString("startDate"));
		            booking.setEndDate(rs.getString("endDate"));
		            booking.setLotNum(rs.getInt("lotNum"));
		            booking.setBookId(rs.getInt("bookID"));
		            booking.setCustId(rs.getInt("custID"));
		            booking.setBookStatus(rs.getString("bookStatus"));
		            
		            bookingList.add(booking);
		        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return bookingList;
	}
	
	public static List<Booking> getApproveBookings() {
	    List<Booking> bookingList = new ArrayList<Booking>();

	    try {
	        con = ConnectionManager.getConnection();
	        stmt = con.createStatement();
	        String query = "SELECT * FROM booking WHERE bookStatus = 'ACCEPTED'";
	        rs = stmt.executeQuery(query);

	        while (rs.next()) {
	        	 Booking booking = new Booking();
		            booking.setStartDate(rs.getString("startDate"));
		            booking.setEndDate(rs.getString("endDate"));
		            booking.setLotNum(rs.getInt("lotNum"));
		            booking.setBookId(rs.getInt("bookID"));
		            booking.setCustId(rs.getInt("custID"));
		            booking.setBookStatus(rs.getString("bookStatus"));
		            
		            bookingList.add(booking);
		        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return bookingList;
	}
	
	public static List<Booking> getDenyBookings() {
	    List<Booking> bookingList = new ArrayList<Booking>();

	    try {
	        con = ConnectionManager.getConnection();
	        stmt = con.createStatement();
	        String query = "SELECT * FROM booking WHERE bookStatus = 'DENIED'";
	        rs = stmt.executeQuery(query);

	        while (rs.next()) {
	        	 Booking booking = new Booking();
		            booking.setStartDate(rs.getString("startDate"));
		            booking.setEndDate(rs.getString("endDate"));
		            booking.setLotNum(rs.getInt("lotNum"));
		            booking.setBookId(rs.getInt("bookID"));
		            booking.setCustId(rs.getInt("custID"));
		            booking.setBookStatus(rs.getString("bookStatus"));
		            
		            bookingList.add(booking);
		        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return bookingList;
	}

    // Get all bookings for a specific customer
    public static List<Booking> getAllCustomerBooking(int custId) {
        List<Booking> bookingList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM booking b JOIN customer c ON b.custId = c.custID JOIN package p ON b.packageId = p.packageId LEFT JOIN payment py ON b.bookId = py.bookId WHERE b.custId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, custId);
            rs = ps.executeQuery();

            // Process the result set
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookId(rs.getInt("bookID"));
                booking.setNightNum(rs.getInt("nightNum"));
                booking.setStartDate(rs.getString("startDate"));
                booking.setEndDate(rs.getString("endDate"));
                booking.setAdult(rs.getInt("adult"));
                booking.setChild(rs.getInt("child"));
                booking.setLotNum(rs.getInt("lotNum"));
                booking.setBookId(rs.getInt("bookID"));
                booking.setCustId(rs.getInt("custID"));
                booking.setStaffId(rs.getInt("staffIC"));
                booking.setPackageId(rs.getInt("packageID"));
                booking.setBookStatus(rs.getString("bookStatus"));
                booking.setTotalPrice(rs.getDouble("totalPrice"));

                /*Customer customer = new Customer();
                customer.setFirstName(rs.getString("firstName"));
                customer.setLastName(rs.getString("lastName"));
                customer.setPhoneNum(rs.getString("phoneNum"));*/
                
                PackageType packagetype = new PackageType();
                packagetype.setPackageName(rs.getString("packageName"));
                packagetype.setPackageId(rs.getInt("packageID"));

                Payment payment = new Payment();
                payment.setPayStatus(rs.getString("payStatus"));
                //booking.setCustomer(customer);
                
                booking.setPackageType(packagetype);
                booking.setPayment(payment);
                bookingList.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return bookingList;
    }

    // Get distinct dates from booking
    public static List<String> getDate() {
        List<String> dateList = new ArrayList<>();

        try {
            // Establish database connection
            con = ConnectionManager.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT DISTINCT startDate FROM booking UNION SELECT DISTINCT endDate FROM booking";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            // Process the result set
            while (rs.next()) {
                dateList.add(rs.getString("startDate"));
            }

            // Sort the dates
            Collections.sort(dateList);
            System.out.println(dateList);

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dateList;
    }

    public static boolean insertBooking(Booking booking) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Establish database connection
            con = ConnectionManager.getConnection();
            booking.setTotalPrice((findPackagePrice(booking.getPackageId()) * booking.getNightNum())+booking.adultPrice()+booking.childPrice());

            String sql = "INSERT INTO booking (custID, packageID, nightNum, startDate, endDate, adult, child, lotNum, totalPrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setInt(1, booking.getCustId());
            ps.setInt(2, booking.getPackageId());
            ps.setInt(3, booking.getNightNum());
            ps.setString(4, booking.getStartDate());
            ps.setString(5, booking.getEndDate());
            ps.setInt(6, booking.getAdult());
            ps.setInt(7, booking.getChild());
            ps.setInt(8, booking.getLotNum());
            ps.setDouble(9, booking.getTotalPrice());

            int row = ps.executeUpdate();

            if (row > 0) {
                // Insert successful
                return true;
            } else {
                // Insert failed
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false; // Insert failed due to an exception
        } finally {
            // Close resources in finally block to ensure they are always closed
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    
    // Insert a new booking
    public static boolean insertBookingPayment(Booking booking) {
        try {
            // Establish database connection
            con = ConnectionManager.getConnection();
            booking.setTotalPrice((findPackagePrice(booking.getPackageId()) * booking.getNightNum())+booking.adultPrice()+booking.childPrice());

            String sql = "INSERT INTO booking (custID, packageID, nightNum, startDate, endDate, adult, child, lotNum, totalPrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setInt(1, booking.getCustId());
            ps.setInt(2, booking.getPackageId());
            ps.setInt(3, booking.getNightNum());
            ps.setString(4, booking.getStartDate());
            ps.setString(5, booking.getEndDate());
            ps.setInt(6, booking.getAdult());
            ps.setInt(7, booking.getChild());
            ps.setInt(8, booking.getLotNum());
            ps.setDouble(9, booking.getTotalPrice());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected == 0) {
                return false; // Insert failed
            }

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int bookID = rs.getInt(1);
                booking.setBookId(bookID); // Store the bookID in the Booking object
            }

            // Close connection
            con.close();
            return true; // Insert successful
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Insert failed due to an exception
        }
    }

    // Update payment details
    public static boolean updatePayment(Payment payment, Booking booking) {
        try {
            // Establish database connection
            con = ConnectionManager.getConnection();

            String sql = "UPDATE payment SET payStatus = ?, cardName = ?, CVV = ?, cardNum = ?, expiredDate = ? WHERE bookId = ?";
            ps = con.prepareStatement(sql);

            ps.setString(1, "Done");
            ps.setString(2, payment.getCardName());
            ps.setString(3, payment.getCvv());
            ps.setString(4, payment.getCardNum());
            ps.setString(5, payment.getExpiredDate());
            ps.setInt(6, booking.getBookId());

            int rowsAffected = ps.executeUpdate();

            // Close connection
            con.close();
            return rowsAffected > 0; // Update successful if at least one row was affected
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Update failed due to an exception
        }
    }

    // Find package price by package ID
    public static double findPackagePrice(int id) {
        double packagePrice = 0;
        try {
            // Establish database connection
            con = ConnectionManager.getConnection();

            String sql = "SELECT packagePrice FROM package WHERE packageID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            // Process the result set
            if (rs.next()) {
                packagePrice = rs.getDouble("packagePrice");
            }

            // Close resources
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return packagePrice;
    }
    
    public static List<Booking> getCountAllBooking() {
	    List<Booking> bookingList = new ArrayList<Booking>();

	    try {
	        con = ConnectionManager.getConnection();
	        stmt = con.createStatement();

	        // Execute first query to get totalBooking
	        String sumQuery = "SELECT SUM(totalPrice) AS totalSum FROM booking";
	        rs = stmt.executeQuery(sumQuery);
	        int totalSum = 0;
	        if (rs.next()) {
	        	totalSum = rs.getInt("totalSum");
	        }
	        rs.close();

	        // Execute second query to get pendingBooking
	        String pendingQuery = "SELECT COUNT(bookID) AS pendingBooking FROM booking WHERE bookStatus = 'Review'";
	        rs = stmt.executeQuery(pendingQuery);
	        int pendingBooking = 0;
	        if (rs.next()) {
	            pendingBooking = rs.getInt("pendingBooking");
	        }
	        rs.close();

	        // Execute third query to get cancelBooking
	        String cancelQuery = "SELECT COUNT(bookID) AS cancelBooking FROM booking WHERE bookStatus = 'DENIED'";
	        rs = stmt.executeQuery(cancelQuery);
	        int cancelBooking = 0;
	        if (rs.next()) {
	            cancelBooking = rs.getInt("cancelBooking");
	        }
	        rs.close();

	        // Execute fourth query to get approvedBooking
	        String approvedQuery = "SELECT COUNT(bookID) AS approvedBooking FROM booking WHERE bookStatus = 'ACCEPTED'";
	        rs = stmt.executeQuery(approvedQuery);
	        int approvedBooking = 0;
	        if (rs.next()) {
	            approvedBooking = rs.getInt("approvedBooking");
	        }
	        rs.close();

	        // Create a Booking object and add to the list
	        Booking books = new Booking();
	        books.setTotalSum(totalSum);
	        books.setPendingBooking(pendingBooking);
	        books.setCancelBooking(cancelBooking);
	        books.setApprovedBooking(approvedBooking);
	        bookingList.add(books);

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return bookingList;
	}
    
    public static void updateBooking (Booking booking)
	{
			try {
				//call getConnection() method
				con = ConnectionManager.getConnection();
				//3. create statement
				ps = con.prepareStatement("UPDATE booking SET bookStatus=? WHERE bookID=?");

				ps.setString(1, booking.getBookStatus());
				ps.setInt(2, booking.getBookId());
				//4. execute query
				ps.executeUpdate();
				//5. close connection
				con.close();
				}catch(Exception e) {
				e.printStackTrace();
				}
		}	
	
	public static void deleteBooking(int bookId) throws SQLException{
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			//3. create statement
			String sql = "DELETE FROM booking WHERE bookID=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookId);
			//4. execute query
			ps.executeUpdate();
			//5. close connection
			con.close();
			}catch(SQLException e) {
			e.printStackTrace();
			}
		
	}
	
	 public static List<Booking> getPerPackage() {
	        List<Booking> packageBookings = new ArrayList<>();
	        try {
	            con = ConnectionManager.getConnection();
	            
	            String sql = "SELECT p.packageID, p.packageName, COUNT(b.bookID) AS total_bookings " +
	                         "FROM package p LEFT JOIN booking b ON p.packageID = b.packageID " +
	                         "GROUP BY p.packageID, p.packageName " +
	                         "ORDER BY total_bookings DESC";

	            ps = con.prepareStatement(sql);
	            rs = ps.executeQuery();

	            while (rs.next()) {
	                PackageType packageType = new PackageType();
	                Booking booking = new Booking();
	                
	                packageType.setPackageId(rs.getInt("packageID"));
	                packageType.setPackageName(rs.getString("packageName"));
	                booking.setTotalBooking(rs.getInt("total_bookings"));
	                booking.setPackageType(packageType);
	                
	                packageBookings.add(booking);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            // Close resources in finally block to ensure they are released
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (Exception ex) {
	                ex.printStackTrace();
	            }
	        }

	        return packageBookings;
	    }
	 
	 public static List<Booking> getRevenue() {
		    List<Booking> revenue = new ArrayList<Booking>();
		    
		    try {
		        con = ConnectionManager.getConnection();
		        
		        String sql = "SELECT DATE_FORMAT(endDate, '%Y-%m') AS period, SUM(totalPrice) AS totalRevenue FROM booking GROUP BY DATE_FORMAT(endDate, '%Y-%m') ORDER BY period";
		        
		        ps = con.prepareStatement(sql);
		        rs = ps.executeQuery();
		        
		        while (rs.next()) {
		            Booking booking = new Booking();
		            
		            booking.setPeriod(rs.getString("period"));
		            booking.setRevenue(rs.getDouble("totalRevenue"));
		            
		            revenue.add(booking); // Add the booking to the list
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (rs != null) {
		                rs.close();
		            }
		            if (ps != null) {
		                ps.close();
		            }
		            if (con != null) {
		                con.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    return revenue;
		}
 }
