package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ThuyVy
 */
public class StatisticsDAO extends DBContext {

    public List<Integer> getNumOrdersEM() {
        String sql = "-- Tạo bảng tạm thời chứa tất cả các tháng từ tháng 1 đến tháng hiện tại\n"
                + "-- Tạo bảng tạm thời chứa tất cả các tháng từ tháng 1 đến tháng 12\n"
                + "WITH AllMonths AS (\n"
                + "  SELECT 1 AS MonthNumber, 'Tháng 1' AS MonthName\n"
                + "  UNION ALL\n"
                + "  SELECT 2, 'Tháng 2'\n"
                + "  UNION ALL\n"
                + "  SELECT 3, 'Tháng 3'\n"
                + "  UNION ALL\n"
                + "  SELECT 4, 'Tháng 4'\n"
                + "  UNION ALL\n"
                + "  SELECT 5, 'Tháng 5'\n"
                + "  UNION ALL\n"
                + "  SELECT 6, 'Tháng 6'\n"
                + "  UNION ALL\n"
                + "  SELECT 7, 'Tháng 7'\n"
                + "  UNION ALL\n"
                + "  SELECT 8, 'Tháng 8'\n"
                + "  UNION ALL\n"
                + "  SELECT 9, 'Tháng 9'\n"
                + "  UNION ALL\n"
                + "  SELECT 10, 'Tháng 10'\n"
                + "  UNION ALL\n"
                + "  SELECT 11, 'Tháng 11'\n"
                + "  UNION ALL\n"
                + "  SELECT 12, 'Tháng 12'\n"
                + ")\n"
                + "\n"
                + "\n"
                + "\n"
                + "-- Thống kê số lượng sản phẩm bán ra theo từng tháng\n"
                + "SELECT\n"
                + "    m.MonthNumber AS Thang,\n"
                + "    COALESCE(COUNT(o.OrderID), 0) AS SoLuongDonHang\n"
                + "FROM AllMonths m\n"
                + "LEFT JOIN Orders o ON m.MonthNumber = MONTH(o.OrderDate)\n"
                + "GROUP BY m.MonthNumber\n"
                + "ORDER BY m.MonthNumber;";
        List<Integer> list = new ArrayList<>() ;
        try {
          PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                int i = rs.getInt("SoLuongDonHang");
                list.add(i);
            }
        } catch (SQLException e) {
        }
        return list;

    }
     public static void main(String[] args) {
         StatisticsDAO sdao =  new StatisticsDAO();
        List<Integer> data = sdao.getNumOrdersEM();
         System.out.println(data);
    }
}
