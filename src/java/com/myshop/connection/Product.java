package com.myshop.connection;

public class Product {
    private int pId;
    private String pName;
    private String pDescription;
    private String pImage;
    private int pPrice;
    private int pQty;
    private int pDiscount;
    private int catId;

    public Product() {
    }

    public Product(int pId, String pName, String pDescription, String pImage, int pPrice, int pQty, int pDiscount, int catId) {
        this.pId = pId;
        this.pName = pName;
        this.pDescription = pDescription;
        this.pImage = pImage;
        this.pPrice = pPrice;
        this.pQty = pQty;
        this.pDiscount = pDiscount;
        this.catId = catId;
    }

    public Product(String pName, String pDescription, String pImage, int pPrice, int pQty, int pDiscount, int catId) {
        this.pName = pName;
        this.pDescription = pDescription;
        this.pImage = pImage;
        this.pPrice = pPrice;
        this.pQty = pQty;
        this.pDiscount = pDiscount;
        this.catId = catId;
    }

    
    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpQty() {
        return pQty;
    }

    public void setpQty(int pQty) {
        this.pQty = pQty;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDescription=" + pDescription + ", pImage=" + pImage + ", pPrice=" + pPrice + ", pQty=" + pQty + ", pDiscount=" + pDiscount + '}';
    }
    
    public int getPriceAfterDiscount()
    {
        int dis = (int)((this.getpDiscount()/100.0) * this.getpPrice());
        return this.getpPrice()-dis;
    }
}
