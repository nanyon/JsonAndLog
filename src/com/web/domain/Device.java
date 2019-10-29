package com.web.domain;

public class Device implements java.io.Serializable{
	private String Name;
	private LAN LAN;
	private WAN WAN;
	public Device() {
		
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public LAN getLAN() {
		return LAN;
	}
	public void setLAN(LAN lAN) {
		LAN = lAN;
	}
	public WAN getWAN() {
		return WAN;
	}
	public void setWAN(WAN wAN) {
		WAN = wAN;
	}
	
	public Device(com.web.domain.LAN lAN, com.web.domain.WAN wAN) {
		LAN = lAN;
		WAN = wAN;
	}
	
	public Device(String name, com.web.domain.LAN lAN, com.web.domain.WAN wAN) {
		Name = name;
		LAN = lAN;
		WAN = wAN;
	}
	
	
	
	
}
