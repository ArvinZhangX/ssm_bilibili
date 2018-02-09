package com.sf.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;





/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {


	
	private static final long serialVersionUID = 1L;

	
	 // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 30;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 400; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 500; // 50MB
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		String userName=(String) request.getSession().getAttribute("userName");//得到当前登录用户的用户名
		/*		UserListService sevice=new UserListServiceImpl();
				userEntity user=sevice.userlist(userName);
				System.out.println(user.getUserHand());
				
		 */
		
		// 检测是否为多媒体上传
				if (!ServletFileUpload.isMultipartContent(request)) {
				    // 如果不是则停止
				    PrintWriter writer = response.getWriter();
				    writer.println("Error: 表单必须包含 enctype=multipart/form-data");
				    writer.flush();
				    return;
				}
		 
		        // 配置上传参数
		        DiskFileItemFactory factory = new DiskFileItemFactory();
		        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		        factory.setSizeThreshold(MEMORY_THRESHOLD);
		        // 设置临时存储目录
		        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		 
		        ServletFileUpload upload = new ServletFileUpload(factory);
		         
		        // 设置最大文件上传值
		        upload.setFileSizeMax(MAX_FILE_SIZE);
		         
		        // 设置最大请求值 (包含文件和表单数据)
		        upload.setSizeMax(MAX_REQUEST_SIZE);
		           
		        // 构造临时路径来存储上传的文件
		        // 这个路径相对当前应用的目录
		        //	图片路径存放到 服务器 webapp下面
		        String path="X:/Users/F-she-father/Workspaces/Eclipse IDE/bilibili/src/main/webapp";

		        String dizhi=	File.separator + UPLOAD_DIRECTORY;
		        dizhi =  dizhi.replace("\\","/");
		        
		        String path3="/static/userHand_Top" + dizhi;
		        
               /* System.out.println("**************************");
                System.out.println(path3);*/
	
		        
		        String uploadPath =path	+ path3;
		        //uploadPath 这个路径是存放到数据库里面的
		        
		        // 如果目录不存在则创建
		        File uploadDir = new File(uploadPath);
		        if (!uploadDir.exists()) { 
		            uploadDir.mkdir();
		        }
		 
		        try {
		            // 解析请求的内容提取文件数据
		            @SuppressWarnings("unchecked")
		            List<FileItem> formItems = upload.parseRequest(request);
		 
		            if (formItems != null && formItems.size() > 0) {
		                // 迭代表单数据
		                for (FileItem item : formItems) {
		                	//创建进度条DTO
		                	ProDto dto=new ProDto();
		                	//把dto放入到session
		                	request.getSession().setAttribute("dto",dto);
		                    // 处理不在表单中的字段
		                    if (!item.isFormField()) {
		                    	//得到上传文件的名字
		                        String fileName = new File(item.getName()).getName();
		                      //  System.out.println(fileName);
		                        String reg = "[\u4e00-\u9fa5]";  
		                        Pattern pat = Pattern.compile(reg);    
		                        Matcher mat = pat.matcher(fileName);   
		                        fileName = mat.replaceAll("");
		                        
		                        
		                        String filePath = uploadPath + File.separator + fileName;
		                        		filePath	=   filePath.replace("\\","/");
		                        		
		                        String fuckyou=path3+"/"+fileName;
		            	        //用户上传图片的地址保存的数据库
		                       // System.out.println(fuckyou);
		                        
		                        /*System.out.println(fuckyou);
		                        System.out.println("**************************");
		                        */
		                        
		                        
		                        request.getSession().setAttribute("fuckyou", fuckyou);
		        		        
		                        File storeFile = new File(filePath);
		                        // 在控制台输出文件的上传路径
		                       // System.out.println(filePath);
		                       //得到输入流
		                       InputStream in= item.getInputStream();
		                       //得到文件的输出流
		                       OutputStream out=new FileOutputStream(storeFile);
		                       //文件总大小
		                       long max=item.getSize();
		                       //剩余大小
		                       long other=max;
		                       int len=0;//读取写入长度
		                       //读写缓冲
		                       byte[] b=new byte[300];
		                       //给DTO设置
		                	   dto.setFileName("fileName");
		                	   dto.setMax(max);
		                       //循环从输入流写入到输出流,结束循环是len==-1
		                       while((len=in.read(b))!=-1){
		                    	   out.write(b,0,len);
		                    	   other-=len;
		                    	   //给DTO设置other
		                    	   dto.setOther(other);
		                    	 //  System.out.println("总大小="+max+"剩余大小="+other);
		                    	   //z总  max
		                    	   //剩余 other
		                    	   //传了 max-other
		                    	   float zong =(float) (Integer.parseInt(String.valueOf(max)));
									int shengxia = Integer.parseInt(String.valueOf(other));
									float ii3=(float)zong-shengxia;//传了多少
									if(shengxia!=0){
										//System.out.println();
									int t=(int)((ii3/zong)*100);
									//System.out.println(t+"%");
									dto.setTest(t);
									
									//System.out.println(dto.getTest());
								}
		                    	   
		                    	   
		                       }
		                       dto.setEndTag(1);//添加结束标记
		                       out.flush();
		                       out.close();
		                       in.close();
		                       
		                        // 保存文件到硬盘
		                        //item.write(storeFile);
		                        request.setAttribute("message",
		                            "文件上传成功!");
		                        
		                        
		                    }else{
		                    	String f=	item.getFieldName();
		                    	String v=item.getString("UTF-8");
		                    	
		                    }
		                }
		            }
		        } catch (Exception ex) {
//		            request.setAttribute("message",
//		                    "错误信息: " + ex.getMessage());
		        	ex.printStackTrace();
		        }
		        // 跳转
		        getServletContext().getRequestDispatcher("/userHand.sf").forward(
		                request, response);
		    }
	}


