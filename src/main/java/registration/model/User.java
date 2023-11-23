package registration.model;
public class User {
    private String NIC;
    private String username;
    private String mobile;
    private String address;
    private String password;

    public User() {
    }

    public User(String NIC, String username, String mobile, String address, String password) {
        this.NIC = NIC;
        this.username = username;
        this.mobile = mobile;
        this.address = address;
        this.password = password;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
