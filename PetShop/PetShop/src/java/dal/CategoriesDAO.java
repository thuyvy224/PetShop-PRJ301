package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Categories;

/**
 *
 * @author ThuyVy
 */
public class CategoriesDAO extends DBContext{
    public List<Categories> getAllCategories() {
        try {
            String sql = " SELECT CategoryId, Name FROM Categories ";
        List<Categories> categoriesList = new ArrayList<>();
         PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String categoryId = rs.getString("CategoryId");
                String name = rs.getString("Name");
                Categories category = new Categories(categoryId, name);
                categoriesList.add(category);
            }
            return categoriesList;
        } catch (SQLException e) {
            System.out.println( "sql: " + e );
        } 

        return null;
    }
}
