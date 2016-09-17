package com.future.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AdminDao;
import com.future.domain.Department;
import com.future.domain.Student;

@Service
@Transactional
public class ImportDate {
	
	@Resource
	private AdminDao adminDao;
	
	//接受传过来的路径，开始读取
	public List prepare(String path,Map<String,Department> deMap) throws IOException{
		 String excel2003_2007 = STUDENT_INFO_XLS_PATH;
	     String excel2010 = STUDENT_INFO_XLSX_PATH;
	     EXCEL_PATH = path;
	     LIB_PATH = path;
	     
	     List<Student> list1 = readExcel(path,deMap);
	     //存放不符合学生以及错误信息
	     Map<Student,List> errStumap = new HashMap<Student,List>();
	     
	     //符合要求学生数量
	     List<Object> returnList = new ArrayList();
	     int num = 0;
	     
        if (list1 != null) {
            for (Student student : list1) {
            	List<String> error = new ArrayList<String>();
                System.out.print(student.getStu_num()+ "|");
                System.out.print(student.getStu_name() + "|");
                System.out.print(student.getStu_sex()+ "|");
                System.out.print(student.getStu_department()+ "|");
                System.out.print(student.getStu_major()+ "|");
                System.out.print(student.getStu_class()+ "|");
                System.out.print(student.getStu_idCard()+ "|");
                System.out.print(student.getStu_grade()+ "|");
                System.out.print(student.getStu_password()+ "|");
                System.out.println();
                
                if(student.getStu_num().isEmpty() || student.getStu_name().isEmpty() || student.getStu_sex().isEmpty()|| student.getStu_department()==null ||student.getStu_major().isEmpty() ||student.getStu_class().isEmpty() ||student.getStu_idCard().isEmpty() ||student.getStu_grade().isEmpty() ||student.getStu_password().isEmpty()    ){
                	if(student.getStu_num().isEmpty() ){
                		//System.out.println("aaaa" + student.getStu_num());
                		error.add("学号不能为空");
                	} 
                	
                	if (student.getStu_name().isEmpty()) {
                		error.add("姓名不能为空");
                	} 
                	
                	if(student.getStu_sex().isEmpty()){
                		error.add("性别不能为空");
                	}
                	
                	if(student.getStu_department()==null){
                		error.add("院系不能为空");
                	}
                	
                	if(student.getStu_major().isEmpty()){
                		error.add("专业不能为空");
                	}
                	
                	if(student.getStu_class().isEmpty()){
                		error.add("班级不能为空");
                	}
                	
                	if(student.getStu_idCard().isEmpty()){
                		error.add("身份证号不能为空");
                	}
                	
                	if(student.getStu_grade().isEmpty()){
                		error.add("年级不能为空");
                	}
                	
                	if(student.getStu_password().isEmpty()){
                		error.add("密码不能为空");
                	} 
                	
                	errStumap.put(student, error);
                	
                } else {
					num++;
				}
                
            }
            returnList.add(errStumap);
            returnList.add(num);         
           
        }
        
        
        if(errStumap.isEmpty()){
	        try {
				save(list1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	        
	        return returnList;
        } else {
        	return returnList;
        }
        
        //保存
        //return errStumap;
	}
	
	public List<Student> readExcel(String path,Map<String,Department> deMap) throws IOException {
        if (path == null || EMPTY.equals(path)) {
            return null;
        } else {
            String postfix = getPostfix(path);
            if (!EMPTY.equals(postfix)) {
                if (OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
                    return readXls(path);
                } else if (OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
                    return readXlsx(path,deMap);
                }
            } else {
                System.out.println(path + NOT_EXCEL_FILE);
            }
        }
        return null;
    }
	
	/**
     * Read the Excel 2003-2007
     * @param path the path of the Excel
     * @return
     * @throws IOException
     */
    public List<Student> readXls(String path) throws IOException {
        System.out.println(PROCESSING + path);
        InputStream is = new FileInputStream(path);
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        Student student = null;
        List<Student> list = new ArrayList<Student>();
        // Read the Sheet
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // Read the Row
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null) {
                    student = new Student();
                    HSSFCell stu_num = hssfRow.getCell(0);
                    HSSFCell stu_name = hssfRow.getCell(1);
                    HSSFCell stu_sex = hssfRow.getCell(2);
                    HSSFCell stu_department_de_id = hssfRow.getCell(3);
                    HSSFCell stu_major = hssfRow.getCell(4);
                    HSSFCell stu_class = hssfRow.getCell(5);
                    HSSFCell stu_idCard = hssfRow.getCell(6);
                    HSSFCell stu_grade = hssfRow.getCell(7);
                    HSSFCell stu_password = hssfRow.getCell(8);
                    student.setStu_num(getValue(stu_num));
                    student.setStu_name(getValue(stu_name));
                    student.setStu_sex(getValue(stu_sex));
                    
                    String a = getValue(stu_department_de_id);
                    //Department de = deMap.get(a);
                    //student.setStu_department(de);
                    
                    student.setStu_major(getValue(stu_major));
                    student.setStu_class(getValue(stu_class));
                    student.setStu_idCard(getValue(stu_idCard));
                    student.setStu_grade(getValue(stu_grade));
                    student.setStu_password(getValue(stu_password));
                    list.add(student);
                }
            }
        }
        return list;
    }
    /**
     * Read the Excel 2010
     * @param path the path of the excel file
     * @return
     * @throws IOException
     */
    public List<Student> readXlsx(String path,Map<String,Department> deMap) throws IOException {
        System.out.println(PROCESSING + path);
        InputStream is = new FileInputStream(path);
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
        Student student = null;
        List<Student> list = new ArrayList<Student>();
        // Read the Sheet
        for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
            if (xssfSheet == null) {
                continue;
            }
            // Read the Row
            for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                if (xssfRow != null) {
                    student = new Student();
                    XSSFCell stu_num = xssfRow.getCell(0);
                    XSSFCell stu_name = xssfRow.getCell(1);
                    XSSFCell stu_sex = xssfRow.getCell(2);
                    XSSFCell stu_department_de_id = xssfRow.getCell(3);
                    XSSFCell stu_major = xssfRow.getCell(4);
                    XSSFCell stu_class = xssfRow.getCell(5);
                    XSSFCell stu_idCard = xssfRow.getCell(6);
                    XSSFCell stu_grade = xssfRow.getCell(7);
                    XSSFCell stu_password = xssfRow.getCell(8);
                    student.setStu_num(getValue(stu_num));
                    student.setStu_name(getValue(stu_name));
                    student.setStu_sex(getValue(stu_sex));
                    
                    String a = getValue(stu_department_de_id);
                    Department de = deMap.get(a);
                    student.setStu_department(de);
                    student.setStu_major(getValue(stu_major));
                    student.setStu_class(getValue(stu_class));
                    student.setStu_idCard(getValue(stu_idCard));
                    student.setStu_grade(getValue(stu_grade));
                    student.setStu_password(getValue(stu_password));
                    list.add(student);
                }
            }
        }
        
        if (list != null) {
            for (Student student2 : list) {
                System.out.print(student2.getStu_num()+ "|");
                System.out.print(student2.getStu_name() + "|");
                System.out.print(student2.getStu_sex()+ "|");
                System.out.print(student2.getStu_department()+ "|");
                System.out.print(student2.getStu_major()+ "|");
                System.out.print(student2.getStu_class()+ "|");
                System.out.print(student2.getStu_idCard()+ "|");
                System.out.print(student2.getStu_grade()+ "|");
                System.out.print(student2.getStu_password()+ "|");
                System.out.println();
            }
        }
        return list;
    }
    
    @SuppressWarnings({ "rawtypes" })
	public void save(List<Student> lists) throws IOException, SQLException {
		//ReadExcel xlsMain = new ReadExcel();
		Student student = null;
		List<Student> list = lists;
		//通过工具类获取所有院系id
		Map<String,String> deMap = DbUtil.getDeMap();
		for (int i = 0; i < list.size(); i++) {
			student = list.get(i);
			//根据身份证号检测本条数据是否存在，如果不存在就插入，存在就不插入
			List l = DbUtil.selectOne(SELECT_STUDENT_SQL + "'%" + student.getStu_idCard() + "%'", student);
			if (!l.contains(1)) {
				//插入之前修改学院
				DbUtil.insert(INSERT_STUDENT_SQL, student);
			} else {
				//System.out.println("The Record was Exist : No. = " + student.getNo() + " , Name = " + student.getName() + ", Age = " + student.getAge() + ", and has been throw away!");
				System.out.println("The Record was Exist : idcard. = " + student.getStu_idCard());
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static final String OFFICE_EXCEL_2003_POSTFIX = "xls";
    public static final String OFFICE_EXCEL_2010_POSTFIX = "xlsx";

    public static final String EMPTY = "";
    public static final String POINT = ".";
    public static String LIB_PATH = "C:\\Users\\Administrator\\Desktop";
    public static final String STUDENT_INFO_XLS_PATH = LIB_PATH + "/student_info" + POINT + OFFICE_EXCEL_2003_POSTFIX;
    public static final String STUDENT_INFO_XLSX_PATH = LIB_PATH + "/students" + POINT + OFFICE_EXCEL_2010_POSTFIX;
    public static final String NOT_EXCEL_FILE = "没有找到指定文件";
    public static final String PROCESSING = "Processing...";
    
    
    
    //connect the database
 	public static final String DRIVER = "com.mysql.jdbc.Driver";
 	public static final String DB_NAME = "competitionmanager?useUnicode=true&characterEncoding=utf8";
 	public static final String USERNAME = "root";
 	public static final String PASSWORD = "root";
 	public static final String IP = "127.0.0.1";
 	public static final String PORT = "3306";
 	public static final String URL = "jdbc:mysql://" + IP + ":" + PORT + "/" + DB_NAME;
 	
 	// common
 	public static String EXCEL_PATH = "lib/student_info1.xlsx";
 	
 	// sql
 	public static final String INSERT_STUDENT_SQL = "insert into cm_students(stu_num,stu_name,stu_sex,stu_department_de_id,stu_major,stu_class,stu_idCard,stu_grade,stu_password) values(?, ?, ?, ?,?,?,?,?,?)";
 	//public static final String UPDATE_STUDENT_SQL = "update student_info set no = ?, name = ?, age= ?, score = ? where id = ? ";
 	//public static final String SELECT_STUDENT_ALL_SQL = "select id,no,name,age,score from student_info";
 	public static final String SELECT_STUDENT_SQL = "select * from cm_students where stu_idCard like ";

 	//辅助方法
 	public static String getPostfix(String path) {
        if (path == null || EMPTY.equals(path.trim())) {
            return EMPTY;
        }
        if (path.contains(POINT)) {
            return path.substring(path.lastIndexOf(POINT) + 1, path.length());
        }
        return EMPTY;
    }
 	
 	@SuppressWarnings("static-access")
    private String getValue(XSSFCell xssfRow) {
        if (xssfRow.getCellType() == xssfRow.CELL_TYPE_BOOLEAN) {
            return String.valueOf(xssfRow.getBooleanCellValue());
        } else if (xssfRow.getCellType() == xssfRow.CELL_TYPE_NUMERIC) {
            return String.valueOf(xssfRow.getNumericCellValue());
        } else {
            return String.valueOf(xssfRow.getStringCellValue());
        }
    }

    @SuppressWarnings("static-access")
    private String getValue(HSSFCell hssfCell) {
        if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
            return String.valueOf(hssfCell.getNumericCellValue());
        } else {
            return String.valueOf(hssfCell.getStringCellValue());
        }
    }
    
}
