/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Categories;
import models.Product;

/**
 *
 * @author chi
 */
public class ProductDAO extends DBContext {

    public ArrayList<Product> getProduct(String cid, String search, int index, String sort) {
        String sortby = "";
        switch (sort) {
            case "1":
                sortby = "order by p.createddate desc";
                break;
            case "2":
                sortby = "order by p.price asc";
                break;
            case "3":
                sortby = "order by p.price desc";
                break;
            default:
                sortby = "order by p.name desc";
                break;

        }
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select * from [Products] p, Categories c where p.categoryid = c.categoryid \n"
                + "  and p.categoryid like ?  and p.name like ?  "
                + sortby
                + "  OFFSET ? ROWS FETCH NEXT 6  ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + cid + "%");
            ps.setString(2, "%" + search + "%");
            ps.setInt(3, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Product> getTop4Popular() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select top 4 * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Product> getTop4Newest() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select top 4 * from Products order by createddate desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getNumberProduct(String cid, String search) {
        String sql = "  select count(*) from Products p, Categories c where p.categoryid = c.categoryid \n"
                + "  and p.categoryid like ?  and p.name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + cid + "%");
            ps.setString(2, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Product getProductById(int pid) {
        String sql = " select * from Products \n"
                + "  where productid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Categories> getCategory() {
        ArrayList<Categories> list = new ArrayList<>();
        String sql = "  select* from Categories";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void DeleteProduct(int pid) {
        String sql = "  DELETE FROM [Products] WHERE productid =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateProduct(String id, String name, String price, String cateId, String descri, String img) {
        String sql = "  UPDATE [Products]  set [name]= ?   ,[price] = ? ,  \n"
                + "  [categoryid] = ?   ,[image] = ? ,[description] = ? \n"
                + "  where productid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, cateId);
            ps.setString(4, img);
            ps.setString(5, descri);
            ps.setString(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void AddProduct(String name, String price, String cateId,String descri, String img) {
        String sql = "insert into [Products] ([name],[price],[categoryid],[image],[description],[createddate]) values (?,?,?,?,?, getdate())";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, cateId);
            ps.setString(4, img);
            ps.setString(5, descri);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public ArrayList<Product> getAllProduct( String search) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select p.productid as productid, p.name as pName, p.description, "
                + " p.price as price, p.image as images, c.categoryid as categoryid, c.name as cName  from Products p, Categories c where p.categoryid = c.categoryid \n"
                + "  and p.name like ?"
                + " order by p.productid asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("productid"), rs.getString("pName"), rs.getString("description"), rs.getString("Price"),rs.getString("Images"), new Categories(rs.getString("categoryid"), rs.getString("cName"))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
        ArrayList<Product> list = new ArrayList<>();
        list = d.getAllProduct( "");
        for (Product product : list) {
            System.out.println(product);
        }
        d.AddProduct("test","1", "1", "test", "test");
       // System.out.println(d.getProductById(3).toString());
    }

}
