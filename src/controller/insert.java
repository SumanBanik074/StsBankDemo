package controller;

import getdatabase.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insert
 */
@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=Data.getData();
			String acc_no=null;
			while(acc_no==null){
				acc_no="ACsts"+(int)(Math.random()*10000);
				String sql1="select acc_no from customer_tab where acc_no=?";
				PreparedStatement ps1= cn.prepareStatement(sql1);
				ps1.setString(1, acc_no);
				ResultSet rs1=ps1.executeQuery();
				if(rs1.next()){
					if(acc_no.equals(rs1.getString(1))){
						acc_no=null;
					}
				}
			}
			String cusnum=request.getParameter("cusnum");
			String psw=request.getParameter("psw");
			String pan_no=request.getParameter("pan_no");
			String adh_no=request.getParameter("adh_no");
			String acc_type=request.getParameter("acc_type");
			String addr=request.getParameter("addr");
			String phno=request.getParameter("phno");
			String amt=request.getParameter("amt");
			String sql="insert into customer_tab values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, acc_no);
			ps.setString(2, cusnum);
			ps.setString(3, psw);
			ps.setString(4, pan_no);
			ps.setString(5, adh_no);
			ps.setString(6, acc_type);
			ps.setString(7, addr);
			ps.setString(8, phno);
			ps.setString(9, amt);
			ps.execute();
			
			String val=amt;
			Date date=new Date();
			SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
			String date1=ft.format(date);
			String trans_num="INITIAL BALANCE";
			String dr_amt=" --- ";
			String deposit=amt;
			String sql2="insert into trans_tab values(?,?,?,?,?,?)";
			PreparedStatement ps2=cn.prepareStatement(sql2);
			ps2.setString(1, acc_no);
			ps2.setString(2, trans_num);
			ps2.setString(3, dr_amt);
			ps2.setString(4, deposit);
			ps2.setString(5, val);
			ps2.setString(6, date1);
			ps2.execute();
			
			request.setAttribute("acc_no", acc_no);
			request.setAttribute("myname", cusnum);
			request.getRequestDispatcher("ShowAcNo.jsp").forward(request, response);
			
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
