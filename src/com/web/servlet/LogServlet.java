package com.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.util.LogUtil;

/**
 * Servlet implementation class LogServlet
 */
@WebServlet("/LogServlet")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private LogUtil lu = new LogUtil();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");

		if (method == null || method.equals("")) {
			request.setAttribute("list", lu.getFileSort());
			request.setAttribute("json", lu.getLogJson());
			request.getRequestDispatcher("log2.jsp").forward(request, response);
		} else if (method.equals("getCode")) {
			String path = "E:\\test_log\\" + request.getParameter("pathName");
			try {
				String log = lu.getFileOfLog(path);
				if (!log.equals("")) {
					request.setAttribute("log", log);
				} else {
					request.setAttribute("error", "无内容");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "读取文件失败");
			}
			request.getRequestDispatcher("codePage.jsp").forward(request, response);
		} else if (method.equals("del")) {
			String fileName = request.getParameter("pathName");
			lu.deleteFileOfLogName(fileName);
		}
	}

}
