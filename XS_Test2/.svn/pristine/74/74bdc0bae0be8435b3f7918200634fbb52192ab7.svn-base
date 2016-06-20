package servlet;



import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.model.Xsb;

/**
 * 导出Excel
 * @author lyyoung
 *
 */
public class OutExcel {

	/**
	 * 导出学生 的信息
	 * @param list
	 * @param output
	 */
	public String XsbOutExcel(List<Xsb> list,String output){
		String filename=null;
		try{
			
		
		filename="学生信息.xlsx";
		output +="/"+filename;
		
		Workbook wb = new SXSSFWorkbook(100);
		Sheet sh=wb.createSheet();
		FileOutputStream fOut=new FileOutputStream(output);
		writeRow(sh,0,new String[]{"id","学号" ,"姓名","性别","出生时间","专业号","总学分","备注"});
		int id;
		String xh;
		String xm;
		String xb;
		String cssj;
		int zy_id;
		int zxf;
		String bz;
		
		int k=1;
		for(Xsb l:list){
			id = l.getId();
			xh = l.getXh();
			xm = l.getXm();
			xb =l.getXb();
			cssj = l.getCssj();
			zy_id=l.getZy_id();
			zxf = l.getZxf();
			bz = l.getBz();
			writeRow(sh, k, new String[]{id+"",xh,xm,xb+"",cssj+"",zy_id+"",zxf+"",bz});
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
