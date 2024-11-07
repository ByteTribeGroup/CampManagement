package camping.Model;

public class Booking {

	private int nightNum;
	private String startDate;
	private String endDate;
	private int adult;
	private int child;
	private int lotNum;
	private int custId;
	private int packageId;
	private double totalPrice;
	private int bookId;
	private int staffId;
	private String bookStatus;
	private Customer customer;
	private PackageType packageType;
	private Payment payment;
	private String payStatus;
	private String packageName;
	private int totalBooking;
	private double totalSum;
	private int approvedBooking;
	private int pendingBooking;
	private int cancelBooking;
	private String period;
	private double revenue;
	
	public Booking() {}

	public int getNightNum() {
		return nightNum;
	}

	public void setNightNum(int nightNum) {
		this.nightNum = nightNum;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getChild() {
		return child;
	}

	public void setChild(int child) {
		this.child = child;
	}

	public int getLotNum() {
		return lotNum;
	}

	public void setLotNum(int lotNum) {
		this.lotNum = lotNum;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public int getPackageId() {
		return packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public String getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public PackageType getPackageType() {
		return packageType;
	}

	public void setPackageType(PackageType packageType) {
		this.packageType = packageType;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public double adultPrice() {
		
		return adult*40;
	}
	
	public double childPrice() {
		
		return child*20;
	}
	
	public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public double getTotalSum() {
		return totalSum;
	}

	public void setTotalSum(double totalSum) {
		this.totalSum = totalSum;
	}

	public int getApprovedBooking() {
		return approvedBooking;
	}

	public void setApprovedBooking(int approvedBooking) {
		this.approvedBooking = approvedBooking;
	}

	public int getPendingBooking() {
		return pendingBooking;
	}

	public void setPendingBooking(int pendingBooking) {
		this.pendingBooking = pendingBooking;
	}

	public int getCancelBooking() {
		return cancelBooking;
	}

	public void setCancelBooking(int cancelBooking) {
		this.cancelBooking = cancelBooking;
	}

	public int getTotalBooking() {
		return totalBooking;
	}

	public void setTotalBooking(int totalBooking) {
		this.totalBooking = totalBooking;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public double getRevenue() {
		return revenue;
	}

	public void setRevenue(double revenue) {
		this.revenue = revenue;
	}
	
	
}
