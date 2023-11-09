package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Account;

/**
 *
 * @author ThuyVy
 */
public class AccountDAO extends DBContext {
//    public Account checklogin(String user, String pass ){
//        String sql ="select username, password from Account where username = ? and password = ?";
//        
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql);
//            pre.setString(1, user);
//            pre.setString(2, pass);
//            ResultSet rs = pre.executeQuery();
//            if(rs.next()){
//                Account a = new Account(user, pass);
//                return a;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Account a = new Account(rs.getInt("UserID"),
                        rs.getString("Name"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getString("IsAdmin"),
                        rs.getString("sdt"));
                list.add(a);
            }

        } catch (SQLException e) {
            System.out.println("sql: " + e);
        }
        return list;
    }

    public Account getAccount(String email, String pass) {
        try {
            String sql = "select *  from Users where email = ? and password = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("Name"));
                a.setPassword(rs.getString("Password"));
                a.setId(rs.getInt("UserID"));
                a.setIsAdmin(String.valueOf(rs.getBoolean("IsAdmin")));
                return a;
            }

        } catch (SQLException ex) {
            System.out.println("getAccount" + ex);
        }
        return null;
    }

    public Account getAccountById(String id) {
        try {
            String sql = "select *  from Users where userid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("Name"));
                a.setPassword(rs.getString("Password"));
                a.setPhone(rs.getString("sdt"));
                a.setId(rs.getInt("UserID"));
                a.setIsAdmin(String.valueOf(rs.getBoolean("IsAdmin")));
                return a;
            }

        } catch (SQLException ex) {
            System.out.println("getAccount" + ex);
        }
        return null;
    }

    public void createAccount(Account a) {
        String sql = "INSERT INTO Users (Name, Email, Password, sdt) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getEmail());
            st.setString(4, a.getPhone());
            st.executeUpdate();

        } catch (SQLException e) {
System.out.println(e);
        }
    }

    public static void main(String[] args) {
        AccountDAO d = new AccountDAO();
        System.out.println(d.getAccount("123@gmail.com", "123"));
    }

    public Account getAccountbyEmail(String email) {
        String sql = "select * from Users where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account c = new Account(rs.getInt("UserID"),
                        rs.getString("Name"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getString("isAdmin"),
                        rs.getString("sdt")
                );
                return c;
            }

        } catch (SQLException e) {
            System.out.println("sql: " + e);
        }
        return null;
    }
    

}
