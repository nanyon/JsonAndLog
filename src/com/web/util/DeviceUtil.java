package com.web.util;

import com.google.gson.Gson;
import com.web.domain.Device;

public class DeviceUtil {
	
	//返回解析后的对象
	public Device GetDevice(){
		JsonUtil js = new JsonUtil();
		System.out.println(js.getDatafromFile());
		Gson gson = new Gson();
		String json = js.getDatafromFile();
		Device device = new Device();	
		device = gson.fromJson(json, Device.class);		
		return device;
	}
}
