/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoct
 */
public class User {
    private int user_id;
    private String user_name;
    private String user_password;
    private String user_role;
    private String dob;
    private String phone;
    private String address;
    private String gender;
    private String name;
    private String email;

    public User(int user_id, String user_name, String user_password, String user_email, String user_role, String fullname, String dob, String phone, String address, String gender, String name, String mail) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.user_role = user_role;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.name = name;
        this.email = mail;
    }
    public User() {
    }

    public User(int user_id, String user_name, String user_password, String user_email, String user_role, String fullname, String dob, String phone, String address, String gender) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.email = user_email;
        this.user_role = user_role;
        this.name = fullname;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
    }
    
    public User(int user_id, String user_name, String user_password, String user_email, String user_role, String fullname, String dob, String phone, String address) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.email = user_email;
        this.user_role = user_role;
        this.name = fullname;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
    }
    
    public User(int user_id, String user_name, String user_password, String user_email, String user_role,String phone) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.email = user_email;
        this.user_role = user_role;
        this.phone = phone;
    }
    public User(String fullname, int user_id , String gender, String phone, String user_email,String user_role) {
        this.name = fullname;
        this.user_id = user_id;
        this.gender = gender;
        this.phone= phone;
        this.email = user_email;
        this.user_role = user_role;
    }
    public User(String user_name, String user_password, String user_email, String user_role) {
        this.user_id = 0;
        this.user_name = user_name;
        this.user_password = user_password;
        this.email = user_email;
        this.user_role = user_role;
    }
    public User(String user_name, String user_password, String user_email, String user_role, String fullname,String phone, String address) {
        this.user_id = 0;
        this.user_name = user_name;
        this.user_password = user_password;
        this.email = user_email;
        this.user_role = user_role;
        this.name = fullname;
        this.phone = phone;
        this.address = address;
    }
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_email() {
        return email;
    }

    public void setUser_email(String user_email) {
        this.email = user_email;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }

    public String getFullname() {
        return name;
    }

    public void setFullname(String fullname) {
        this.name = fullname;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return email;
    }

    public void setMail(String mail) {
        this.email = mail;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password + ", user_email=" + email + ", user_role=" + user_role + ", fullname=" + name + ", dob=" + dob + ", phone=" + phone + ", address=" + address + ", gender=" + gender + '}';
    }   
}

