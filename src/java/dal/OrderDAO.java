/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Account;
import models.Cart;
import models.CartItem;
import models.OrderItems;
import models.Orders;
import models.Product;

/**
 *
 * @author chi
 */
public class OrderDAO extends DBContext {

    public void insertOrder(Account u, Cart cart, String address) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "INSERT INTO [Orders]\n"
                    + "           ([OrderDate]\n"
                    + "           ,[ShippingAddress]\n"
                    + "           ,[TotalAmount]\n"
                    + "           ,[UserID])\n"
                    + "     VALUES\n"
                    + "           (GETDATE()\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            ps = connection.prepareStatement(sql);
            ps.setString(1, address);
            ps.setInt(3, u.getId());
            ps.setDouble(2, cart.getTotalMoney());
            ps.executeUpdate();

            String sql1 = "select top 1 orderid from [Orders] order by orderid desc";
            ps = connection.prepareStatement(sql1);
            rs = ps.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt(1);
                for (CartItem item : cart.getItems()) {
                    String sql2 = "insert into [OrderItems] ([orderid],[productid],[price],[quantity]) values (?,?, ?, ?)";
                    ps = connection.prepareStatement(sql2);
                    ps.setInt(1, oid);
                    ps.setInt(2, item.getProduct().getProductID());
                    ps.setString(3, item.getProduct().getPrice());
                    ps.setInt(4, item.getQuantity());
                    ps.executeUpdate();
                }
            }
//            String sql3 = "update [Products] set [stock] = [stock] - ? "
//                    + "where productid = ?";
//            ps = connection.prepareStatement(sql3);
//            for (CartItem item : cart.getItems()) {
//                ps.setInt(1, item.getQuantity());
//                ps.setInt(2, item.getProduct().getProductID());
//                ps.executeUpdate();
//            }

        } catch (Exception e) {
        }
    }

    public ArrayList<Orders> getAllOrderByuId(int uid) {
        ArrayList<Orders> ol = new ArrayList<>();
        String sql = "  select * from [Orders] where userid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Orders(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return ol;
    }
    AccountDAO d = new AccountDAO();

    public ArrayList<Orders> getAllOrder() {
        ArrayList<Orders> ol = new ArrayList<>();
        String sql = "  select * from [Orders]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = d.getAccountById(rs.getString("userId"));
                ol.add(new Orders(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), a));
            }
        } catch (Exception e) {
        }
        return ol;
    }

    public ArrayList<OrderItems> getAllOrderDetailByoId(int oid) {
        ArrayList<OrderItems> odl = new ArrayList<>();
        String sql = " SELECT  p.*, o.* FROM [OrderItems] o, Products p where o.productid = p.productid and o.orderid =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("productid"), rs.getString("categoryid"), rs.getString("name"), rs.getString(4), rs.getString("Image"), rs.getString(6));
                odl.add(new OrderItems(rs.getString("OrderItemID"), rs.getString("orderid"), rs.getString("quantity"), rs.getString("price"), p));
            }
        } catch (Exception e) {
        }
        return odl;
    }

    public static void main(String[] args) {
        OrderDAO d = new OrderDAO();
        ArrayList<Orders> ol = new ArrayList<>();
        ol = d.getAllOrder();
        for (Orders orders : ol) {
            System.out.println(orders.toString());
        }
    }
}
