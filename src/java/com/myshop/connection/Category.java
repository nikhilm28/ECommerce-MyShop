package com.myshop.connection;

public class Category {
    private int catId;
    private String categoryName;
    private String categoryDesp;

    public Category() {
    }
    
    
    public Category(int catId, String categoryName, String categoryDesp) {
        this.catId = catId;
        this.categoryName = categoryName;
        this.categoryDesp = categoryDesp;
    }

    public Category(String categoryName, String categoryDesp) {
        this.categoryName = categoryName;
        this.categoryDesp = categoryDesp;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDesp() {
        return categoryDesp;
    }

    public void setCategoryDesp(String categoryDesp) {
        this.categoryDesp = categoryDesp;
    }

    @Override
    public String toString() {
        return "Category{" + "catId=" + catId + ", categoryName=" + categoryName + ", categoryDesp=" + categoryDesp + '}';
    }

    
    
    
    
}
