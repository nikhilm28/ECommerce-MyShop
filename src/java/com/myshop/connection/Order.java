package com.myshop.connection;

public class Order {
    private int orderId;
    private int userId;
    private int product_id;
    private int orderDate;
    private String productName;
    private int orderDiscount;
    private int orderAmount;
    private String shippingAddress;
    private String billingAddress;

    public Order() {
    }

    public Order(int orderId, int userId, int product_id, int orderDate, String productName, int orderDiscount, int orderAmount, String shippingAddress, String billingAddress) {
        this.orderId = orderId;
        this.userId = userId;
        this.product_id = product_id;
        this.orderDate = orderDate;
        this.productName = productName;
        this.orderDiscount = orderDiscount;
        this.orderAmount = orderAmount;
        this.shippingAddress = shippingAddress;
        this.billingAddress = billingAddress;
    }

    public Order(int userId, int product_id, int orderDate, String productName, int orderDiscount, int orderAmount, String shippingAddress, String billingAddress) {
        this.userId = userId;
        this.product_id = product_id;
        this.orderDate = orderDate;
        this.productName = productName;
        this.orderDiscount = orderDiscount;
        this.orderAmount = orderAmount;
        this.shippingAddress = shippingAddress;
        this.billingAddress = billingAddress;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(int orderDate) {
        this.orderDate = orderDate;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getOrderDiscount() {
        return orderDiscount;
    }

    public void setOrderDiscount(int orderDiscount) {
        this.orderDiscount = orderDiscount;
    }

    public int getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(int orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId + ", product_id=" + product_id + ", orderDate=" + orderDate + ", productName=" + productName + ", orderDiscount=" + orderDiscount + ", orderAmount=" + orderAmount + ", shippingAddress=" + shippingAddress + ", billingAddress=" + billingAddress + '}';
    }
    
    
   
    
}
