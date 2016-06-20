package Test;

import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


public class TestDB {
	//mysql
	public static String driver = "com.mysql.jdbc.Driver";
	public static String url = "jdbc:mysql://localhost/xscj?useUnicode=true&characterEncoding=utf8";
	public static String user = "root";
	public static String pwd = "root";
	
	//sqlserver
//	public static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	public static String url = "jdbc:sqlserver://localhost:1433;DatabaseName=plusoft_test;";
//	public static String user = "";
//	public static String pwd = ""; 	

	////////////////////////////////////////////////////
	public String InsertNode(HashMap n) throws Exception
	{
		
		String sql = "insert into plus_file (id, name, type, size, url, pid, createdate, updatedate, folder, num)"
            + " values(?,?,?,?,?,?,?,?,?,?)";
		
		DBInsert(sql, n);
		return n.get("id").toString();
	}
	
	public void RemoveNode(HashMap n) throws Exception
	{
		String id = n.get("id").toString();
		Connection conn = getConn();		
		Statement stmt = conn.createStatement();
		
        String sql = "delete from plus_file where id = \""+id+"\"";        		
        stmt.executeUpdate(sql);
                
		stmt.close();
		conn.close();
	}
	public void UpdateTreeNode(HashMap n) throws Exception
	{
		String sql =
    		"update plus_file " 
    		+	" set "
    		+	" name = ?,"
    		+	" pid = ?,"
    		+	" num = ?"
    		+" where id = ?";
		Connection conn = getConn();		
		PreparedStatement stmt = conn.prepareStatement(sql);	
		stmt.setString(1, ToString(n.get("name")));
		stmt.setString(2, ToString(n.get("pid")));
		stmt.setInt(3, ToInt(n.get("num")));
		stmt.setString(4, ToString(n.get("id")));
		
		stmt.executeUpdate();		
	    stmt.close();
		conn.close();   
	}

