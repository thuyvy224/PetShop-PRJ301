package models;

/**
 *
 * @author ThuyVy
 */
public class OrderItems {
    private String OrderItemID, OrderID, ProductID, Quantity,Price;
    private Product product;

    public OrderItems() {
    }

    public OrderItems(String OrderItemID, String OrderID, String ProductID, String Quantity, String Price) {
        this.OrderItemID = OrderItemID;
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.Quantity = Quantity;
        this.Price = Price;
    }

    public OrderItems(String OrderItemID, String OrderID, String Quantity, String Price, Product product) {
        this.OrderItemID = OrderItemID;
        this.OrderID = OrderID;
        this.Quantity = Quantity;
        this.Price = Price;
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    

    public String getOrderItemID() {
        return OrderItemID;
    }

    public void setOrderItemID(String OrderItemID) {
        this.OrderItemID = OrderItemID;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getQuantity() {
        return Quantity;
    }

    public void setQuantity(String Quantity) {
        this.Quantity = Quantity;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "OrderItems{" + "OrderItemID=" + OrderItemID + ", OrderID=" + OrderID + ", ProductID=" + ProductID + ", Quantity=" + Quantity + ", Price=" + Price + ", product=" + product + '}';
    }

    
    
}
