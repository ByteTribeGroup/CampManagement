package camping.DAO;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import camping.Connection.ConnectionManager;
import camping.Model.PackageType;

	
public class PackageDAO {
		
		private static Connection con = null;
		private static PreparedStatement ps = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		
		public static PackageType getPackage(int id) {
			
			PackageType packagetype = new PackageType();
			
			try {
				con = ConnectionManager.getConnection();
				
				String sql = "SELECT * FROM package WHERE packageID = ?";
				
				ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					
					Blob blob = rs.getBlob("image");
					
					InputStream inputStream = blob.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;
					
					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);                  
					}
					byte[] imageBytes = outputStream.toByteArray();
					String photo = Base64.getEncoder().encodeToString(imageBytes);
					
					packagetype.setImage(photo);
					packagetype.setPackageId(rs.getInt("packageID"));
					packagetype.setPackageName(rs.getString("packageName"));
					packagetype.setPackagePrice(rs.getDouble("packagePrice"));
					packagetype.setServices(rs.getString("service"));
					packagetype.setCapacity(rs.getInt("capacity"));
					packagetype.setBed(rs.getInt("bed"));
					
					inputStream.close();
					outputStream.close();

				}
				
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return packagetype;
		}
		
		public static List<PackageType> getAllPackage(){
			
			List<PackageType> packageTypes = new ArrayList<PackageType>();
			
			try {
				con = ConnectionManager.getConnection();
				
				con = ConnectionManager.getConnection();

				stmt = con.createStatement();
				String sql = "SELECT * FROM package ORDER BY packageID";

				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					PackageType packageType = new PackageType();
					
					packageType.setPackageId(rs.getInt("packageID"));
					packageType.setPackageName(rs.getString("packageName"));
					packageType.setPackagePrice(rs.getDouble("packagePrice"));
					packageType.setCapacity(rs.getInt("capacity"));
					packageType.setBed(rs.getInt("bed"));
					packageType.setServices(rs.getString("service"));
					
					packageTypes.add(packageType);
				}
				
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return packageTypes;
		}
}
