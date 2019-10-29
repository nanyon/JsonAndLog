package com.web.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class LogUtil {
	// 读取log文件绝对路径
	private static String path = "E:\\test_log";

	// 获取log文件名集合
//	public static List<File> getLogFilePath1() {
//		File f = new File(path);
//		File[] file = f.listFiles();
//		List<File> lf = new ArrayList<File>();
//		for (File t : file) {
//			if (t.getName().toLowerCase().endsWith(".log")) {
//				lf.add(t);
//			}
//		}
//		return lf;
//	}

	// 获取目录下所有文件(按时间排序)
	public List<File> getFileSort() {
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

	// 获取目录下所有文件
	public static List<File> getFiles(String realpath, List<File> files) {
		File realFile = new File(realpath);
		if (realFile.isDirectory()) {
			File[] subfiles = realFile.listFiles();
			for (File file : subfiles) {
//				if (file.isDirectory()) {
//					getFiles(file.getAbsolutePath(), files);
//				} else {
					if (file.getName().toLowerCase().endsWith(".log")) {
						files.add(file);
					}
//				}
			}
		}
		return files;
	}

	// 将log目录列表以json格式输出
	public String getLogJson() {
		List<File> lf = getFileSort();
		JsonArray array = new JsonArray();
		JsonObject obj;
		Date date = new Date();
		int y = 1;
		for (int i = 0; i < lf.size(); i++) {
			obj = new JsonObject();
			date.setTime(lf.get(i).lastModified());
			obj.addProperty("id", y++);
			obj.addProperty("name", lf.get(i).getName());
			obj.addProperty("path", lf.get(i).getPath());
			if (lf.get(i).length() <= 1024 && lf.get(i).length() > 0) {
				obj.addProperty("length", "1 KB");
			} else if (lf.get(i).length() <= 0) {
				obj.addProperty("length", "0 KB");
			} else {
				obj.addProperty("length", lf.get(i).length() / 1024 + 1 + " KB");
			}
			obj.addProperty("lastModified", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date));
			array.add(obj);
		}
		return array.toString();
	}

	// 将本地log文件内容转为字符串输出
	public String getFileOfLog(String path) throws Exception {
		File file = new File(path);// 定义一个file对象，用来初始化FileReader
		System.out.println("获取的path路径是 ：" + path);
		FileReader reader = new FileReader(file);// 定义一个fileReader对象，用来初始化BufferedReader
		BufferedReader bReader = new BufferedReader(reader);// new一个BufferedReader对象，将文件内容读取到缓存
		StringBuilder sb = new StringBuilder();// 定义一个字符串缓存，将字符串存放缓存中
		String s = "";
		int i = 1;
		while ((s = bReader.readLine()) != null) {// 逐行读取文件内容，不读取换行符和末尾的空格
			sb.append(s + "\n");// 将读取的字符串添加换行符后累加存放在缓存中
			System.out.println(s + "----" + i++);
		}
		bReader.close();
		String str = sb.toString();
		return str;
	}

	// 传入一个文件名删除log
	public boolean deleteFileOfLogName(String fileName) {
		File file = new File(path + "/" + fileName);// 根据指定的文件名创建File对象
		if (file.exists() && file.isFile()) { // 要删除的文件存在且是文件
			if (file.delete()) {
				System.out.println("文件" + fileName + "删除成功！");
				return true;
			} else {
				System.out.println("文件" + fileName + "删除失败！");
				return false;
			}
		} else {
			System.out.println("文件" + fileName + "不存在，删除失败！");
			return false;
		}
	}

}
