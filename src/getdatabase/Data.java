package getdatabase;
import java.sql.*;
public class Data {
	static Connection cn=null;
	static String driver="com.ibm.db2.jcc.DB2Driver";
	static String url="jdbc:db2://localhost:50000/STSBANK";
	static String user="HOME PC";
	static String pass="Sumon074";
	public static Connection getData(){
		try{
			Class.forName(driver);
			cn=DriverManager.getConnection(url,user,pass);
		}catch(Exception e){
			System.out.println(e);
		}
		return cn; 
	}
}
