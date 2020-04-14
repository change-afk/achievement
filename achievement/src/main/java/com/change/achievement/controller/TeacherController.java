package com.change.achievement.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.change.achievement.entity.PageBean;
import com.change.achievement.entity.Password;
import com.change.achievement.entity.Teacher;
import com.change.achievement.serviceI.PassServiceI;
import com.change.achievement.serviceI.TeacherServiceI;
import com.change.achievement.util.GetMD5;
import com.change.achievement.util.PageUtil;
import com.change.achievement.util.SysConstant;

import sun.misc.BASE64Encoder;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	private TeacherServiceI teacherService;
	@Autowired
	private PassServiceI passService;
	
	private PageUtil pageUtil = new PageUtil();
	
	/**
	 * 条件查询
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/selTeacher")
	public Map<String, Object> selTeacher(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage,@RequestParam("searchMsg") String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		List<Teacher> list = new ArrayList<Teacher>();
		PageBean page = new PageBean();
		int totalCount = teacherService.getSearchAllPage(msg);
		page = pageUtil.getPage(totalCount);
		if(totalCount==0) {
			map.put("flag", -1);
			return map;
		}
		int start = (currPage-1)*page.getPageSize();
		searchMap.put("start", start);
		searchMap.put("size", page.getPageSize());
		searchMap.put("msg", msg);
		list = teacherService.getSearchPage(searchMap);
		map.put("flag", 0);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 删除教师信息（单个、批量）
	 * @author change
	 * @param String[] pids
	 * @return
	 */
	@RequestMapping("/delTeacher")
	public Map<String, Object> delTeacher(@RequestBody String[] array) {
		Map<String, Object> map = new HashMap();
		int i=0;
		try {
			for(int j=0;j<array.length;j++) {
				i=teacherService.delTeacherById(array[j]);
			}
		} catch (Exception e) {
			i=-1;
			e.printStackTrace();
		}
		map.put("flag", i);
		return map;
	}
	/**
	 * 修改教师信息
	 * @author change
	 * @param Teacher teacher
	 * @return
	 */
	@RequestMapping("/uptTeacher")
	public Map<String, Object> uptTeacher(@RequestParam("jsonStr") String jsonStr) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = new Teacher();
		JSONObject jsonObject = JSONObject.parseObject(jsonStr);
		teacher = JSON.toJavaObject(jsonObject,Teacher.class );
		try {
			int i = teacherService.uptTeacher(teacher);
			map.put("flag", i);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 根据id查询
	 * @author change
	 * @param String tid
	 * @return
	 */
	@RequestMapping("/selectTeacherByTid")
	public Map<String, Object> selectTeacherByTid(@RequestParam("tid") String tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = new Teacher();
		try {
			teacher = teacherService.selectTeacherByTid(tid);
			if(teacher==null) {
				map.put("flag", -1);
				map.put("msg", "查询不到数据");
			}
			map.put("teacher", teacher);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 将图片转为base64编码
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/toBase64")
	public Map<String, Object> toBase64(@RequestParam(value="file")MultipartFile multipartFile) {
		Map<String, Object> map = new HashMap<String, Object>();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		try {
			BASE64Encoder base64Encoder =new BASE64Encoder();
	        String base64EncoderImg = multipartFile.getOriginalFilename()+","+ base64Encoder.encode(multipartFile.getBytes());
	        String[] s = base64EncoderImg.split(",");
			map.put("flag", 1);
			map.put("str", s[1]);
		} catch (IOException e) {
			map.put("flag", -1);
			map.put("msg", "图片转换失败");
			return map;
		}
		return map;
	}
	/**
	 * 查询数量
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectNum")
	public Map<String, Object> selectNum() {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCount = teacherService.getAllPage();
		map.put("num", totalCount);
		return map;
	}
	/**
	 * 查询全部教师信息分页
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectTeacher")
	public Map<String, Object> selectTeacher(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Teacher> list = new ArrayList<Teacher>();
		PageBean page = new PageBean();
		int totalCount = teacherService.getAllPage();
		page = pageUtil.getPage(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = teacherService.selectByPage(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 查询全部教师信息分页分页显示数量不同
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectTeacher2")
	public Map<String, Object> selectTeacher2(@RequestParam(defaultValue = "1") int currPage,
			@RequestParam(defaultValue = "1") int toPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Teacher> list = new ArrayList<Teacher>();
		PageBean page = new PageBean();
		int totalCount = teacherService.getAllPage();
		page = pageUtil.getPage12(totalCount);
		int start = (currPage-1)*page.getPageSize();
		list = teacherService.selectByPage(start, page.getPageSize());
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	/**
	 * 添加教师信息
	 * @author change
	 * @param Teacher teacher
	 * @return
	 */
	@RequestMapping("/addTeacher")
	public Map<String, Object> insertTeacher(@RequestParam("jsonStr") String jsonStr) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = new Teacher();
		JSONObject jsonObject = JSONObject.parseObject(jsonStr);
		teacher = JSON.toJavaObject(jsonObject,Teacher.class );
		Password pass = new Password(teacher.getTid(),SysConstant.passWord_constant,"teacher");
		try {
			teacherService.addTeacher(teacher);
			passService.addPass(pass);
			map.put("flag", 1);
		} catch (Exception e) {
			map.put("flag", -1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 导入excel
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/import")
	public Map<String, Object> importTeacher(@RequestParam("file")MultipartFile mulFile) {
		Map<String, Object> map = new HashMap<String, Object>();
		Workbook workbook = null;
		File file = null;
		InputStream is = null;
		String filename = null;
		Sheet sheet = null;
		DecimalFormat df = new DecimalFormat("#");
		Teacher teacher = new Teacher();
		try {
			file = SysConstant.multipartFileToFile(mulFile);//MultipartFile转为file
			filename = file.getAbsolutePath();
			is = new FileInputStream(filename);//创建读取excel的文件流
			if(filename.endsWith("xls")) {//文件格式判断
				workbook = new HSSFWorkbook(is);
			}else if(filename.endsWith("xlsx")) {
				workbook = new XSSFWorkbook(is);
			}
		}catch (Exception e) {
			map.put("msg", "文件转换失败");
			map.put("code", -1);
			return map;
		}
		sheet = workbook.getSheetAt(0);//取第一张表
		int rows = sheet.getLastRowNum();//获取工作表行数
		if(rows <=0){
			map.put("msg", "文件无数据");
			map.put("code", -1);
			//SysConstant.delteTempFile(file);//删除本地缓存文件
			return map;
		}
		for(int i = 1;i<= rows;i++){
            //读取当前行
            Row row = sheet.getRow(i);
            try {
				teacher.setTid(df.format(new BigDecimal(row.getCell(0).toString().trim()!=""?row.getCell(0).toString().trim():"Null")));
				teacher.setTname(row.getCell(1).toString().trim()!=""?row.getCell(1).toString().trim():"Null");
				teacher.setTsex(row.getCell(2).toString().trim()!=""?row.getCell(2).toString().trim():"Null");
				teacher.setTelephone(df.format(new BigDecimal(row.getCell(3).toString().trim()!=""?row.getCell(3).toString().trim():"Null")));
				teacher.setTprofession(row.getCell(4).toString().trim()!=""?row.getCell(4).toString().trim():"Null");
				teacher.setTunit(row.getCell(5).toString().trim()!=""?row.getCell(5).toString().trim():"Null");
				teacher.setTintime(row.getCell(6).toString().trim()!=""?row.getCell(6).toString().trim():"Null");
				teacher.setTdegree(row.getCell(7).toString().trim()!=""?row.getCell(7).toString().trim():"Null");
				teacher.setTmajor(row.getCell(8).toString().trim()!=""?row.getCell(8).toString().trim():"Null");
				teacher.setTschool(row.getCell(9).toString().trim()!=""?row.getCell(9).toString().trim():"Null");
				teacher.setTmail(row.getCell(10).toString().trim()!=""?row.getCell(10).toString().trim():"Null");
				teacher.setTplace(row.getCell(11).toString().trim()!=""?row.getCell(11).toString().trim():"Null");
				teacher.setTpersonal(row.getCell(12).toString().trim()!=""?row.getCell(12).toString().trim():"Null");
				if(teacher.getTid()=="Null" || teacher.getTname()=="Null" || teacher.getTsex()=="Null" || teacher.getTelephone()=="Null"
						|| teacher.getTprofession()=="Null" || teacher.getTunit()=="Null" || teacher.getTintime()=="Null" 
						|| teacher.getTdegree()=="Null" || teacher.getTmajor()=="Null" || teacher.getTschool()=="Null" ) {
					map.put("code", -1);
					map.put("msg", "前10列数据不可为空");
					//SysConstant.delteTempFile(file);//删除本地缓存文件
					return map;
				}
				Password pass = new Password();
				pass =passService.login(teacher.getTid(), GetMD5.getMD5String(SysConstant.passWord_constant));
				if(pass==null) {
					try {
						teacherService.addTeacher(teacher);
					} catch (Exception e) {
						map.put("code", -1);
						map.put("msg", "数据插入失败");
						System.out.println(e.getMessage());
						//SysConstant.delteTempFile(file);//删除本地缓存文件
						return map;
					}
					passService.addPass(new Password(teacher.getTid(),GetMD5.getMD5String(SysConstant.passWord_constant),"teacher"));
				}else {
					map.put("msg", teacher.getTid()+"已存在账号，请检查");
					map.put("code", -1);
					//SysConstant.delteTempFile(file);//删除本地缓存文件
					return map;
				}
            } catch (NullPointerException e1) {
				map.put("msg", "导入文件列数不正确，请下载模板");
				map.put("code", -1);
				//SysConstant.delteTempFile(file);//删除本地缓存文件
				return map;
			}
       }
		//SysConstant.delteTempFile(file);//删除本地缓存文件
		
		map.put("code", 0);
		return map;
	}
	/**
	 * 下载
	 * @author change
	 * @param 
	 * @return
	 */
	@RequestMapping("/download")
	public void download(HttpServletResponse response,HttpServletRequest request) {
		try {
            //获取文件的路径
            String excelPath = request.getSession().getServletContext().getRealPath("/WEB-INF/file/"+"template.xls");
            String fileName = "template.xls".toString(); // 文件的默认保存名
            // 读到流中
            InputStream inStream = new FileInputStream(excelPath);//文件的存放路径
            // 设置输出的格式
            response.reset();
            response.setContentType("bin");
            response.addHeader("Content-Disposition",
                    "attachment;filename=" + URLEncoder.encode("template.xls", "UTF-8"));
            // 循环取出流中的数据
            byte[] b = new byte[200];
            int len;

            while ((len = inStream.read(b)) > 0){
                response.getOutputStream().write(b, 0, len);
            }
            inStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}



