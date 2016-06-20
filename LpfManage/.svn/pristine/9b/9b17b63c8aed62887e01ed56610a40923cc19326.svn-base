package org.servlet;

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

import org.model.Task;
/**
 * ����Excel��servlet
 * @author lyyoung
 *
 */
public class OutExcelServlet extends HttpServlet {

	/**
	 * fun:���������һ������������Ļ�Ӧ
	 * @param response ��Ӧ
	 * @param fileName ��Ӧ��Դ�ļ����
	 * @throws Exception
	 */
	public void myResponse(HttpServletResponse response,String fileName)throws Exception{
		//@#2015.3.25����ֱ�Ӷ���ҳ��
		
//		String fileName ="������Ϣ.xlsx";
	    String filePath =this.getServletContext().getRealPath("/output/"+fileName);	     
	      /*
	       * ���ַ����������ã�����֧�����ĵ��ļ���
	       */
	      response.setCharacterEncoding("UTF-8");
	      fileName = java.net.URLEncoder.encode(fileName,"UTF-8");
	      /*
	       * ָ�������Servlet�Ĺ���������ļ�������ָ���ļ���λ��
	       */
	      response.setHeader("Content-Disposition","attachment; filename="+ fileName);
	      /*
	       * ָ����Ҫ�����ļ������ͣ�����image/bitmap����BMP�ļ���MIME��������
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
		//@#end of 2015.3.25����ֱ�Ӷ���ҳ��
	}
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OutExcel out = new OutExcel();
		String output = request.getSession().getServletContext().getRealPath("/output");
		DB db = new DB();
			try{
				List<Task> list = db.findAllExcel();
				String fileName =out.TaskOutExcel(list,output);
				//@#����ӵ�
				myResponse(response,fileName);
				request.setAttribute("message", "�����ɹ���");
			}catch(Exception e){
				e.printStackTrace();
				request.setAttribute("message","����ʧ��false");
			}
			//request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
