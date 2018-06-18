package com.chinagpay.boss.controller.announce;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.chinagpay.boss.common.exception.ControllerExceptionResolver;
import com.chinagpay.boss.common.sessionuser.SessionUser;
import com.chinagpay.boss.common.util.ConfigService;
import com.chinagpay.boss.model.Announce;
import com.chinagpay.boss.service.AnnounceService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/announce")
public class AnnounceController {
	private static final Logger logger = LogManager.getLogger(AnnounceController.class);

	@Autowired
	private AnnounceService announceService;

	@RequestMapping(value = "/toAnnounceList.do")
	public String toAnnounceList(HttpSession session, Model model, Announce announce, PageInfo<Announce> page) {
		if (page.getPageSize() == 0) {
			page.setPageSize(10);
			page.setPageNum(1);
		}

		List<Announce> announceList = announceService.selectAnnounce(announce, page);
		page = new PageInfo<>(announceList);
		model.addAttribute("page", page);
		model.addAttribute("announce", announce);
		model.addAttribute("announceList", announceList);
		return "/announce/announceList";
	}

	@RequestMapping(value = "/toAnnounceAdd.do")
	public String toAnnounceAdd(HttpSession session, Model model, Announce announce, PageInfo<Announce> page) {
		logger.info("去公告创建页面");
		List<Announce> announceList = announceService.selectAnnounce1(announce);
		model.addAttribute("announceList", announceList);
		model.addAttribute("Announce", announce);
		return "/announce/announceAdd";
	}

	// 公告详情页面
	@RequestMapping(value = "/toAnnounceDetail.do")
	public String toAnnounceDetail(HttpSession session, ModelMap model, @RequestParam String id) {
		logger.info("去公告详情页面");
		SessionUser sessionUser = SessionUser.get(session);
		Announce anc = announceService.selectByPrimaryKey(id);
		if (anc != null) {
			model.addAttribute("anc", anc);
		}
		
		return "/announce/announceDetail";
	}
	
	//修改页面
	@RequestMapping(value = "/toAnnounceChange.do")
	public String toAnnounceChange(HttpSession session, ModelMap model, @RequestParam String id) {
		logger.info("去修改页面");
		SessionUser sessionUser = SessionUser.get(session);
		Announce anc = announceService.selectByPrimaryKey(id);
		if (anc != null) {
			model.addAttribute("anc", anc);
		}
		return "/announce/announceChange";
	}

	// 修改状态
	@RequestMapping(value = "/changeStatus.do")
	@ResponseBody
	public String changeStatus(HttpSession session, ModelMap model, Announce announce) {
		logger.info("修改状态");
		SessionUser sessionUser = SessionUser.get(session);
		if ("1".equals(announce.getStatus())) {
			announce.setStatus("2");
		} else if ("2".equals(announce.getStatus())) {
			announce.setStatus("1");
		}
		announce.setUpdateTime(new Date());
		int count = announceService.updateStatusByPrimaryKey(announce);
		if (count == 1) {
			return "ok";
		}
		return "error";
	}

	
	@RequestMapping(value = "/announceAdd.do")
	public String announceAdd(HttpSession session, Announce announce, @RequestParam MultipartFile[] multpartfile,
			HttpServletRequest request, Model model) throws InterruptedException {
		logger.info("/announceAdd");
		//String filePath = "D://tmp//";
		ConfigService configService = new ConfigService();
		String filePath = configService.getProperty("announce.attchment.path");
		// 将录入人员加入数据库
		SessionUser sessionUser = SessionUser.get(session);
		// 判断multpartfile数组不能为空并且长度大于0
		String merAppendix = Long.toString(System.currentTimeMillis());
		String fileName="";
		if (multpartfile != null && multpartfile.length > 0) {
			// 循环获取file数组中得文件
			for (int i = 0; i < multpartfile.length; i++) {
				MultipartFile file = multpartfile[i];
				// 保存文件，将文件名存入数据库
				if(file.isEmpty()){
					merAppendix="";
				}else{
					merAppendix = filePath+saveFile(file, merAppendix,filePath);
					fileName = saveFile(file, merAppendix,filePath);
				}
				
				
			}
		}
		
		if(announce.getContent().length()>1000*1000){
			model.addAttribute("", "");
			
		}
		announce.setUpLoadPath(merAppendix);
		announce.setReleasePerson(sessionUser.getLoginName());
		announce.setStatus("1");
		announce.setFileName(fileName);
		//预处理
		Date now = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		cal.add(Calendar.DAY_OF_MONTH, announce.getExpiryDate());
		announce.setCreateTime(now);
		announce.setClosingTime(cal.getTime());
		
		int count = announceService.insertAnnounce(announce);
		
		if (count == 1) {
			 return "redirect:/announce/toAnnounceList.do";
		} else {
			return "error";
		}
	}
	
	
	@RequestMapping(value = "/announceUpdate.do")
	public String announceUpdate(HttpSession session, Announce announce, @RequestParam MultipartFile[] multpartfile,@RequestParam String id,
			HttpServletRequest request, Model model) throws InterruptedException {
		logger.info("/announceUpdate");
		//String filePath = "D://tmp//";
		ConfigService configService = new ConfigService();
		String filePath = configService.getProperty("announce.attchment.path");
		// 将录入人员加入数据库
		SessionUser sessionUser = SessionUser.get(session);
		// 判断multpartfile数组不能为空并且长度大于0
		String merAppendix = Long.toString(System.currentTimeMillis());
		String fileName="";
		if (multpartfile != null && multpartfile.length > 0) {
			// 循环获取file数组中得文件
			for (int i = 0; i < multpartfile.length; i++) {
				MultipartFile file = multpartfile[i];
				// 保存文件，将文件名存入数据库
				merAppendix = filePath+saveFile(file, merAppendix,filePath);
				fileName = saveFile(file, merAppendix,filePath);
			}
		}
		
		if(announce.getContent().length()>1000*1000){
			model.addAttribute("", "");
			
		}
		
		Announce ann=announceService.selectByPrimaryKey(id);
		//预处理
		Calendar cal = Calendar.getInstance();
		cal.setTime(ann.getCreateTime());
		cal.add(Calendar.DAY_OF_MONTH, announce.getExpiryDate());
		announce.setClosingTime(cal.getTime());
		announce.setId(id);
		int count = announceService.updateByPrimaryKey(announce);
		
		if (count == 1) {
			return "redirect:/announce/toAnnounceList.do";
		} else {
			return "error";
		}
		
	}
	
	
	
