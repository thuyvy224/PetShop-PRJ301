package models;

/**
 *
 * @author ThuyVy
 */
public class Product {

    private int ProductID;
    private String Name, Description, Price, CategoryID, images;
    private Categories categories;

    public Product() {
    }

    public Product(int ProductID, String CategoryID, String Name, String Price, String images, String Description) {
        this.ProductID = ProductID;
        this.Name = Name;
        this.Description = Description;
        this.Price = Price;
        this.CategoryID = CategoryID;
        this.images = images;
    }

    public Product(int ProductID, String Name, String Description, String Price, String images, Categories categories) {
        this.ProductID = ProductID;
        this.Name = Name;
        this.Description = Description;
        this.Price = Price;
        this.images = images;
        this.categories = categories;
    }

    public Categories getCategories() {
        return categories;
    }

    public void setCategories(Categories categories) {
        this.categories = categories;
    }
    
    

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Products{" + "ProductID=" + ProductID + ", Name=" + Name + ", Description=" + Description + ", Price=" + Price + ", CategoryID=" + CategoryID + ", images=" + images + '}';
    }

}
