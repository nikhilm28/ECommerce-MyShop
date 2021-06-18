package com.myshop.connection;

public class Desktop {
    private int desktopId;
    private String desktopBrand;
    private String desktopCPU;
    private String desktopOS;
    private int desktopRAM;
    private int desktopROM;
    private int pId;

    public Desktop() {
    }

    public Desktop(int desktopId, String desktopBrand, String desktopCPU, String desktopOS, int desktopRAM, int desktopROM, int pId) {
        this.desktopId = desktopId;
        this.desktopBrand = desktopBrand;
        this.desktopCPU = desktopCPU;
        this.desktopOS = desktopOS;
        this.desktopRAM = desktopRAM;
        this.desktopROM = desktopROM;
        this.pId = pId;
    }

    public Desktop(String desktopBrand, String desktopCPU, String desktopOS, int desktopRAM, int desktopROM, int pId) {
        this.desktopBrand = desktopBrand;
        this.desktopCPU = desktopCPU;
        this.desktopOS = desktopOS;
        this.desktopRAM = desktopRAM;
        this.desktopROM = desktopROM;
        this.pId = pId;
    }

    public int getDesktopId() {
        return desktopId;
    }

    public void setDesktopId(int desktopId) {
        this.desktopId = desktopId;
    }

    public String getDesktopBrand() {
        return desktopBrand;
    }

    public void setDesktopBrand(String desktopBrand) {
        this.desktopBrand = desktopBrand;
    }

    public String getDesktopCPU() {
        return desktopCPU;
    }

    public void setDesktopCPU(String desktopCPU) {
        this.desktopCPU = desktopCPU;
    }

    public String getDesktopOS() {
        return desktopOS;
    }

    public void setDesktopOS(String desktopOS) {
        this.desktopOS = desktopOS;
    }

    public int getDesktopRAM() {
        return desktopRAM;
    }

    public void setDesktopRAM(int desktopRAM) {
        this.desktopRAM = desktopRAM;
    }

    public int getDesktopROM() {
        return desktopROM;
    }

    public void setDesktopROM(int desktopROM) {
        this.desktopROM = desktopROM;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    @Override
    public String toString() {
        return "Desktop{" + "desktopId=" + desktopId + ", desktopBrand=" + desktopBrand + ", desktopCPU=" + desktopCPU + ", desktopOS=" + desktopOS + ", desktopRAM=" + desktopRAM + ", desktopROM=" + desktopROM + ", pId=" + pId + '}';
    }
    
    
    
}
