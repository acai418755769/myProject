package servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.model.Xsb;
/**
 * 导出Excel的servlet
 * @author lyyoung
 *
 */
public class OutExcelServlet extends HttpServlet {

	/**
	 * fun:抽象出来的一个面向浏览器的回应
	 * @param response 响应
	 * @param fileName 对应的源文件名称
	 * @throws Exception
	 */
	public void myResponse(HttpServletResponse response,String fileName)throws Exception{
		//@#2015.3.25尝试直接定向到页面
		
//		String fileName ="桥梁信息.xlsx";
	    String filePath =this.getServletContext().getRealPath("/output/"+fileName);	     
	      /*
	       * 对字符编码进行设置，用来支持中文的文件名
	       */
	      response.setCharacterEncoding("UTF-8");
	      fileName = java.net.URLEncoder.encode(fileName,"UTF-8");
	      /*
	       * 指明了这个Servlet的功能是输出文件，并且指明文件的位置
	       */
	      response.setHeader("Content-Disposition","attachment; filename="+ fileName);
	      /*
	       * 指明了要输入文件的类型，其中image/bitmap就是BMP文件的MIME类型描述
	       */
	      response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	      ServletOutputStream os =response.getOutputStream();
	      BufferedOutputStream bos = new BufferedOutputStream(os);
	      FileInputStream fis = new FileInputStream(new File(filePath));
	      BufferedInputStream bis = new BufferedInputStream(fis);
	      byte[] buff = new byte[1024];
	      int length = 0;
	      while ((length = bis.read(buff,0,buff.length))!=-1) {
	         bos.write(buff, 0, length);
	      }
	      bos.flush();
	      bos.close();
	      fis.close();	
		//@#end of 2015.3.25尝试直接定向到页面
	}
	
	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OutExcel out = new OutExcel();
		String output = request.getSession().getServletContext().getRealPath("/output");
		DB db = new DB();
		
			try{
				List<Xsb> list = db.findAllExcel();
				
				String fileName =out.XsbOutExcel(list,output);
				//@#新添加的
				myResponse(response,fileName);

			  
			      
				request.setAttribute("message", "导出成功！");
			}catch(Exception e){
				e.printStackTrace();
				request.setAttribute("message","导出失败false");
				System.out.println("导出失败");
			}
			//request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
		


	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