    public HashMap SearchEmployees(String key, int index, int size, String sortField, String sortOrder) throws Exception
    {
        //System.Threading.Thread.Sleep(300);
    	if(key == null) key = "";
    	
    	String sql = 
 "select a.*, b.name dept_name, c.name position_name, d.name educational_name \n"
+"from t_employee a \n"
+"left join t_department b \n"
+"on a.dept_id = b.id \n"
+"left join t_position c \n"
+"on a.position = c.id \n"
+"left join t_educational d \n"
+"on a.educational = d.id \n"
+"where a.name like '%" + key + "%' \n";

        if (StringUtil.isNullOrEmpty(sortField) == false)
        {
            if ("desc".equals(sortOrder) == false) sortOrder = "asc";
            sql += " order by " + sortField + " " + sortOrder;
        }
        else
        {
            sql += " order by createtime desc";
        }

        ArrayList dataAll = DBSelect(sql);
        
        ArrayList data = new ArrayList();
        int start = index * size, end = start + size;

        for (int i = 0, l = dataAll.size(); i < l; i++)
        {
            HashMap record = (HashMap)dataAll.get(i);
            if (record == null) continue;
            if (start <= i && i < end)
            {
                data.add(record);
            }
            record.put("createtime", new Timestamp(100,10,10,1,1,1,1));
        }

        HashMap result = new HashMap();
        result.put("data", data);
        result.put("total", dataAll.size());
        //minAge, maxAge, avgAge
        ArrayList ages = DBSelect("select min(age) as minAge, max(age) as maxAge, avg(age) as avgAge from t_employee");
        HashMap ageInfo = (HashMap)ages.get(0);
        result.put("minAge", ageInfo.get("minAge"));
        result.put("maxAge", ageInfo.get("maxAge"));
        result.put("avgAge", ageInfo.get("avgAge"));
        return result;
    }
    public HashMap GetXs(String id) throws Exception
    {
    	String sql = "select id,xh,xm,xb,cssj,zy_id,zxf,bz from xsb where id = '"+id+"'";
        ArrayList data = DBSelect(sql);
        return data.size() > 0 ? (HashMap)data.get(0) : null;
    }
    public HashMap GetXsByXh(String xh) throws Exception
    {
    	String sql = "select id,xh,xm,xb,cssj,zy_id,zxf,bz from xsb where xh= '"+xh+"'";
        ArrayList data = DBSelect(sql);
        return data.size() > 0 ? (HashMap)data.get(0) : null;
    }
    public void InsertXs(HashMap user) throws Exception
    {
    	
    	Connection conn = getConn();	
    	String sql = "insert into xsb ( xh, xm, xb, cssj, zy_id, zxf, bz)values(?, ?, ?, ?, ?, ?, ?)";
    	
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ToString(user.get("xh")));
		stmt.setString(2, ToString(user.get("xm")));
		stmt.setString(3, ToString(user.get("xb")));
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		stmt.setString(4, ToString(sim.format(user.get("cssj"))));
		stmt.setInt(5,ToInt(user.get("zy_id")));
		stmt.setInt(6, ToInt(user.get("zxf")));
		stmt.setString(7, ToString(user.get("bz")));
		stmt.executeUpdate();
        stmt.close();
		conn.close();
      //  return SUCCESS;
    }
    public void DeleteXs(String userId) throws Exception
    {
		Connection conn = getConn();		
		Statement stmt = conn.createStatement();
        String sql = "delete from xsb where id = \""+userId+"\"";        		
        stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
    }
    public void UpdateXs1(HashMap user) throws Exception
    {
        HashMap db_user = GetXs(user.get("id").toString());
        Iterator iter = user.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry entry = (Map.Entry) iter.next();
            Object key = entry.getKey();
            Object val = entry.getValue();
            db_user.put(key, val);
        }         
        UpdateXs2(db_user);
    }
    
	public void UpdateXs2(HashMap n) throws Exception
	{
		String sql =
    		"update xsb " 
    		+	" set "
    		+	" xh = ?,"
    		+	" xm = ?,"
    		+	" xb = ?,"
    		+	" cssj = ?,"
    		+	" zy_id = ?,"
    		+	" zxf = ?,"
    		+	" bz = ?"
    		+" where id = ?";
		Connection conn = getConn();		
		PreparedStatement stmt = conn.prepareStatement(sql);	
		
		stmt.setString(1, ToString(n.get("xh")));
		stmt.setString(2, ToString(n.get("xm")));
		stmt.setString(3, ToString(n.get("xb")));
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		stmt.setString(4, ToString(sim.format(n.get("cssj"))));
		stmt.setInt(5, ToInt(n.get("zy_id")));
		stmt.setInt(6, ToInt(n.get("zxf")));
		stmt.setString(7, ToString(n.get("bz")));
		stmt.setInt(8, ToInt(n.get("id")));
		
		stmt.executeUpdate();		
	    stmt.close();
		conn.close();   
	}
 ////////////////////////////////////   
	 public HashMap GetKc(String id) throws Exception
	    {
	    	String sql = "select id,kch,kcm,kxxq,xs,xf from kcb where id = '"+id+"'";
	        ArrayList data = DBSelect(sql);
	        return data.size() > 0 ? (HashMap)data.get(0) : null;
	    }
	 public HashMap GetKcByKch(String kch) throws Exception
	    {
	    	String sql = "select id,kch,kcm,kxxq,xs,xf from kcb where kch = '"+kch+"'";
	        ArrayList data = DBSelect(sql);
	        return data.size() > 0 ? (HashMap)data.get(0) : null;
	    }
	 public HashMap GetKcByKcm(String kcm) throws Exception
	    {
	    	String sql = "select id,kch,kcm,kxxq,xs,xf from kcb where kcm = '"+kcm+"'";
	        ArrayList data = DBSelect(sql);
	        return data.size() > 0 ? (HashMap)data.get(0) : null;
	    }
	 public void DeleteKc(String userId) throws Exception
	    {
	      
			Connection conn = getConn();		
			Statement stmt = conn.createStatement();
	        String sql = "delete from kcb where id = \""+userId+"\"";        		
	        stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
	    }
	  public void UpdateKc1(HashMap user) throws Exception
	    {
	        HashMap db_user = GetKc(user.get("id").toString());
	        Iterator iter = user.entrySet().iterator();
	        while (iter.hasNext()) {
	            Map.Entry entry = (Map.Entry) iter.next();
	            Object key = entry.getKey();
	            Object val = entry.getValue();
	            db_user.put(key, val);
	        }         
	        UpdateKc2(db_user);
	    }
	  public void UpdateKc2(HashMap n) throws Exception
		{
			String sql =
	    		"update kcb " 
	    		+	" set "
	    		+	" kch = ?,"
	    		+	" kcm = ?,"
	    		+	" kxxq = ?,"
	    		+	" xs = ?,"
	    		+	" xf = ?"
	    		+" where id = ?";
			Connection conn = getConn();		
			PreparedStatement stmt = conn.prepareStatement(sql);	
			stmt.setString(1, ToString(n.get("kch")));
			stmt.setString(2, ToString(n.get("kcm")));
			stmt.setInt(3, ToInt(n.get("kxxq")));
			stmt.setInt(4, ToInt(n.get("xs")));
			stmt.setInt(5, ToInt(n.get("xf")));
			stmt.setInt(6, ToInt(n.get("id")));
			stmt.executeUpdate();		
		    stmt.close();
			conn.close();   
		}
	  public void InsertKc(HashMap user) throws Exception
	    {
	    	Connection conn = getConn();	
	    	//System.out.println("into insert");
	    	String sql = "insert into kcb ( kch, kcm, kxxq, xs,xf)values(?, ?, ?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, ToString(user.get("kch")));
			stmt.setString(2, ToString(user.get("kcm")));
			stmt.setInt(3, ToInt(user.get("kxxq")));
			stmt.setInt(4,ToInt(user.get("xs")));
			stmt.setInt(5, ToInt(user.get("xf")));
			stmt.executeUpdate();
	        stmt.close();
			conn.close();
	      //  return SUCCESS;
	    }
    /////////////////////////////////////////////////////////////////成绩表的操作
	  public HashMap GetCj(String xh) throws Exception
	    {
	    	String sql = "select id,xh,kch,cj,xf from cjb where xh = '"+xh+"'";
	        ArrayList data = DBSelect(sql);
	        return data.size() > 0 ? (HashMap)data.get(0) : null;
	    }
	   public void DeleteCj(String userId) throws Exception
	    {
			Connection conn = getConn();		
			Statement stmt = conn.createStatement();
	        String sql = "delete from cjb where id = \""+userId+"\"";        		
	        stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
	    }
	  
	  /////////////////////////////留言表的操作
	   public void DeleteLy(String userId) throws Exception
	    {
			Connection conn = getConn();		
			Statement stmt = conn.createStatement();
	        String sql = "delete from lytable where id = \""+userId+"\"";        		
	        stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
	    }
	   
	 /////////////////////
	   
	   public ArrayList GetAllZy() throws Exception
	    {
	        String sql = "select *"
						+" from zyb";
	        ArrayList data = DBSelect(sql);
	        return data;
	    }
	   public HashMap GetZybXs(String zyId, int index, int size) throws Exception
	    {
	        String sql = "select * from xsb where zy_id = '" + zyId + "'";
	        ArrayList dataAll = DBSelect(sql);
	        
	        ArrayList data = new ArrayList();
	        int start = index * size, end = start + size;

	        for (int i = 0, l = dataAll.size(); i < l; i++)
	        {
	            HashMap record = (HashMap)dataAll.get(i);
	            if (record == null) continue;
	            if (start <= i && i < end)
	            {
	                data.add(record);
	            }
	        }

	        HashMap result = new HashMap();
	        result.put("data", data);
	        result.put("total", dataAll.size());
	        
	        return result;
	    }
	   
	   
	  //////////////////////
	private Connection getConn() throws Exception{		
		Class.forName(driver).newInstance();
		Connection conn = null;
		if(user == null || user.equals("")){
			conn = java.sql.DriverManager.getConnection(url);
		}else{
			conn = java.sql.DriverManager.getConnection(url, user, pwd);
		}
			
		return conn;
	}	    
	public ArrayList DBSelect(String sql) throws Exception{
    	Connection conn = getConn();		
		Statement stmt = conn.createStatement();
    	
        ResultSet rst = stmt.executeQuery(sql);		
		ArrayList list = ResultSetToList(rst);
		
		rst.close();
		stmt.close();
		conn.close();
		
        return list;
	}
	public void DBDelete(String sql) throws Exception{
		
		Connection conn = getConn();		
		Statement stmt = conn.createStatement();
		
        stmt.executeUpdate(sql);
                
		stmt.close();
		conn.close();
	}
	public void DBInsert(String sql,HashMap node) throws Exception
	{
		Connection conn = getConn();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ToString(node.get("id")));
		stmt.setString(2, ToString(node.get("name")));
		stmt.setString(3, ToString(node.get("type")));
		stmt.setString(4, ToString(node.get("size")));
		stmt.setString(5, ToString(node.get("url")));
		stmt.setString(6, ToString(node.get("pid")));
		stmt.setTimestamp(7, ToDate(node.get("createdate")));
		stmt.setTimestamp(8, ToDate(node.get("updatedate")));
		stmt.setInt(9, ToInt(node.get("folder")));
		stmt.setInt(10, ToInt(node.get("num")));
		stmt.executeUpdate();
        stmt.close();
		conn.close();
	}
	
    private static ArrayList ResultSetToList(ResultSet   rs) throws Exception{    	
    	ResultSetMetaData md = rs.getMetaData();
    	int columnCount = md.getColumnCount();
    	ArrayList list = new ArrayList();
    	Map rowData;
    	while(rs.next()){
	    	rowData = new HashMap(columnCount);
	    	for(int i = 1; i <= columnCount; i++)   {	 	    		
	    		Object v = rs.getObject(i);	    		
	    		
	    		if(v != null && (v.getClass() == Date.class || v.getClass() == java.sql.Date.class)){
	    			Timestamp ts= rs.getTimestamp(i);
	    			v = new java.util.Date(ts.getTime());
	    			//v = ts;
	    		}else if(v != null && v.getClass() == Clob.class){
	    			v = clob2String((Clob)v);
	    		}
	    		rowData.put(md.getColumnName(i),   v);
	    	}
	    	list.add(rowData);	    	
    	}
    	return list;
	} 	
    private static String clob2String(Clob clob) throws Exception {
        return (clob != null ? clob.getSubString(1, (int) clob.length()) : null);
    }  		    
    private int ToInt(Object o){
    	if(o == null) return 0;
    	double d = Double.parseDouble(o.toString());
    	int i = 0;
		i -= d;
		return -i;			
    }    
    private String ToString(Object o){
    	if(o == null) return "";
    	return o.toString();
    }    
    private Timestamp ToDate(Object o){
    	try{
    		if(o.getClass() == String.class){


    			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    			o = format.parse(o.toString());  
    			return new java.sql.Timestamp(((Date)o).getTime());
    		}
    		return o != null ? new java.sql.Timestamp(((Date)o).getTime()) : null;
		}catch(Exception ex){
			return null;
		}
    }
}
