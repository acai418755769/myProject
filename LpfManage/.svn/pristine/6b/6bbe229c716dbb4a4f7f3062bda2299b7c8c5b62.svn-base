package org.servlet;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.model.Task;



public class DB {
	Connection ct;
	PreparedStatement pstmt;
	// �ڹ��캯���н�������ݿ�����ӣ������ڽ���DB����ʱ����������ݿ�
	public DB(){
		try {
			/*
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				ct=DriverManager.getConnection
				("jdbc:sqlserver://localhost:1433;databaseName=javaee","sa","123456");
			*/
			Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/test","root","root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// ���username��password��ѯ�û����鵽�ͷ��ظö���û�оͷ���null
	
	
	// ���userId�õ��û�����
	
	public ArrayList<Task> findAllExcel(){
		try{
			ArrayList al=new ArrayList();
			pstmt=ct.prepareStatement("select * from Task");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Task t=new Task();
				t.setId(rs.getInt("Id"));
				t.setBname(rs.getString("Bname"));
				
				t.setH_name(rs.getString("H_name"));
				t.setH_date(rs.getString("H_date"));
				t.setH_tel(rs.getString("H_tel"));
				t.setH_descript(rs.getString("H_descript"));
				t.setState(rs.getInt("State"));
				t.setSenddate(rs.getString("Senddate"));
				t.setW_name(rs.getString("W_name"));
				t.setW_date(rs.getString("W_date"));
				t.setW_tel(rs.getString("W_tel"));
				t.setW_descript(rs.getString("W_descript"));
				
				al.add(t);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<String> findBridge(){
		try{
			ArrayList al=new ArrayList();
			pstmt=ct.prepareStatement("select bname from bridge  GROUP BY bname");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				String s=rs.getString("bname");
				al.add(s);
				
				
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	public ArrayList<Integer> findRtimes(String value){
		try{
		ArrayList al=new ArrayList();
		pstmt=ct.prepareStatement("select rtimes from bridge where bname=?");
		pstmt.setString(1, value);
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()){
			int s=rs.getInt("rtimes");
			
			al.add(s);
		}
		return al;
	}catch(Exception e){
		e.printStackTrace();
		return null;
	 }
   }
	public ArrayList<Integer> findCtimes(String value){
		try{
		ArrayList al=new ArrayList();
		pstmt=ct.prepareStatement("select ctimes from bridge where bname=?");
		pstmt.setString(1, value);
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()){
			int s=rs.getInt("ctimes");
			
			al.add(s);
		}
		return al;
	}catch(Exception e){
		e.printStackTrace();
		return null;
	 }
   }
	public ArrayList<Integer> findMtimes(String value){
		try{
		ArrayList al=new ArrayList();
		pstmt=ct.prepareStatement("select mtimes from bridge where bname=?");
		pstmt.setString(1, value);
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()){
			int s=rs.getInt("mtimes");
			
			al.add(s);
		}
		return al;
	}catch(Exception e){
		e.printStackTrace();
		return null;
	 }
   }
}