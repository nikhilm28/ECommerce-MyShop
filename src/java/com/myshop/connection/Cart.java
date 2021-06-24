package com.myshop.connection;

public class Cart {
    private String userPhone;
    private int productId;
    private int productQuantity;
    private int productPrice;
    private int productTotal;
    private String productName;
     

    public Cart() {
    }

    public Cart(String userPhone, int productId, int productQuantity, int productPrice, int productTotal, String productName) {
        this.userPhone = userPhone;
        this.productId = productId;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.productTotal = productTotal;
        this.productName = productName;
    }

    

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
    
    
    public int getProductTotal() {
        return productTotal;
    }

    public void setProductTotal(int productTotal) {
        this.productTotal = productTotal;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    
    
    @Override
    public String toString() {
        return "Cart{" + "userPhone=" + userPhone + ", productId=" + productId + ", productQuantity=" + productQuantity + ", productPrice=" + productPrice + ", productTotal=" + productTotal + '}';
    }

    
    
    
}
