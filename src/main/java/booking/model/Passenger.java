package booking.model;

public class Passenger {
	private String pId;
	
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	
	private String Name;
	private String NIC;
	private String conNum;
	private String address;
	private String email;

	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getNIC() {
		return NIC;
	}
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	public String getConNum() {
		return conNum;
	}
	public void setConNum(String string) {
		this.conNum = string;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
}
