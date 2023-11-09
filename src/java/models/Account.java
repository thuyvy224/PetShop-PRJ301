/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author Teacher
 */
public class Account {
    private int id;
    private String username, password, Email ,isAdmin, phone;

    public Account() {
    }

    public Account(int id, String username, String password, String Email, String isAdmin, String phone) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.Email = Email;
        this.isAdmin = isAdmin;
        this.phone = phone;
    }

    
    public Account(String username, String password, String isAdmin) {
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public Account(int id, String username, String password, String isAdmi, String phone) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
   
    
    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", username=" + username + ", password=" + password + ", isAdmin=" + isAdmin + '}';
    }

    
    
    
    
}
