package com.myshop.connection;

public class MenJeans {
    private int menjeansId;
    private String menjeansBrand;
    private int menjeansSize;
    private int menjeansLength;
    private String menjeansColor;
    private int pId;

    public MenJeans() {
    }

    public MenJeans(int menjeansId, String menjeansBrand, int menjeansSize, int menjeansLength, String menjeansColor, int pId) {
        this.menjeansId = menjeansId;
        this.menjeansBrand = menjeansBrand;
        this.menjeansSize = menjeansSize;
        this.menjeansLength = menjeansLength;
        this.menjeansColor = menjeansColor;
        this.pId = pId;
    }

    public MenJeans(String menjeansBrand, int menjeansSize, int menjeansLength, String menjeansColor, int pId) {
        this.menjeansBrand = menjeansBrand;
        this.menjeansSize = menjeansSize;
        this.menjeansLength = menjeansLength;
        this.menjeansColor = menjeansColor;
        this.pId = pId;
    }

    public int getMenjeansId() {
        return menjeansId;
    }

    public void setMenjeansId(int menjeansId) {
        this.menjeansId = menjeansId;
    }

    public String getMenjeansBrand() {
        return menjeansBrand;
    }

    public void setMenjeansBrand(String menjeansBrand) {
        this.menjeansBrand = menjeansBrand;
    }

    public int getMenjeansSize() {
        return menjeansSize;
    }

    public void setMenjeansSize(int menjeansSize) {
        this.menjeansSize = menjeansSize;
    }

    public int getMenjeansLength() {
        return menjeansLength;
    }

    public void setMenjeansLength(int menjeansLength) {
        this.menjeansLength = menjeansLength;
    }

    public String getMenjeansColor() {
        return menjeansColor;
    }

    public void setMenjeansColor(String menjeansColor) {
        this.menjeansColor = menjeansColor;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    @Override
    public String toString() {
        return "MenJeans{" + "menjeansId=" + menjeansId + ", menjeansBrand=" + menjeansBrand + ", menjeansSize=" + menjeansSize + ", menjeansLength=" + menjeansLength + ", menjeansColor=" + menjeansColor + ", pId=" + pId + '}';
    }
    
    
    
}
