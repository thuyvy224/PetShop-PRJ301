package models;

/**
 *
 * @author ThuyVy
 */
public class Orders {
    private String OrderID, OrderDate, ShippingAddress, TotalAmout, UserID;
    private Account user;

    public Orders() {
    }

    public Orders(String OrderID, String OrderDate, String ShippingAddress, String TotalAmout, String UserID) {
        this.OrderID = OrderID;
        this.OrderDate = OrderDate;
        this.ShippingAddress = ShippingAddress;
        this.TotalAmout = TotalAmout;
        this.UserID = UserID;
    }

    public Orders(String OrderID, String OrderDate, String ShippingAddress, String TotalAmout, Account user) {
        this.OrderID = OrderID;
        this.OrderDate = OrderDate;
        this.ShippingAddress = ShippingAddress;
        this.TotalAmout = TotalAmout;
        this.user = user;
    }

    public String getOrderID() {
        return OrderID;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getShippingAddress() {
        return ShippingAddress;
    }

    public void setShippingAddress(String ShippingAddress) {
        this.ShippingAddress = ShippingAddress;
    }

    public String getTotalAmout() {
        return TotalAmout;
    }

    public void setTotalAmout(String TotalAmout) {
        this.TotalAmout = TotalAmout;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    @Override
    public String toString() {
        return "Orders{" + "OrderID=" + OrderID + ", OrderDate=" + OrderDate + ", ShippingAddress=" + ShippingAddress + ", TotalAmout=" + TotalAmout + ", UserID=" + UserID + '}';
    }
    
}
