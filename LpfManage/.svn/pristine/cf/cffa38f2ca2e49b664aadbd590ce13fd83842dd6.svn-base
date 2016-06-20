package org.servlet;



import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.model.Task;

/**
 * ����Excel
 * @author lyyoung
 *
 */
public class OutExcel {

	/**
	 * ����ѧ�� ����Ϣ
	 * @param list
	 * @param output
	 */
	public String TaskOutExcel(List<Task> list,String output){
		String filename=null;
		try{
			
		
		filename="桥梁信息.xlsx";
		output +="/"+filename;
		
		Workbook wb = new SXSSFWorkbook(100);
		Sheet sh=wb.createSheet();
		FileOutputStream fOut=new FileOutputStream(output);
		writeRow(sh,0,new String[]{"id","桥梁名称" ,"上报人","上报手机","ר上报日期","上报内容","目前状态","派工日期","核查人","核查手机","核查日期","核查内容"});
		int id;
		String bname;
		
		String h_name;
		String h_date;
		String h_tel;
		String h_descript;
		int state;
		String senddate;
		String w_name;
		String w_date;
		String w_tel;
		String w_descript;
		
		
		
		int k=1;
		for(Task l:list){
			id = l.getId();
			bname = l.getBname();
			
			h_name =l.getH_name();
			h_tel = l.getH_tel();
			h_date=l.getH_date();
			h_descript = l.getH_descript();
			state = l.getState();
			senddate=l.getSenddate();
			w_name =l.getW_name();
			w_tel = l.getW_tel();
			w_date=l.getW_date();
			w_descript = l.getW_descript();
			writeRow(sh, k, new String[]{id+"",bname,h_name,h_tel,h_date,h_descript,state+"",senddate,w_name,w_tel,w_date,w_descript});
			k++;
			
		}
		wb.write(fOut);
		fOut.flush();
		fOut.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return filename;
		
}
	
	public static void writeRow(Sheet sheet, int rowNum, String[] content){
		Row row = sheet.createRow(rowNum);
		Cell cell;
		for(int i=0;i<content.length;i++){
			cell = row.createCell(i);
		    cell.setCellType(Cell.CELL_TYPE_STRING);
		    cell.setCellValue(content[i]);
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
