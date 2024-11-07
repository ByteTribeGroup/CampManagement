package camping.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import camping.Model.*;
import camping.Connection.*;

public class CustomerDAO {
	
	private static Connection con = null;
	private static PreparedStatement ps = null;
	@SuppressWarnings("unused")
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	// Check if email is already registered
	public static boolean isEmailRegistered(String email) throws SQLException {
	    boolean isRegistered = false;
	    
	    try {
	        con = ConnectionManager.getConnection();
	        String sql = "SELECT email FROM customer WHERE email = ?";
	        ps = con.prepareStatement(sql);
	        ps.setString(1, email);
	        rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            isRegistered = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return isRegistered;
	}
	
	// Check if username is already registered
	public static boolean isUsernameRegistered(String username) throws SQLException {
	    boolean isRegistered = false;
	    
	    try {
	        con = ConnectionManager.getConnection();
	        String sql = "SELECT username FROM customer WHERE username = ?";
	        ps = con.prepareStatement(sql);
	        ps.setString(1, username);
	        rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            isRegistered = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return isRegistered;
	}
	
	// Register a new user
	public static void RegisterUser(Customer customer) throws SQLException {
		try {
			con = ConnectionManager.getConnection();
			String sql = "INSERT INTO customer (email, username, password) VALUES (?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, customer.getEmail());
			ps.setString(2, customer.getUsername());
			ps.setString(3, customer.getPassword());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
	}
	
	// Customer login
	public boolean customerLogin(Customer customer) {
		boolean status = false;
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT custID FROM customer WHERE username=? AND password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, customer.getUsername());
			ps.setString(2, customer.getPassword());
			rs = ps.executeQuery();
			
			if (rs.next()) {
	            int custID = rs.getInt("custID");
	            customer.setCustId(custID);
	            status = true;
	        }
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	// Get user ID by username
	public static int getUserId(String username) {
		int id = 0;
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT custID FROM customer WHERE username = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				id = rs.getInt("custID");
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	// Staff login
	public boolean StaffLogin(Staff staffs) {
		boolean status = false;
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT * FROM staff WHERE staffUserName=? AND staffPass=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, staffs.getUsername());
			ps.setString(2, staffs.getPassword());
			rs = ps.executeQuery();
			status = rs.next();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	// Get customer details by booking ID
	public static Customer getCustomerDetail(int bookId) {
		Customer customer = new Customer();
		Booking booking = new Booking();
		PackageType packagetype = new PackageType();
		Payment payment = new Payment();
		
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM customer c JOIN booking b ON c.custID = b.custID JOIN package p ON b.packageID = p.packageID JOIN payment pay ON b.bookID = pay.bookID WHERE b.bookID = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bookId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				customer.setCustId(rs.getInt("custID"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setAddress(rs.getString("address"));
				customer.setPhoneNum(rs.getString("phoneNum"));
				customer.setEmail(rs.getString("email"));
				customer.setUsername(rs.getString("username"));
				customer.setPassword(rs.getString("password"));
				
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
				
				packagetype.setPackageName(rs.getString("packageName"));
				packagetype.setBed(rs.getInt("bed"));
				packagetype.setServices(rs.getString("service"));
				packagetype.setPackagePrice(rs.getDouble("packagePrice"));
				packagetype.setPackageId(rs.getInt("packageId"));
				
				payment.setPayStatus(rs.getString("payStatus"));
				//paymet
				
				customer.setPayment(payment);
				customer.setPackagetype(packagetype);
				customer.setBooking(booking);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	// Get customer details by user ID
	public static Customer getCustomer(int userId) {
		Customer customer = new Customer();
		Booking booking = new Booking();
		
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM customer WHERE custId = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				customer.setCustId(rs.getInt("custID"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setAddress(rs.getString("address"));
				customer.setPhoneNum(rs.getString("phoneNum"));
				customer.setEmail(rs.getString("email"));
				customer.setUsername(rs.getString("username"));
				customer.setPassword(rs.getString("password"));
				customer.setBooking(booking);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	public static boolean updateCustomer(Customer customer) {

	    
	    try {
	        con = ConnectionManager.getConnection();
	        
	        String sql = "UPDATE customer SET firstName=?,lastName=?, phoneNum=?, password=?, address=? WHERE custId=?";
	        
	        ps = con.prepareStatement(sql);
	        
	        ps.setString(1, customer.getFirstName());
	        ps.setString(2, customer.getLastName());
	        ps.setString(3, customer.getPhoneNum());
	        ps.setString(4, customer.getPassword());
	        ps.setString(5, customer.getAddress());
	        ps.setInt(6, customer.getCustId());
	        
	        int rowsUpdated = ps.executeUpdate();
	        
	        con.close();
	        
	        return rowsUpdated > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (ps != null) {
	                ps.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}

	public static boolean deleteCustomerBooking(int bookId) {
        boolean result = false;
        
        try {
            con = ConnectionManager.getConnection();
            
            String sql = "DELETE FROM booking WHERE bookId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookId);
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return result;
    }

}
