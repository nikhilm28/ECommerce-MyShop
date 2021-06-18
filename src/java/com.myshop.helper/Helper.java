package com.myshop;

public class Helper {
    public static String get10Words(String desc)
    {
        String[] strs = desc.split(" ");
        if(strs.length > 10)
        {
            String res="";
            for(int i=0; i<8; i++)
            {
               res = res+strs[i]+" "; 
            }
            return (res+"...");
        }
        else
        {
            return (desc+"...");
        }
    }
    
}
