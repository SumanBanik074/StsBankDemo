package controller;

import getdatabase.*;
import java.util.*;
import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class admin_login
 */
@WebServlet("/admin_login")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=Data.getData();
			String adm_num=request.getParameter("adm_num");
			String adpsw=request.getParameter("adpsw");
			String sql="select * from admin_tab where adm_num=? and adpsw=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, adm_num);
			ps.setString(2, adpsw);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				HttpSession ses=request.getSession();
				ses.setAttribute("adm_num", rs.getString(1));
				response.sendRedirect("homeAdmin.jsp");
			}else{
				response.sendRedirect("homepage.jsp");
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
