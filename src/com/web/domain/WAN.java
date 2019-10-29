package com.web.domain;

import java.io.Serializable;

public class WAN  implements Serializable{
	private String MAC;
	private String IP;
	private String subnetMask;
	
	public WAN(){
		
	}

	public String getMAC() {
		return MAC;
	}

	public void setMAC(String mAC) {
		MAC = mAC;
	}

	public String getIP() {
		return IP;
	}

	public void setIP(String iP) {
		IP = iP;
	}

	public String getSubnetMask() {
		return subnetMask;
	}

	public void setSubnetMask(String subnetMask) {
		this.subnetMask = subnetMask;
	}

	public WAN(String mAC, String iP, String subnetMask) {
		MAC = mAC;
		IP = iP;
		this.subnetMask = subnetMask;
	}

	
	
	
}
