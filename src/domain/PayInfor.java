package domain;

import java.sql.Date;

/**
 * 缴费信息
 * 
 * @author jalena
 */
public class PayInfor {

	/** ID */
	private int ID;
	/** 身份证号 */
	private String ID_Card;
	/** 流水号 */
	private String serialNumber;
	/** 缴费状态 */
	private String PaymentStatus;
	/** 学期 */
	private String paymentSemester;
	/** 缴费日期 */
	private java.util.Date paymentDate;
	/** 应交总额 */
	private double totalPayable;
	/** 实交总额 */
	private Double totalPaid;
	/** 缴费人 */
	private String Payers;
	/** 院系 */
	private String department;
	/** 方向 */
	private String direction;
	/** 学费 */
	private double tuition;
	/** 住宿费 */
	private double lodging;
	/** 书本费 */
	private double bookFees;

	public PayInfor() {
	}

	public int getID() {
		return ID;
	}

	public String getID_Card() {
		return ID_Card;
	}

	public void setID_Card(String iD_Card) {
		ID_Card = iD_Card;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getPaymentStatus() {
		return PaymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		PaymentStatus = paymentStatus;
	}

	public String getPaymentSemester() {
		return paymentSemester;
	}

	public void setPaymentSemester(String paymentSemester) {
		this.paymentSemester = paymentSemester;
	}

	public java.util.Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public double getTotalPayable() {
		return totalPayable;
	}

	public void setTotalPayable(double totalPayable) {
		this.totalPayable = totalPayable;
	}

	public Double getTotalPaid() {
		return totalPaid;
	}

	public void setTotalPaid(Double totalPaid) {
		this.totalPaid = totalPaid;
	}

	public String getPayers() {
		return Payers;
	}

	public void setPayers(String payers) {
		Payers = payers;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public double getTuition() {
		return tuition;
	}

	public void setTuition(double tuition) {
		this.tuition = tuition;
	}

	public double getLodging() {
		return lodging;
	}

	public void setLodging(double lodging) {
		this.lodging = lodging;
	}

	public double getBookFees() {
		return bookFees;
	}

	public void setBookFees(double bookFees) {
		this.bookFees = bookFees;
	}

	@Override
	public String toString() {
		return "PayInfor [ID=" + ID + ", ID_Card=" + ID_Card + ", serialNumber=" + serialNumber + ", PaymentStatus=" + PaymentStatus
		        + ", paymentSemester=" + paymentSemester + ", paymentDate=" + paymentDate + ", totalPayable=" + totalPayable + ", totalPaid="
		        + totalPaid + ", Payers=" + Payers + ", department=" + department + ", direction=" + direction + ", tuition=" + tuition + ", lodging="
		        + lodging + ", bookFees=" + bookFees + "]";
	}


}
