package com.myshop.connection;

public class User {
    private int u_id;
    private String name;
    private String phone;
    private String email;
    private String address;
    private String zipcode;
    private String password;
    private String usertype;

    public User(int u_id, String name, String phone, String email, String address, String zipcode, String password, String usertype) {
        this.u_id = u_id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.zipcode = zipcode;
        this.password = password;
        this.usertype = usertype;
    }

    public User(String name, String phone, String email, String address, String zipcode, String password, String usertype) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.zipcode = zipcode;
        this.password = password;
        this.usertype = usertype;
    }

    public User(String phone, String password) {
        this.phone = phone;
        this.password = password;
    }
    
    

    public User() {
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    @Override
    public String toString() {
        return "User{" + "u_id=" + u_id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", address=" + address + ", zipcode=" + zipcode + ", password=" + password + ", usertype=" + usertype + '}';
    }

    
   

    
    
    
}
