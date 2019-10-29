package com.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.domain.Device;
import com.web.domain.LAN;
import com.web.util.DeviceUtil;
import com.web.util.JsonUtil;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DeviceUtil Dd=new DeviceUtil();
	private JsonUtil ju = new JsonUtil();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		//request.setCharacterEncoding("utf-8"); 
		String method= request.getParameter("method");

		if(method == null || method.equals("")) {
			
			request.setAttribute("dev", Dd.GetDevice());	
			request.getRequestDispatcher("main.jsp").forward(request, response);
			
		}else if(method.equals("setDevice")) {		
			String Lan_Name = request.getParameter("Lan_Name");
			String Lan_Password = request.getParameter("Lan_Password");
			String Lan_Meid = request.getParameter("Lan_Meid");
			
			LAN lan = new LAN(Lan_Name,Lan_Password,Lan_Meid);
			Device device = new Device();
			device.setLAN(lan);
			
			ju.writeFileDto(device);
		}
	}
}
