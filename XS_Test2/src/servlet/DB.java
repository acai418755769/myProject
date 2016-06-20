package servlet;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.model.Xsb;



public class DB {
	Connection ct;
	PreparedStatement pstmt;
	// 在构造函数中建立与数据库的连接，这样在建立DB对象时就连接了数据库
	public DB(){
		try {
			/*
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				ct=DriverManager.getConnection
				("jdbc:sqlserver://localhost:1433;databaseName=javaee","sa","123456");
			*/
			Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/xscj","root","root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 根据username和password查询用户，查到就返回该对象，没有就返回null
	
	
	// 根据userId得到用户姓名
	
	public ArrayList<Xsb> findAllExcel(){
		try{
			ArrayList al=new ArrayList();
			pstmt=ct.prepareStatement("select * from Xsb");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Xsb xs=new Xsb();
				xs.setId(rs.getInt("Id"));
				xs.setXh(rs.getString("Xh"));
				xs.setCssj(rs.getString("Cssj"));
				xs.setXm(rs.getString("Xm"));
				xs.setXb(rs.getString("Xb"));
				xs.setZxf(rs.getInt("Zxf"));
				xs.setBz(rs.getString("Bz"));
				xs.setZy_id(rs.getInt("zy_id"));
				
				al.add(xs);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<Integer> findByzy(){
		try{
			ArrayList al=new ArrayList();
			pstmt=ct.prepareStatement("select zy_id from Xsb  GROUP BY zy_id");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				int s=rs.getInt("zy_id");
				al.add(s);
				
				
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	public ArrayList<String> findByzy1(int value){
		try{
		ArrayList al=new ArrayList();
		pstmt=ct.prepareStatement("select * from Xsb where zy_id=?");
		pstmt.setInt(1, value);
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()){
			String s=rs.toString();
			
			al.add(s);
		}
		return al;
	}catch(Exception e){
		e.printStackTrace();
		return null;
	 }
   }
	public String findByzym(int value){
		try{
			ArrayList al=new ArrayList();
			pstmt=ct.prepareStatement("select zym from Zyb where id=?");
			pstmt.setInt(1, value);
			ResultSet rs=pstmt.executeQuery();
			String s="";
			if(rs.next())
			 s=URLEncoder.encode(rs.getString("zym"),"utf-8");
		
		return s;
		}catch (Exception e) {
			
			e.printStackTrace();
			return null;// TODO: handle exception
		}
	}
	public ArrayList<String> findXb(){
		try{
			
			ArrayList al=new ArrayList();
			pstmt=ct.prepareStatement("select xb from Xsb  GROUP BY xb");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				String s=rs.getString("xb");
				al.add(s);
				
			}
			return al;
		}catch (Exception e) {
			e.printStackTrace();
			return null;// TODO: handle exception
		}
	}
	public ArrayList<String> findXb1(String value){
		try{
			ArrayList al=new ArrayList();
			pstmt=ct.prepareStatement("select * from Xsb where xb=?");
			pstmt.setString(1, value);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				String s=rs.getString("xb");
				al.add(s);
			}
			return al;
		}catch (Exception e) {
			e.printStackTrace();
			return null;// TODO: handle exception
		}
		
	}
}