package controller;

import getdatabase.*;
import java.sql.*;
import java.util.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class customer_login
 */
@WebServlet("/customer_login")
public class customer_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=Data.getData();
			String cusnum=request.getParameter("cusnum");
			String acc_no=request.getParameter("acc_no");
			String psw=request.getParameter("psw");
			String sql="select * from customer_tab where cusnum=? and acc_no=? and psw=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, cusnum);
			ps.setString(2, acc_no);
			ps.setString(3, psw);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				HttpSession ses=request.getSession();
				ses.setAttribute("acc_no", rs.getString(1));
				ses.setAttribute("cusnum", rs.getString(2));
				response.sendRedirect("userAcc.jsp");
			}else{
				response.sendRedirect("homepage.jsp");
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
