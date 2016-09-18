package com.future.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;

import com.future.domain.ProjectAwardNum;

/**
 * Created by Administrator on 2016/9/16.
 */
public class POIUtils {
		
	public static final String reportFilePath = "f:AwardReport.xls";
	
		
		public static HSSFWorkbook getWellDoneWb(List<ProjectAwardNum> awardNumList) throws IOException{


	        HSSFWorkbook wb = new HSSFWorkbook();
	        HSSFSheet sheet = wb.createSheet("学生获奖汇总表");
	        HSSFRow firstRow = sheet.createRow(0);
	        firstRow.setHeight((short)1000);
	        HSSFCell cell = firstRow.createCell(0);

	        //基本样式 居中
	        HSSFCellStyle  style = wb.createCellStyle();
	        //水平和竖直居中
	        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	        cell.setCellStyle(style);
	        cell.setCellValue("竞赛名称");
	        //设置第一列列宽
	        sheet.setColumnWidth(0,(int)35.7*220);

	        HSSFCellStyle myStyle = cell.getCellStyle();
	        HSSFFont font = wb.createFont();
	        font.setFontName("方正姚体");
	        font.setFontHeightInPoints((short)10);
	        myStyle.setFont(font);
	        cell.setCellStyle(myStyle);
	        sheet.addMergedRegion(new CellRangeAddress(0,1,0,0));

	        String[] firstTitle = {"国际", "国家", "省级", "校级"};
	        String[] secondTitle = {"一等奖", "二等奖", "三等奖"};
	        //设置一级标题
	        for(int i=1,k=1;i<=10;i+=3,k++){
	            cell = firstRow.createCell(i);
	            cell.setCellValue(firstTitle[k-1]);
	            cell.setCellStyle(style);
	            sheet.addMergedRegion(new CellRangeAddress(0,0,i,i+2));
	        }
	        //设置二级标题
	        HSSFRow secondRow = sheet.createRow(1);
	        secondRow.setHeight((short)1000);
	        for(int i=1,k=1;i<=12;++i,++k){
	            k = k>3?1:k;
	            cell = secondRow.createCell(i);
	            cell.setCellStyle(style);
	            cell.setCellValue(secondTitle[k-1]);
	        }

	        //添加行汇总
	        cell = firstRow.createCell(13);
	        cell.setCellValue("该竞赛获奖汇总");
	        cell.setCellStyle(style);
	        sheet.addMergedRegion(new CellRangeAddress(0,1,13,13));
	        //设置本列宽度
	        sheet.setColumnWidth(13,(short)37.5*120);
	        HSSFRow normalRow = null;
	        HSSFCell normalCell = null;
	        ProjectAwardNum projectAwardNum = null;
	        if(awardNumList != null && awardNumList.size()>0){
		        for (int i=0;i<awardNumList.size();i++){
		            projectAwardNum = awardNumList.get(i);
		            normalRow = sheet.createRow(i+2);
		            //设置行值，同时进行汇总
		            for(int j=0;j<=13;++j){
		                normalCell = normalRow.createCell(j);
		                normalCell.setCellStyle(style);
		                switch (j){
		                    case 0: normalCell.setCellValue(projectAwardNum.getProjectName()==null?"无描述":projectAwardNum.getProjectName()); break;
	
		                    case 1: normalCell.setCellValue(projectAwardNum.getInternationFirstPrizeNum()==null?0:projectAwardNum.getInternationFirstPrizeNum()); break;
		                    case 2: normalCell.setCellValue(projectAwardNum.getInternationSecondPrizeNum()==null?0:projectAwardNum.getInternationSecondPrizeNum()); break;
		                    case 3: normalCell.setCellValue(projectAwardNum.getInternationThirdPrizeNum()==null?0:projectAwardNum.getInternationThirdPrizeNum()); break;
	
		                    case 4: normalCell.setCellValue(projectAwardNum.getCountryFirstPrizeNum()==null?0:projectAwardNum.getCountryFirstPrizeNum()); break;
		                    case 5: normalCell.setCellValue(projectAwardNum.getCountrySecondPrizeNum()==null?0:projectAwardNum.getCountrySecondPrizeNum()); break;
		                    case 6: normalCell.setCellValue(projectAwardNum.getCountryThirdPrizeNum()==null?0:projectAwardNum.getCountryThirdPrizeNum()); break;
	
		                    case 7: normalCell.setCellValue(projectAwardNum.getProvinceFirstPrizeNum()==null?0:projectAwardNum.getProvinceFirstPrizeNum()); break;
		                    case 8: normalCell.setCellValue(projectAwardNum.getProvinceSecondPrizeNum()==null?0:projectAwardNum.getProvinceSecondPrizeNum()); break;
		                    case 9: normalCell.setCellValue(projectAwardNum.getProvinceThirdPrizeNum()==null?0:projectAwardNum.getProvinceThirdPrizeNum()); break;
	
		                    case 10: normalCell.setCellValue(projectAwardNum.getSchoolFirstPrizeNum()==null?0:projectAwardNum.getSchoolFirstPrizeNum()); break;
		                    case 11: normalCell.setCellValue(projectAwardNum.getSchoolSecondPrizeNum()==null?0:projectAwardNum.getSchoolSecondPrizeNum()); break;
		                    case 12: normalCell.setCellValue(projectAwardNum.getSchoolThirdPrizeNum()==null?0:projectAwardNum.getSchoolThirdPrizeNum()); break;
		                    //行级汇总
		                    case 13: normalCell.setCellFormula("sum(B"+(i+3)+":M"+(i+3)+")"); break;
		                }
		            }
		        }
	        }
	        //行级汇总
	        normalRow = sheet.createRow(awardNumList.size()+2);
	        int startNum = 3;
	        int endNum = awardNumList.size()+2;
	        for(int j=0;j<13;++j){
                normalCell = normalRow.createCell(j);
                normalCell.setCellStyle(style);
                switch (j){
                	case 0: normalCell.setCellValue("各级得奖汇总"); break;
                	
                    case 1: normalCell.setCellFormula("sum(B"+startNum+":B"+endNum+")"); break;
                    case 2: normalCell.setCellFormula("sum(C"+startNum+":C"+endNum+")"); break;
                    case 3: normalCell.setCellFormula("sum(D"+startNum+":D"+endNum+")"); break;
                    
                    case 4: normalCell.setCellFormula("sum(E"+startNum+":E"+endNum+")"); break;
                    case 5: normalCell.setCellFormula("sum(F"+startNum+":F"+endNum+")"); break;
                    case 6: normalCell.setCellFormula("sum(G"+startNum+":G"+endNum+")"); break;
                    
                    case 7: normalCell.setCellFormula("sum(H"+startNum+":H"+endNum+")"); break;
                    case 8: normalCell.setCellFormula("sum(I"+startNum+":I"+endNum+")"); break;
                    case 9: normalCell.setCellFormula("sum(J"+startNum+":J"+endNum+")"); break;
                    
                    case 10: normalCell.setCellFormula("sum(K"+startNum+":K"+endNum+")"); break;
                    case 11: normalCell.setCellFormula("sum(L"+startNum+":L"+endNum+")"); break;
                    case 12: normalCell.setCellFormula("sum(M"+startNum+":M"+endNum+")"); break;
                }
            }
	        
	        wb.write(new FileOutputStream(reportFilePath));
		return wb;
	}

}
