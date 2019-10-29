package com.web.domain;

import java.io.Serializable;

public class LAN  implements Serializable{
	private String name;
	private String password;
	private String meid;
	
	public LAN() {
	
	}

	
	
	
	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getMeid() {
		return meid;
	}




	public void setMeid(String meid) {
		this.meid = meid;
	}




	public LAN(String name, String password, String meid) {
		this.name = name;
		this.password = password;
		this.meid = meid;
	}

	
}