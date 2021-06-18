package com.myshop.connection;

public class Mobile {
    private int mobileId;
    private String mBrand;
    private int mRam;
    private int mRom;
    private String mCPU;
    private int mCamera;
    private float mDisplay;
    private int pId;

    public Mobile() {
    }

    public Mobile(int mobileId, String mBrand, int mRam, int mRom, String mCPU, int mCamera, float mDisplay, int pId) {
        this.mobileId = mobileId;
        this.mBrand = mBrand;
        this.mRam = mRam;
        this.mRom = mRom;
        this.mCPU = mCPU;
        this.mCamera = mCamera;
        this.mDisplay = mDisplay;
        this.pId = pId;
    }

    public Mobile(String mBrand, int mRam, int mRom, String mCPU, int mCamera, float mDisplay, int pId) {
        this.mBrand = mBrand;
        this.mRam = mRam;
        this.mRom = mRom;
        this.mCPU = mCPU;
        this.mCamera = mCamera;
        this.mDisplay = mDisplay;
        this.pId = pId;
    }

    public int getMobileId() {
        return mobileId;
    }

    public void setMobileId(int mobileId) {
        this.mobileId = mobileId;
    }

    public String getmBrand() {
        return mBrand;
    }

    public void setmBrand(String mBrand) {
        this.mBrand = mBrand;
    }

    public int getmRam() {
        return mRam;
    }

    public void setmRam(int mRam) {
        this.mRam = mRam;
    }

    public int getmRom() {
        return mRom;
    }

    public void setmRom(int mRom) {
        this.mRom = mRom;
    }

    public String getmCPU() {
        return mCPU;
    }

    public void setmCPU(String mCPU) {
        this.mCPU = mCPU;
    }

    public int getmCamera() {
        return mCamera;
    }

    public void setmCamera(int mCamera) {
        this.mCamera = mCamera;
    }

    public float getmDisplay() {
        return mDisplay;
    }

    public void setmDisplay(float mDisplay) {
        this.mDisplay = mDisplay;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    @Override
    public String toString() {
        return "Mobile{" + "mobileId=" + mobileId + ", mBrand=" + mBrand + ", mRam=" + mRam + ", mRom=" + mRom + ", mCPU=" + mCPU + ", mCamera=" + mCamera + ", mDisplay=" + mDisplay + ", pId=" + pId + '}';
    }
    
    
    
    
}
