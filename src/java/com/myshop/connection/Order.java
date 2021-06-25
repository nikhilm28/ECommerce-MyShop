package com.myshop.connection;

public class Order {
    private int orderId;
    private String userPhone;
    private int product_id;
    private String productName;
    private int productQuantity;
    private int orderAmount;
    private String orderDate;

    public Order() {
    }

    public Order(int orderId, String userPhone, int product_id, String productName, int productQuantity, int orderAmount, String orderDate) {
        this.orderId = orderId;
        this.userPhone = userPhone;
        this.product_id = product_id;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.orderAmount = orderAmount;
        this.orderDate = orderDate;
    }

    public Order(String userPhone, int product_id, String productName, int productQuantity, int orderAmount, String orderDate) {
        this.userPhone = userPhone;
        this.product_id = product_id;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.orderAmount = orderAmount;
        this.orderDate = orderDate;
    }

    

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    
    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(int orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userPhone=" + userPhone + ", product_id=" + product_id + ", productName=" + productName + ", productQuantity=" + productQuantity + ", orderAmount=" + orderAmount + ", orderDate=" + orderDate + '}';
    }

         
       
  
}
