package controller;

import getdatabase.*;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class fundTransfer
 */
@WebServlet("/fundTransfer")
public class fundTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=Data.getData();
			String acc_no=request.getParameter("acc_no");
			String cusnum=request.getParameter("cusnum");
			String psw=request.getParameter("psw");
			String date=request.getParameter("date");
			String sql="select * from customer_tab where acc_no=? and cusnum=? and psw=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, acc_no);
			ps.setString(2, cusnum);
			ps.setString(3, psw);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				int myval=Integer.parseInt(rs.getString(9));
				String dacc_no=request.getParameter("dacc_no");
				String accl_name=request.getParameter("accl_name");
				String sql1="select * from customer_tab where acc_no=? and cusnum=?";
				PreparedStatement ps1=cn.prepareStatement(sql1);
				ps1.setString(1, dacc_no);
				ps1.setString(2, accl_name);
				ResultSet rs1=ps1.executeQuery();
				if(rs1.next()){
					int des=Integer.parseInt(rs1.getString(9));
					int amt1=Integer.parseInt(request.getParameter("amt"));
					if(myval>amt1){
						int wid=myval-amt1;
						String amt2=String.valueOf(wid);
						String sql2="update customer_tab set amt=? where acc_no=? and cusnum=?";
						PreparedStatement ps2=cn.prepareStatement(sql2);
						ps2.setString(1, amt2);
						ps2.setString(2, acc_no);
						ps2.setString(3, cusnum);
						ps2.execute();
						
						String val=amt2;
						String trans_num="TO "+dacc_no;
						String cr_amt=" --- ";
						String dr_amt=String.valueOf(amt1);
						String sql4="insert into trans_tab values(?,?,?,?,?,?)";
						PreparedStatement ps4=cn.prepareStatement(sql4);
						ps4.setString(1, acc_no);
						ps4.setString(2, trans_num);
						ps4.setString(3, dr_amt);
						ps4.setString(4, cr_amt);
						ps4.setString(5, val);
						ps4.setString(6, date);
						ps4.execute();
						
						int dep=des+amt1;
						String amt3=String.valueOf(dep);
						String sql3="update customer_tab set amt=? where acc_no=? and cusnum=?";
						PreparedStatement ps3=cn.prepareStatement(sql3);
						ps3.setString(1, amt3);
						ps3.setString(2, dacc_no);
						ps3.setString(3, accl_name);
						ps3.execute();
						
						String val1=amt3;
						String trans_num1="BY "+acc_no;
						String cr_amt1=String.valueOf(amt1);
						String dr_amt1=" --- ";
						String sql5="insert into trans_tab values(?,?,?,?,?,?)";
						PreparedStatement ps5=cn.prepareStatement(sql5);
						ps5.setString(1, dacc_no);
						ps5.setString(2, trans_num1);
						ps5.setString(3, dr_amt1);
						ps5.setString(4, cr_amt1);
						ps5.setString(5, val1);
						ps5.setString(6, date);
						ps5.execute();
						
						response.sendRedirect("Transfer.jsp");
					}else{
						response.sendRedirect("invalidDetail.html");
					}
				}else{
					response.sendRedirect("invalidDetail.html");
				}
			}else{
				response.sendRedirect("invalidDetail.html");
			}
			
		}catch(Exception e){
			System.out.print(e);
		}
	}
}
