package com.myshop.connection;

public class Laptop {
    private int laptopId;
    private String lBrand;
    private int lRam;
    private int lRom;
    private String lCPU;
    private String lCPUType;
    private String lGraphics;
    private float lDisplay;
    private String lCPUSpeed;
    private float lWeight;
    private int pId;

    public Laptop() {
    }

    public Laptop(int laptopId, String lBrand, int lRam, int lRom, String lCPU, String lCPUType, String lGraphics, float lDisplay, String lCPUSpeed, float lWeight, int pId) {
        this.laptopId = laptopId;
        this.lBrand = lBrand;
        this.lRam = lRam;
        this.lRom = lRom;
        this.lCPU = lCPU;
        this.lCPUType = lCPUType;
        this.lGraphics = lGraphics;
        this.lDisplay = lDisplay;
        this.lCPUSpeed = lCPUSpeed;
        this.lWeight = lWeight;
        this.pId = pId;
    }

    public Laptop(String lBrand, int lRam, int lRom, String lCPU, String lCPUType, String lGraphics, float lDisplay, String lCPUSpeed, float lWeight, int pId) {
        this.lBrand = lBrand;
        this.lRam = lRam;
        this.lRom = lRom;
        this.lCPU = lCPU;
        this.lCPUType = lCPUType;
        this.lGraphics = lGraphics;
        this.lDisplay = lDisplay;
        this.lCPUSpeed = lCPUSpeed;
        this.lWeight = lWeight;
        this.pId = pId;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(int laptopId) {
        this.laptopId = laptopId;
    }

    public String getlBrand() {
        return lBrand;
    }

    public void setlBrand(String lBrand) {
        this.lBrand = lBrand;
    }

    public int getlRam() {
        return lRam;
    }

    public void setlRam(int lRam) {
        this.lRam = lRam;
    }

    public int getlRom() {
        return lRom;
    }

    public void setlRom(int lRom) {
        this.lRom = lRom;
    }

    public String getlCPU() {
        return lCPU;
    }

    public void setlCPU(String lCPU) {
        this.lCPU = lCPU;
    }

    public String getlCPUType() {
        return lCPUType;
    }

    public void setlCPUType(String lCPUType) {
        this.lCPUType = lCPUType;
    }

    public String getlGraphics() {
        return lGraphics;
    }

    public void setlGraphics(String lGraphics) {
        this.lGraphics = lGraphics;
    }

    
    
    public float getlDisplay() {
        return lDisplay;
    }

    public void setlDisplay(float lDisplay) {
        this.lDisplay = lDisplay;
    }

    public String getlCPUSpeed() {
        return lCPUSpeed;
    }

    public void setlCPUSpeed(String lCPUSpeed) {
        this.lCPUSpeed = lCPUSpeed;
    }

    public float getlWeight() {
        return lWeight;
    }

    public void setlWeight(float lWeight) {
        this.lWeight = lWeight;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    @Override
    public String toString() {
        return "Laptop{" + "laptopId=" + laptopId + ", lBrand=" + lBrand + ", lRam=" + lRam + ", lRom=" + lRom + ", lCPU=" + lCPU + ", lCPUType=" + lCPUType + ", lGraphics=" + lGraphics + ", lDisplay=" + lDisplay + ", lCPUSpeed=" + lCPUSpeed + ", lWeight=" + lWeight + ", pId=" + pId + '}';
    }

      
    
    
}
