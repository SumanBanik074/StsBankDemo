package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import getdatabase.Data;

/**
 * Servlet implementation class teleBill
 */
@WebServlet("/teleBill")
public class teleBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=Data.getData();
			String acc_no=request.getParameter("acc_no");
			String cusnum=request.getParameter("cusnum");
			String tbill=request.getParameter("tbill");
			String phno=request.getParameter("phno");
			String date=request.getParameter("date");
			String sql="select * from customer_tab where acc_no=? and cusnum=? and phno=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, acc_no);
			ps.setString(2, cusnum);
			ps.setString(3, phno);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				int amt1=Integer.parseInt(request.getParameter("amt"));
				int myval=Integer.parseInt(rs.getString(9));
				if(myval>amt1){
					int dep=myval-amt1;
					String amt=String.valueOf(dep);
					String sql1="update customer_tab set amt=? where acc_no=? and cusnum=? and phno=?";
					PreparedStatement ps1=cn.prepareStatement(sql1);
					ps1.setString(1, amt);
					ps1.setString(2, acc_no);
					ps1.setString(3, cusnum);
					ps1.setString(4, phno);
					ps1.execute();
					
					String val=amt;
					String trans_num="TO "+tbill;
					String cr_amt=" --- ";
					String dr_amt=String.valueOf(amt1);
					String sql2="insert into trans_tab values(?,?,?,?,?,?)";
					PreparedStatement ps2=cn.prepareStatement(sql2);
					ps2.setString(1, acc_no);
					ps2.setString(2, trans_num);
					ps2.setString(3, dr_amt);
					ps2.setString(4, cr_amt);
					ps2.setString(5, val);
					ps2.setString(6, date);
					ps2.execute();
					
					response.sendRedirect("telephone_bill.jsp");
				}else{
					response.sendRedirect("default_teltransac.html");
				}
			}else{
				response.sendRedirect("default_teltransac.html");
			}
		}catch(Exception e){
			System.out.print(e);
		}
	}

}
