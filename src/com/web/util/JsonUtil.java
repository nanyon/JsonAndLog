package com.web.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

import com.google.gson.Gson;
import com.web.domain.Device;
//这是处理json的
public class JsonUtil {
	private static String Path="D:\\eclipse-workspace\\WebServer\\WebContent\\data.json";
	/*读取json并输出字符串*/
	public String getDatafromFile() {	      
	    
	      BufferedReader reader = null;
	      String laststr = "";
	        try {
	          FileInputStream fileInputStream = new FileInputStream(Path);
	           InputStreamReader inputStreamReader = new InputStreamReader(fileInputStream, "UTF-8");
	            reader = new BufferedReader(inputStreamReader);
	           String tempString = null;
	         while ((tempString = reader.readLine()) != null) {
	              laststr += tempString;
	          }
	           reader.close();
	     } catch (IOException e) {
	         e.printStackTrace();
	        } finally {
	           if (reader != null) {
	               try {
	                 reader.close();
	             } catch (IOException e) {
	                 e.printStackTrace();
	                }
	           }
	       }
	       return laststr;
	   }
	

    /* 将对象写入缓存文件中*/
    public void writeFileDto(Device dev){
    	Gson gson = new Gson();
    	String jsonStr = gson.toJson(dev);
    	
        File file = new File(Path);
        System.out.println(jsonStr);
        if(!file.exists()){
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }          
        }
        try {          
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
            bw.write(jsonStr);
            bw.flush();
            bw.close();
        } catch (UnsupportedEncodingException | FileNotFoundException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }
}
