package com.web.test;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import com.web.domain.Device;
import com.web.domain.LAN;
import com.web.util.DeviceUtil;
import com.web.util.JsonUtil;


public class Test {
	
	
	
	public static void main(String[] args) {
		 String path = "E:\\test_log";
		 int i = 1;
	        List<File> list = getFileSort(path);
	 
	        for (File file : list) {
	            System.out.println(file.getName() + " : " + file.lastModified() + "=============================" + i++);
	        }
	}
	

	//获取目录下所有文件(按时间排序)	
	public static List<File> getFileSort(String path) {		 
        List<File> list = getFiles(path, new ArrayList<File>());
        if (list != null && list.size() > 0) {
            Collections.sort(list, new Comparator<File>() {
                public int compare(File file, File newFile) {
                    if (file.lastModified() < newFile.lastModified()) {
                        return 1;
                    } else if (file.lastModified() == newFile.lastModified()) {
                        return 0;
                    } else {
                        return -1;
                    }
                }
            });
        }
        return list;
    }

	
	
	
	//获取目录下所有文件
	public static List<File> getFiles(String realpath, List<File> files) {	 
        File realFile = new File(realpath);
        if (realFile.isDirectory()) {
            File[] subfiles = realFile.listFiles();
            for (File file : subfiles) {
                if (file.isDirectory()) {
                    getFiles(file.getAbsolutePath(), files);
                } else {
                	if (file.getName().toLowerCase().endsWith(".log")) {
                		files.add(file);
        			}
                }
            }
        }
        return files;
    }
	
	public String time() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());// new Date()为获取当前系统时间		
	}
	
	public static void test1() {
		JsonUtil js = new JsonUtil();
		System.out.println(js.getDatafromFile());
		Gson gson = new Gson();

		String json = js.getDatafromFile();

		Device device = new Device();
	
		device = gson.fromJson(json, Device.class);
		//输出
		System.out.println("IP:" + device.getLAN().getName());
		System.out.println("MAC:" +device.getLAN().getPassword());
		System.out.println("Subnet_mask:" + device.getLAN().getMeid());
	}
	

	public static void test2() {
		JsonUtil js = new JsonUtil();
		DeviceUtil Dd=new DeviceUtil();
		Device de = Dd.GetDevice();
		LAN la = Dd.GetDevice().getLAN();
		de.setName("wwwwwwww");
		//la.setMEID("192.168.1.1");
		//de.setLAN(la);
		
		js.writeFileDto(de);
	
	}
	
	public static void test3() {
		String filepath = "D:\\iTunes";//D盘下的file文件夹的目录
		File file = new File(filepath);//File类型可以是文件也可以是文件夹
		 File[] fileList = file.listFiles();//将该目录下的所有文件放置在一个File类型的数组中
		 List<File> wjList = new ArrayList<File>();//新建一个文件集合
		 try {
			 for (int i = 0; i < fileList.length; i++) {
				    if (fileList[i].isFile()) {//判断是否为文件
				    	
				         wjList.add(fileList[i]);
				      
				        // System.out.println(fileList[i]+ " ");				       
				    }				    
				 }
		 }catch(Exception ex){
			 System.out.println("文件不存在");
		 }
		 
	}
	
	
	public static void test4() {
		File f = new File("D:\\iTunes");
		File[] file =f.listFiles();
		List<File> Lf = new ArrayList<File>();
		for (File t:file) {
			if (t.getName().toLowerCase().endsWith(".dll")) {
				Lf.add(t);
				
			//System.out.println(t.lastModified());
				// Date date = new Date();
			    // date.setTime(t.lastModified());
			    // System.out.println(new SimpleDateFormat().format(date));
			}		
		}
		System.out.println(Lf.get(1).getName());
	}
}