	public String saveFile(MultipartFile multpartfile,String flowNumber,String filePath) throws InterruptedException{
		// 检查路径是否存在，不存在则创建
		File file = new File(filePath);
		if (!file.exists() && !file.isDirectory()) {
			file.mkdirs();
		}
		// 文件名
		// Thread.sleep(800);
		// String time = DateUtil.getDateString("yyyyMMddHHmmssSSS");
		String targetFileName = System.nanoTime() + multpartfile.getOriginalFilename();

		File savefile = new File(new File(filePath), targetFileName);
		
		try {
			multpartfile.transferTo(savefile);
		} catch (Exception e) {
			logger.info("系统找不到指定的路径！", e);
		}
		return targetFileName;
	}
	
	
	/**
	 * 下载文件
	 * 
	 */
	@RequestMapping(value = "/download")
	@ResponseBody
	public void download(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam String id) throws IOException {
		try {
			Announce announce=announceService.selectByPrimaryKey(id);
			File file = new File(announce.getUpLoadPath());
			if (file.exists()) {
				InputStream ins = new FileInputStream(file);
				BufferedInputStream bins = new BufferedInputStream(ins);// 放到缓冲流里面
				OutputStream outs = response.getOutputStream();// 获取文件输出IO流
				BufferedOutputStream bouts = new BufferedOutputStream(outs);
				response.setContentType("application/x-download");// 设置response内容的类型
				response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(announce.getFileName(), "UTF-8"));// 设置头部信息
				int bytesRead = 0;
				byte[] buffer = new byte[8192];
				// 开始向网络传输文件流
				while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {
					bouts.write(buffer, 0, bytesRead);
				}
				bouts.flush();// 这里一定要调用flush()方法
				ins.close();
				bins.close();
				outs.close();
				bouts.close();
			} else {
				response.sendRedirect("../error.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//编辑器载入磁盘文件
	@RequestMapping(value = "/load", method = RequestMethod.GET)
	public void loadFileFromDisk(@RequestParam String fileName, HttpServletResponse response) {
		try {
			// fileName为相对路径，类似 /attached/image/20160601/XXXXX.jpg
//			ConfigService configService = new ConfigService();
//			String filePath = configService.getProperty("announce.attchment.path");

			File file = new File( fileName);
			if (file.exists()) {
				InputStream fis = new BufferedInputStream(new FileInputStream(file));
				byte[] buffer = new byte[fis.available()];
				fis.read(buffer);
				fis.close();
				response.reset();
				OutputStream os = new BufferedOutputStream(response.getOutputStream());
				os.write(buffer);
				os.flush();
				os.close();
			}
		} catch (IOException e) {
			logger.info("磁盘读取文件异常！", e);
		}
	}

	
	/**
	 * edit load
	 * manage Files upload from kindeditor
	 */
	@RequestMapping(value = "/manage",method=RequestMethod.POST)
	public void manageFiles(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		try {
		PrintWriter out=response.getWriter();
		ConfigService configService = new ConfigService();
		String filePath = configService.getProperty("announce.attchment.path");
		
		//根目录路径，可以指定绝对路径，比如 /var/www/attached/
		String rootPath = filePath + "attached/";
		//根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
		String rootUrl  = filePath + "attached/";
		//图片扩展名
		String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

		String dirName = request.getParameter("dir");
		if (dirName != null) {
			if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
				out.println("Invalid Directory name.");
				return;
			}
			rootPath += dirName + "/";
			rootUrl += dirName + "/";
			File saveDirFile = new File(rootPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		//根据path参数，设置各路径和URL
		String path = request.getParameter("path") != null ? request.getParameter("path") : "";
		String currentPath = rootPath + path;
		String currentUrl = rootUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}

		//排序形式，name or size or type
		String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

		//不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			out.println("Access is not allowed.");
			return;
		}
		//最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			out.println("Parameter is not valid.");
			return;
		}
		//目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if(!currentPathFile.isDirectory()){
			out.println("Directory does not exist.");
			return;
		}

		//遍历目录取的文件信息
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		if(currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if(file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if(file.isFile()){
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		JSONObject result = new JSONObject();
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);

		response.setContentType("application/json; charset=UTF-8");
		out.println(result.toJSONString());
		}catch(IOException e){
			logger.info("磁盘读取文件异常！", e);
		}
	}
	
	
	/**
	 * 编辑器上传文件
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void uploadFile(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		try {
			// 文件保存目录路径
			ConfigService configService = new ConfigService();
			String filePath = configService.getProperty("announce.attchment.path");

			// 文件保存目录路径
			String savePath = filePath + "attached/";
			
			PrintWriter out = response.getWriter();
			// 定义允许上传的文件扩展名
			HashMap<String, String> extMap = new HashMap<String, String>();
			extMap.put("image", "gif,jpg,jpeg,png,bmp");
			extMap.put("flash", "swf,flv");
			extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
			extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

			// 最大文件大小
			long maxSize = 1024*1024*100;

			response.setContentType("text/html; charset=UTF-8");

			if (!ServletFileUpload.isMultipartContent(request)) {
				out.println(getError("请选择文件。"));
			}
			// 检查目录
			File uploadDir = new File(savePath);
			
			if (!uploadDir.exists() && !uploadDir.isDirectory()) {
				uploadDir.mkdirs();
			}
			
			if (!uploadDir.isDirectory()) {
				out.println(getError("上传目录不存在。"));
			}
			// 检查目录写权限
			if (!uploadDir.canWrite()) {
				out.println(getError("上传目录没有写权限。"));
			}

			String dirName = request.getParameter("dir");
			if (dirName == null) {
				dirName = "image";
			}
			if (!extMap.containsKey(dirName)) {
				out.println(getError("目录名不正确。"));
			}
			// 创建文件夹
			savePath += dirName + "/";
			File saveDirFile = new File(savePath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
		
			DefaultMultipartHttpServletRequest mrequest= (DefaultMultipartHttpServletRequest)request;
			Map map=mrequest.getFileMap();
			Collection<MultipartFile> c = map.values();
			Iterator it = c.iterator();
			for (; it.hasNext();) {
				 CommonsMultipartFile file=(CommonsMultipartFile) it.next();
				 if(!file.isEmpty())
				 {
				  long fileSize = file.getSize();
				  String fileName = file.getOriginalFilename();
				  String contentType=file.getContentType();
				  String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				     
				  if(fileSize > maxSize){
				   out.println(getError("上传文件大小超过限制100M。"));
				   return;
				  }
				  if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
				   out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
				   return;
				  }
				  
				     FileItem item = null;
				     SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				  String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				  
				  try{
				   File uploadedFile = new File(savePath, newFileName);
				   file.transferTo(uploadedFile);  
				  }catch(Exception e){
				    
				   out.println(getError("上传文件失败。"));
				   return;
				  }
				  
				  JSONObject obj = new JSONObject();
				  obj.put("error", 0);
				  obj.put("url", request.getContextPath()+"/announce/load.do?fileName="+savePath + newFileName);
				  obj.put("title", fileName);
				  logger.info(fileName);
				  out.println(obj.toJSONString());

			}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

	
	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}

}


class NameComparator implements Comparator {
	public int compare(Object a, Object b) {
		Hashtable hashA = (Hashtable)a;
		Hashtable hashB = (Hashtable)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
		}
	}
}

class SizeComparator implements Comparator {
	public int compare(Object a, Object b) {
		Hashtable hashA = (Hashtable)a;
		Hashtable hashB = (Hashtable)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
				return 1;
			} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
				return -1;
			} else {
				return 0;
			}
		}
	}
}

class TypeComparator implements Comparator {
	public int compare(Object a, Object b) {
		Hashtable hashA = (Hashtable)a;
		Hashtable hashB = (Hashtable)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
		}
	}
}
