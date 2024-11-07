package camping.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import camping.Connection.ConnectionManager;
import camping.Model.Staff;

public class StaffDAO {

    private static Connection con = null;
    private static PreparedStatement ps = null;
    @SuppressWarnings("unused")
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static List<Staff> getAllStaff() {
        List<Staff> staffList = new ArrayList<Staff>();

        try {
            con = ConnectionManager.getConnection();
            stmt = con.createStatement();
            String query = "SELECT * FROM staff ORDER BY staffIC";
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffIC(rs.getInt("staffIC"));
                staff.setAdminID(rs.getInt("adminID"));
                staff.setStaffName(rs.getString("staffName"));
                staff.setStaffEmail(rs.getString("staffEmail"));
                staff.setStaffPhoneno(rs.getString("staffPhoneno"));
                staff.setUsername(rs.getString("staffUserName"));
                staffList.add(staff);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staffList;
    }

    public static Staff getStaffDetail(int staffIC) {
        Staff staff = new Staff();

        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM staff WHERE staffIC = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, staffIC);

            rs = ps.executeQuery();
            if (rs.next()) {
                staff.setStaffIC(rs.getInt("staffIC"));
                staff.setAdminID(rs.getInt("adminID"));
                staff.setStaffName(rs.getString("staffName"));
                staff.setStaffPhoneno(rs.getString("staffPhoneno"));
                staff.setStaffEmail(rs.getString("staffEmail"));
                staff.setUsername(rs.getString("staffUserName"));
                staff.setPassword(rs.getString("staffPass"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return staff;
    }

    public static void insertStaff(Staff staff) throws SQLException {
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO staff (staffIC, staffName, staffEmail, staffPhoneno, staffUserName, staffPass) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setInt(1, staff.getStaffIC());
            ps.setString(2, staff.getStaffName());
            ps.setString(3, staff.getStaffEmail());
            ps.setString(4, staff.getStaffPhoneno());
            ps.setString(5, staff.getUsername());
            ps.setString(6, staff.getPassword());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public static void updateStaff(Staff staff) throws SQLException {
        try {
            con = ConnectionManager.getConnection();
            String sql = "UPDATE staff SET staffName=?, staffEmail=?, staffPhoneno=? WHERE staffIC=?";
            ps = con.prepareStatement(sql);

            ps.setString(1, staff.getStaffName());
            ps.setString(2, staff.getStaffEmail());
            ps.setString(3, staff.getStaffPhoneno());
            ps.setInt(4, staff.getStaffIC());

            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteStaff(int staffIC) throws SQLException {
        try {
            con = ConnectionManager.getConnection();
            String sql = "DELETE FROM staff WHERE staffIC=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, staffIC);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public static int getStaffId(String username) {
		int id = 0;
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT staffIC FROM staff WHERE staffUserName = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				id = rs.getInt("staffIC");
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
}
