package models;

/**
 *
 * @author ThuyVy
 */
public class Categories {
    private String CategoryId , Name;

    public Categories() {
    }

    public Categories(String CategoryId, String Name) {
        this.CategoryId = CategoryId;
        this.Name = Name;
    }

    public String getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(String CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    @Override
    public String toString() {
        return "Categories{" + "CategoryId=" + CategoryId + ", Name=" + Name + '}';
    }
    
    
}
