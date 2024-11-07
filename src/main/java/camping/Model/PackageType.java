package camping.Model;

import java.io.InputStream;

public class PackageType {

	private int packageId;
	private String packageName;
	private double packagePrice;
	private int capacity;
	private int bed;
	private String services;
	private InputStream file;
	private String image;
	
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public InputStream getFile() {
		return file;
	}

	public void setFile(InputStream file) {
		this.file = file;
	}

	public PackageType() {}
	
	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public String getServices() {
		return services;
	}

	public void setServices(String services) {
		this.services = services;
	}


	public int getPackageId() {
		return packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public double getPackagePrice() {
		return packagePrice;
	}

	public void setPackagePrice(double packagePrice) {
		this.packagePrice = packagePrice;
	}
	
	
}
