package com.myshop.connection;

public class MenShirt {
    private int menshirtId;
    private String menshirtBrand;
    private int menshirtSize;
    private String menshirtColor;
    private String menshirtCollar;
    private String menshirtSleeve;
    private String menshirtMaterial;
    private int pId;

    public MenShirt() {
    }

    public MenShirt(int menshirtId, String menshirtBrand, int menshirtSize, String menshirtColor, String menshirtCollar, String menshirtSleeve, String menshirtMaterial, int pId) {
        this.menshirtId = menshirtId;
        this.menshirtBrand = menshirtBrand;
        this.menshirtSize = menshirtSize;
        this.menshirtColor = menshirtColor;
        this.menshirtCollar = menshirtCollar;
        this.menshirtSleeve = menshirtSleeve;
        this.menshirtMaterial = menshirtMaterial;
        this.pId = pId;
    }

    public MenShirt(String menshirtBrand, int menshirtSize, String menshirtColor, String menshirtCollar, String menshirtSleeve, String menshirtMaterial, int pId) {
        this.menshirtBrand = menshirtBrand;
        this.menshirtSize = menshirtSize;
        this.menshirtColor = menshirtColor;
        this.menshirtCollar = menshirtCollar;
        this.menshirtSleeve = menshirtSleeve;
        this.menshirtMaterial = menshirtMaterial;
        this.pId = pId;
    }

    public int getMenshirtId() {
        return menshirtId;
    }

    public void setMenshirtId(int menshirtId) {
        this.menshirtId = menshirtId;
    }

    public String getMenshirtBrand() {
        return menshirtBrand;
    }

    public void setMenshirtBrand(String menshirtBrand) {
        this.menshirtBrand = menshirtBrand;
    }

    public int getMenshirtSize() {
        return menshirtSize;
    }

    public void setMenshirtSize(int menshirtSize) {
        this.menshirtSize = menshirtSize;
    }

    public String getMenshirtColor() {
        return menshirtColor;
    }

    public void setMenshirtColor(String menshirtColor) {
        this.menshirtColor = menshirtColor;
    }

    public String getMenshirtCollar() {
        return menshirtCollar;
    }

    public void setMenshirtCollar(String menshirtCollar) {
        this.menshirtCollar = menshirtCollar;
    }

    public String getMenshirtSleeve() {
        return menshirtSleeve;
    }

    public void setMenshirtSleeve(String menshirtSleeve) {
        this.menshirtSleeve = menshirtSleeve;
    }

    public String getMenshirtMaterial() {
        return menshirtMaterial;
    }

    public void setMenshirtMaterial(String menshirtMaterial) {
        this.menshirtMaterial = menshirtMaterial;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    @Override
    public String toString() {
        return "MenShirt{" + "menshirtId=" + menshirtId + ", menshirtBrand=" + menshirtBrand + ", menshirtSize=" + menshirtSize + ", menshirtColor=" + menshirtColor + ", menshirtCollar=" + menshirtCollar + ", menshirtSleeve=" + menshirtSleeve + ", menshirtMaterial=" + menshirtMaterial + ", pId=" + pId + '}';
    }
    
    
    
}
