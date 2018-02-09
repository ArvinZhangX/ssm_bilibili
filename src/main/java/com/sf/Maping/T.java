package com.sf.Maping;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sf.chaxun.Callingmethod;
import com.sf.chaxun.TestMain;
import com.sf.entity.ShoppingCart;
import com.sf.entity.forumEntity;
import com.sf.entity.forumreplyEntity;
import com.sf.entity.gridsEntity;
import com.sf.entity.messageEntity;
import com.sf.entity.ordertableEntity;
import com.sf.entity.userEntity;
import com.sf.entity.videoEntity;
import com.sf.entity.videoTopEntity;
import com.sf.jingtai.JspToHtml;
import com.sf.lanjieqi.Auth;
import com.sf.service.MessageService;
import com.sf.service.UserListService;
import com.sf.service.impl.Addserviceimpl;
import com.sf.service.impl.LoginServiceImpl;
import com.sf.service.impl.MessageServiceImpl;
import com.sf.service.impl.Update_login_password_Service_Impl;
import com.sf.service.impl.UserListServiceImpl;
import com.sf.tool.GetDataTime;
import com.sf.tool.GetUUID;

@Controller
public class T {

	@Autowired
	Addserviceimpl addserviceimpl;

	@Autowired
	UserListService userListService;

	@Autowired
	MessageServiceImpl messageServiceImpl;
	
	@PostConstruct
    public void init(){
        System.out.println("我只会被调用一次");
       // new JspToHtml().main(null);//这个是静态页面
        TestMain sf = new TestMain();
        sf.main(null);
       //int num = Callingmethod.count;
       
    }
	
	
	@RequestMapping("index.sf")
	public String test() {
		return "forward:/logoone.sf";
		
	    //return "redirect:/abc/default.html";  //跳转  
	    //return "forward:/abc/default.html";   //前进  
	}
	
	

	// 将数据库里面所有的视频查询出来 发送到首页面
	@RequestMapping("logoone.sf")
	public ModelAndView logoone(HttpServletRequest request,HttpServletResponse response) {
		
		List<videoEntity> list = userListServiceImpl.videolist("1");// 1 为动画mad
		Map model = new HashMap();
		model.put("list", list);
		List<videoEntity> list2 = userListServiceImpl.videolist("2");// 2
		model.put("list2", list2);
		List<videoEntity> list3 = userListServiceImpl.videolist("3");// 3
		model.put("list3", list3);
		// 随机查6条数据出来
		List<videoEntity> fuck = userListServiceImpl.videolistimit6MAD();
		model.put("fuck", fuck);
		/*
		 * List<videoEntity> test = userListServiceImpl.videolistimit5();
		 * for(videoEntity ts:test){ System.out.println("测试是否查询出来");
		 * System.out.println(ts.getVideoName());
		 * System.out.println(ts.getVideoTime()); } 可以查询出这么多条记录
		 */
		/* System.out.println("测试"); */
/*		
		try {
			request.getRequestDispatcher("/static/adminjs/index.html").forward(request,response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		return new ModelAndView("index", model);

	}

	// AJAX 提交
	@RequestMapping(value = "ajaxTuiJian", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void ajaxTuiJian(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<videoEntity> list = userListServiceImpl.videolistimit7();
		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(list);
		out.write(sbb);
	}

	// AJAX 提交
	@RequestMapping(value = "ajaxTuiJian2", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void webajax2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<videoEntity> list = userListServiceImpl.videolistimit5MAD();

		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(list);
		out.write(sbb);
	}
	// querendingdan.sf

	@RequestMapping(value = "querendingdan1.sf", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void querendingdan(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String userName = (String) request.getSession().getAttribute("userName");
		List<userEntity> user = userListServiceImpl.userlistUserName(userName);
		// user.getUserID();
		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(user);
		out.write(sbb);
	}

	@RequestMapping(value = "testsf.sf", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String testsf(HttpServletResponse res) {
		boolean bl = addserviceimpl.login();
		if (bl) {
			System.out.println("成功");
		} else {
			System.out.println("失败");
		}

		return "shouye";

	}

	@RequestMapping("zhuce.sf")
	public String zhuce(HttpServletRequest request) {
		// 随机生成一个4位数验证码
		int num = GetUUID.yanzma();
		// 将int 转换为 String
		String yanzheng = "";
		yanzheng = String.valueOf(num);
		// 将验证码放入到session里面....暂时想不到其他办法
		request.getSession().setAttribute("yanzhengma", yanzheng);
		return "zhuce";

	}

	@Auth(validate = false)
	@RequestMapping("login.sf")
	public String login() {
		return "loginnew";

	}

	// 修改支付密码界面
	@RequestMapping("Tiaozhuanshouye.sf")
	public String Tiaozhuanshouye() {

		return "shouye";

	}

	// 信息修改界面
	@RequestMapping("User_full_information.sf")
	public ModelAndView User_full_information(HttpServletRequest request) {

		// 得到登录用户的名字
		String userName = (String) request.getSession().getAttribute("userName");
		userEntity user = userListServiceImpl.userlist(userName);
		Map model = new HashMap();

		model.put("user", user);// userlist是个Arraylist之类的
		// System.out.println(user.getUserRMB());

		// return "User_full_information";
		return new ModelAndView("User_full_information", model);

	}

	@Autowired
	Update_login_password_Service_Impl update_login_password_Service_Impl;

	// 修改登录密码界面
	@RequestMapping("Update_login_password.sf")
	public String Update_login_password(String passWord, String newpassWord, String newpassWord2,
			HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("userName");
		if (passWord != null || newpassWord != null || newpassWord2 != null) {
			if (newpassWord.equals(newpassWord2)) {
				boolean bl = update_login_password_Service_Impl.Update_login_password(userName, passWord, newpassWord);
				if (bl) {
					return "User_full_information";
				} else {
					request.setAttribute("PassWordErro", "对不起,旧密码输入有误!");
				}
			} else {
				request.setAttribute("PassWordErro", "两次密码输入有误!");
			}
		}
		return "Update_login_password";

	}

	// 修改邮箱界面
	@RequestMapping("Update_email.sf")
	public String Update_email(HttpServletRequest request, String emial, String newemial) {
		String userName = (String) request.getSession().getAttribute("userName");
		if (userName != null || emial != null || newemial != null) {
			boolean bl = update_login_password_Service_Impl.Update_login_Emial(userName, emial, newemial);
			if (bl) {
				return "User_full_information";
			} else {
				request.setAttribute("PassWordErro2", "对不起,原邮箱输入错误!");
			}
		} else {
			request.setAttribute("PassWordErro", "输入不能为空!");
		}

		return "Update_email";

	}

	// 修改手机界面
	@RequestMapping("Update_Phone.sf")
	public String Update_Phone(HttpServletRequest request, String userPhone, String newuserPhone) {
		// 得到session里面的用户名
		String userName = (String) request.getSession().getAttribute("userName");
		if (userName != null || userPhone != null || newuserPhone != null) {
			boolean bl = update_login_password_Service_Impl.Update_login_Phone(userName, userPhone, newuserPhone);
			if (bl) {
				return "User_full_information";
			} else {
				request.setAttribute("PassWordErro3", "对不起,原手机号码错误!");
			}
		} else {
			request.setAttribute("PassWordErro3", "输入不能为空!");
		}
		return "Update_Phone";// User_full_information.sf

	}

	// 修改支付密码界面
	@RequestMapping("Update_PayPassword.sf")
	public String Update_PayPassword(String paypassword, String newpaypassword, String newpaypassword2,
			HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("userName");
		if (paypassword != null || newpaypassword != null || newpaypassword2 != null) {
			if (newpaypassword.equals(newpaypassword2)) {
				boolean bl = update_login_password_Service_Impl.Update_login_payPassword(userName, paypassword,
						newpaypassword);
				if (bl) {
					return "User_full_information";
				} else {
					request.setAttribute("PassWordErro5", "对不起,旧密码输入有误!");
				}
			} else {
				request.setAttribute("PassWordErro5", "两次密码输入有误!");
			}
		}
		return "Update_PayPassword";

	}

	@Autowired
	UserListServiceImpl userListServiceImpl;

	// 用户查看所有信息界面
	@RequestMapping("Information.sf")
	public ModelAndView Information(HttpServletRequest request) {
		// 得到登录用户的名字
		String userName = (String) request.getSession().getAttribute("userName");
		userEntity user = userListServiceImpl.userlist(userName);
		Map model = new HashMap();

		model.put("user", user);// userlist是个Arraylist之类的

		return new ModelAndView("Information", model);

	}

	// 用户银行卡界面
	@RequestMapping("Bank_Card.sf")
	public String Bank_Card() {
		// System.out.println("测试是否进入此方法");
		return "Bank_Card";

	}

	// 收货地址jsp界面
	@RequestMapping("Delivery_address.sf")
	public String Delivery_address() {
		// System.out.println("测试是否进入此方法");

		return "Delivery_address";

	}

	// String usermingzi,String userPhone,String userAddress
	// 修改收货地址
	@RequestMapping("updateDelivery_address.sf")
	public String updateDelivery_address(String usermingzi, String userPhone, String userAddress,
			HttpServletRequest request) {
		/*
		 * System.out.println(usermingzi); System.out.println(userPhone);
		 * System.out.println(userAddress);
		 */
		String sessionName = (String) request.getSession().getAttribute("userName");
		boolean bl = update_login_password_Service_Impl.Update_Addred(sessionName, userAddress, usermingzi, userPhone);
		String tishi = "";
		if (bl) {
			tishi = "修改成功";
			request.setAttribute("tishi", tishi);
		} else {
			tishi = "修改失败...请检查是否输入正确";
			request.setAttribute("tishi", tishi);
		}
		return "Delivery_address";

	}

	@RequestMapping("userHand.sf")
	public String userHand(HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("userName");
		String path2 = (String) request.getSession().getAttribute("fuckyou");
		userEntity user = userListServiceImpl.userlist(userName);

		// System.out.println(user.getUserHand());
		String userHand = user.getUserHand();
		String newuserHand = path2;

		// System.out.println(userName+newuserHand);

		boolean bl = update_login_password_Service_Impl.Update_login_hand(userName, userHand, newuserHand);

		if (bl) {
			System.out.println("成功");
		} else {
			System.out.println("失败");
		}
		return "User_full_information";

	}

	@RequestMapping("video.sf")
	public ModelAndView video(String dizhi, HttpServletRequest request, String shipingID) {
		/*
		 * System.out.println(dizhi);
		 * System.out.println("===============================");
		 */
		// 获得地址
		request.setAttribute("dizhi", dizhi);

		// System.out.println("===============================");
		Map model = new HashMap();

		// System.out.println(shipingID);//拿到视频地址
		request.setAttribute("shipingID", shipingID);
		// 根据视频ID查询出 此视频的所有留言
		List<messageEntity> messagelist = userListService.messagelist(shipingID);
		
		for (messageEntity message : messagelist) {
			message.getMessageuserName();// 得到用户名
			// 根据每个用户名查询出每个用户对应的头像地址
			// userEntity userent =
			// userListService.userlist(message.getMessageuserName());
			// System.out.println(userent.getUserName());
			// model.put("userent",userent);//userlist是个Arraylist之类的
			model.put("messagelist", messagelist);// userlist是个Arraylist之类的
		}

		return new ModelAndView("Video", model);

		// return "Video";

	}

	@Autowired
	MessageService messageService;

	// 留言- - 测试
	@RequestMapping("test.sf")
	public String Test() {

		messageEntity user = new messageEntity();
		user.setMessage("1");
		user.setMessageID("1");
		user.setMessageTime("1");
		user.setMessageuserID("1");
		user.setMessageuserName("1");
		user.setMessagevideoID("1");

		boolean bl = messageService.message(user);
		if (bl) {
			System.out.println("可以使用留言");
		} else {
			System.out.println("不可以使用留言");
		}
		return "";

	}

	// 留言- - 测试
	/*
	 * @RequestMapping("test2.sf") public String Test2() { List<messageEntity>
	 * list=userListService.messagelist("11"); for(messageEntity li:list){
	 * System.out.println(li.getMessageuserName()); } return "";
	 * 
	 * }
	 */

	// 切换账号
	@RequestMapping("exect.sf")
	public String exect(HttpServletRequest request) {

		// System.out.println("切换账号");
		// 将session里面的用户信息全部清空
		request.getSession().removeAttribute("userName");
		return "loginnew";

	}

	@RequestMapping("Houtai.sf")
	public ModelAndView Houtai(HttpServletRequest request) {
		// 设置一个默认从第一条开始查询 只查询出15条记录
		String pageInt = "0";
		int test = Integer.valueOf(pageInt).intValue();
		List<userEntity> list = userListServiceImpl.userlistpage(test);

		/*
		 * for(userEntity lis:list){ System.out.println(lis.getUserName()); }
		 */

		Map model = new HashMap();
		model.put("list", list);

		return new ModelAndView("Houtai", model);

	}

	// AJAX 提交 根据用户名查询
	@RequestMapping(value = "userchaxunmessage1", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void userchaxunmessage1(HttpServletRequest request, HttpServletResponse response,
			String message) throws IOException {
		String shuaige = message;
		// 得到内容 ajax提交进来
		List<userEntity> list = userListServiceImpl.listmohu("%" + shuaige + "%");

		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(list);
		if (list.size() == 0) {
			sbb = "0";
		}
		out.write(sbb);
	}

	// AJAX 提交 根据用户名查询
	@RequestMapping(value = "userchaxunmessage2", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void userchaxunmessage2(HttpServletRequest request, HttpServletResponse response,
			String message) throws IOException {
		String shuaige = message;
		// 得到内容 ajax提交进来
		List<userEntity> list = userListServiceImpl.userPhone("%" + shuaige + "%");

		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(list);
		if (list.size() == 0) {
			sbb = "0";
		}
		out.write(sbb);
	}

	// AJAX 提交 根据ID查询
	@RequestMapping(value = "userID.sf", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void userID(HttpServletRequest request, HttpServletResponse response, String userID)
			throws IOException {
		// 得到内容 ajax提交进来
		List<userEntity> list = userListServiceImpl.userID(userID);

		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(list);
		if (list.size() == 0) {
			sbb = "0";
		}
		out.write(sbb);
	}
	// AJAX 提交 修改用户数据

	@RequestMapping("updateuser.sf")
	public String updateuser(String userID, String userName, String userzhenshiName, String userSex, String passWord,
			String addr, String userPhone, String userQQ, String userEmial, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String echo = "";
		// 得到内容 ajax提交进来
		/*
		 * System.out.println(userID); System.out.println(userName);
		 * System.out.println(userzhenshiName); System.out.println(userSex);
		 * System.out.println(passWord); System.out.println(addr);
		 * System.out.println(userPhone); System.out.println(userQQ);
		 */

		// update user set userName = "admin" ,
		// userMingzi = "佘峰T" ,usersex = "男" ,
		// passWord = "123321aaa" , userAddress = "四川省遂宁" ,
		// userPhone = "17583108191" , userQQ = "794799102" ,
		// userEmial = "794799102@qq.com" where
		// userID = "004bcfc8d4bd407bb1a114785539006f"

		userEntity user = new userEntity();
		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		user.setUserName(userName);
		user.setUserMingzi(userzhenshiName);
		user.setUsersex(userSex);
		user.setPassWord(passWord);
		user.setUserAddress(addr);
		user.setUserPhone(userPhone);
		user.setUserQQ(userQQ);
		user.setUserEmial(userEmial);
		user.setUserID(userID);
		boolean bl = update_login_password_Service_Impl.Update_user(user);
		if (bl) {
			echo = "修改成功";
			System.out.println("成功");
		} else {
			echo = "修改失败,请联系管理员";
		}
		request.setAttribute("echo", echo);
		return "forward:/Houtai.sf";

	}

	// 跳转到小黑屋界面.... 测试
	@RequestMapping("xiaoheiwu.sf")
	public ModelAndView xiaoheiwu(HttpServletRequest request) {
		// 将用户表里面被拉黑的用户全部查询出来
		List<userEntity> user = userListServiceImpl.xiaoheiwu("异常");
		Map model = new HashMap();
		model.put("user", user);
		return new ModelAndView("xiaoheiwu", model);

	}

	// 将数据库里面所有的视频查询出来 发送到首页面
	@RequestMapping("testshabi.sf")
	public String testshabi(HttpServletRequest request) {

		/*
		 * dangqianye= "0"; int dangqianye2 = Integer.parseInt(dangqianye);
		 * List<videoEntity> list=userListServiceImpl.Pagevideolist("1",
		 * dangqianye2); Map model =new HashMap(); model.put("list", list);
		 */
		// request.setAttribute("test", "测试");
		int tag1 = userListServiceImpl.videocoun("1");
		// System.out.println("视频一共有"+tag1);
		request.setAttribute("tag1", tag1);

		int tag4 = 12;
		// 每页显示多少
		request.setAttribute("tag4", tag4);

		return "DisplayVideo";

	}

	// AJAX 提交
	@RequestMapping(value = "ajaxtijiao1.sf", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void ajaxtijiao(HttpServletRequest request, HttpServletResponse response, String State,
			String dangqianye, int meiyexianshiduoshaoge) throws IOException {
		/* List<videoEntity> list = userListServiceImpl.videolistimit5(); */
		int dangqianye2 = Integer.parseInt(dangqianye);
		List<videoEntity> list = userListServiceImpl.Pagevideolist(State, dangqianye2, meiyexianshiduoshaoge);// State
																												// 标记

		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(list);
		out.write(sbb);
	}

	// AJAX 提交
	@RequestMapping(value = "gouwuchet.sf", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void gouwuche(HttpServletRequest request, HttpServletResponse response, String userName,
			String girdsName, String girdsimg, String girdsjiage, String girdsID) throws IOException {
		/*
		 * System.out.println(girdsID);System.out.println(userName);System.out.
		 * println(girdsName);System.out.println(girdsimg);System.out.println(
		 * girdsjiage);
		 */
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setCartID(GetUUID.getUUID());
		shoppingCart.setShoopingID(girdsID);
		shoppingCart.setShoopingImg(girdsimg);
		shoppingCart.setShoopingjiage(girdsjiage);
		shoppingCart.setShoopingName(girdsName);
		shoppingCart.setUserName(userName);
		boolean bl = messageServiceImpl.Shoppingcart(shoppingCart);

		String list = "";
		if (bl) {
			list = "添加成功";
		} else {
			list = "添加失败";
		}

		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(list);
		out.write(sbb);
	}

	// 商品详情页面 请求
	@RequestMapping("gridspay.sf")
	public String gridspay(HttpServletRequest request, String girdsID) {
		gridsEntity gridslist = userListServiceImpl.gridsIDlist(girdsID);
		request.setAttribute("gridslist", gridslist);

		return "gridspay";

	}

	// 确认订单界面
	// Confirmorder.jsp
	@RequestMapping("Confirmorder.sf")
	public String Confirmorder(HttpServletRequest request, String girdsID, String gridsName, int gridskucun,
			String gridsjiage, String gridsimg) {
		// 乱码问题
		try {
			gridsName = new String(gridsName.getBytes("ISO-8859-1"), "utf-8");

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("Confirmorder.sf" + "这里的乱码解决失败");
		}

		gridsEntity grids = new gridsEntity();
		grids.setGridsID(girdsID);
		grids.setGirdsimg(gridsimg);
		grids.setGirdsjiage(gridsjiage);
		grids.setGirdsName(gridsName);
		grids.setGirdskucun(gridskucun);
		// System.out.println(grids.getGirdsName());

		request.setAttribute("grids", grids);

		return "Confirmorder";
	}

	@RequestMapping("gouwuche.sf")
	public String gouwuche(HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("userName");
		List<ShoppingCart> user = userListServiceImpl.shoppingcart(userName);

		request.setAttribute("user", user);
		return "gouwuche";

	}

	// AJAX 提交
	@RequestMapping(value = "delectgouwuche.sf", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String delectgouwuche(HttpServletRequest request, HttpServletResponse response, String cartID)
			throws IOException {
		// System.out.println(cartID);
		boolean bl = update_login_password_Service_Impl.delectcartID(cartID);
		String tishi = "";
		if (bl) {
			// System.out.println("删除成功");
			tishi = "删除成功";
			request.setAttribute("tishi", tishi);
		} else {
			// System.out.println("删除失败");
			tishi = "已经删除,查找不到此商品";
			request.setAttribute("tishi", tishi);
		}
		return "forward:/gouwuche.sf";

	}

	@RequestMapping("Shopping.sf")
	public ModelAndView Shopping(HttpServletRequest request) {
		List<gridsEntity> gridslist = userListServiceImpl.gridslist();

		Map model = new HashMap();
		model.put("gridslist", gridslist);

		return new ModelAndView("Shoppingnew", model);

	}

	@RequestMapping("Order.sf")
	public ModelAndView Order(HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("userName");
		// 根据名字查询出所有的订单
		List<ordertableEntity> ordertable = userListServiceImpl.ordertable(userName);

		Map model = new HashMap();
		model.put("ordertable", ordertable);

		return new ModelAndView("Order", model);

	}

	// 全部订单
	@RequestMapping("Adminbackgroundshipment")
	public ModelAndView admin(HttpServletRequest request) {
		List<ordertableEntity> ordertable = userListServiceImpl.ordertablelist();
		Map model = new HashMap();
		model.put("ordertable", ordertable);
		return new ModelAndView("Adminbackgroundshipment", model);
	}

	// 待发货
	@RequestMapping("Shipmentpending")
	public ModelAndView Shipmentpending(HttpServletRequest request) {
		List<ordertableEntity> ordertable = userListServiceImpl.orderStat("1");
		Map model = new HashMap();
		model.put("ordertable", ordertable);
		return new ModelAndView("Shipmentpending", model);
	}

	// 已完成订单
	@RequestMapping("Completedorder")
	public ModelAndView Completedorder(HttpServletRequest request) {
		List<ordertableEntity> ordertable = userListServiceImpl.orderStat("4");
		Map model = new HashMap();
		model.put("ordertable", ordertable);
		return new ModelAndView("Completedorder", model);
	}

	// 待会退的
	@RequestMapping("Returngoods")
	public ModelAndView Returngoods(HttpServletRequest request) {
		List<ordertableEntity> ordertable = userListServiceImpl.orderStat("3");
		Map model = new HashMap();
		model.put("ordertable", ordertable);
		return new ModelAndView("Returngoods", model);
	}

	@RequestMapping("DeletOrder")
	public ModelAndView DeletOrder(HttpServletRequest request) {
		List<ordertableEntity> ordertable = userListServiceImpl.orderStat("5");
		Map model = new HashMap();
		model.put("ordertable", ordertable);
		return new ModelAndView("DeletOrder", model);
	}

	// 跳转到查询界面
	@RequestMapping("Inquiryorder")
	public String Inquiryorder(HttpServletRequest request) {

		return "Inquiryorder";
	}

	// AJAX 查询用户订单
	@RequestMapping(value = "AJAXinquiryorder", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void AJAXinquiryorder(HttpServletRequest request, HttpServletResponse response, String val)
			throws IOException {
		// 根据用户名查询出此用户下单 String val//这个为用户名
		List<ordertableEntity> ordertable = userListServiceImpl.ordertable(val);
		// user.getUserID();
		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(ordertable);
		out.write(sbb);
	}

	public static int a = 0;

	// 查询出订单表一共多少条记录
	@RequestMapping(value = "countordertable", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void countordertable(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String tishi = "";
		// 根据用户名查询出此用户下单 String val//这个为用户名
		int ordertable = userListServiceImpl.countordertable();

		if (a == ordertable) {
			tishi = "无新订单";
		} else {
			a = ordertable;
			tishi = "新订单";
		}
		// 设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String sbb = gson.toJson(tishi);
		out.write(sbb);
	}

	@RequestMapping("AdminBL")
	public String AdminBL(HttpServletRequest request) {

		return "AdminBL";

	}

	/************************ 文件上传 ****************************************/
	@RequestMapping("videoFileTop")
	public String videoFileTop(HttpServletRequest request) {

		return "videoFileTop";

	}

	/***
	 * 保存文件
	 * 
	 * @param file
	 * @return
	 */
	private boolean saveFile(MultipartFile file) {

		return false;
	}

	@RequestMapping("videoFileTop.sf")
	public String videoFileTop(@RequestParam("files") MultipartFile[] files, HttpServletRequest request, String biaoti,
			String Fruit) {
		System.out.println("用户输入的标题为:" + biaoti + Fruit);
		if (files != null && files.length > 0) {
			// 循环获取file数组中得文件
			for (int i = 0; i < files.length; i++) {
				MultipartFile file = files[i];
				// 保存文件
				System.out.println("正在调用保存方法");
				// saveFile(file);
				// 判断文件是否为空
				if (!file.isEmpty()) {
					try {

						// new 出一个实体
						videoTopEntity video = new videoTopEntity();
						// 放入session中
						request.getSession().setAttribute("video", video);// 放入到session中

						System.out.println("文件总大小" + file.getSize());
						// 文件保存路径
						String filePath = "C:/videotest/" + file.getOriginalFilename();
						System.out.println(filePath);
						/******************** 测试 **************************/
						File storeFile = new File(filePath);
						// 得到输入流
						InputStream in = file.getInputStream();
						// 得到文件的输出流
						OutputStream out = new FileOutputStream(storeFile);
						// 文件总大小
						long max = file.getSize();
						video.setFileSize(max);
						video.setFilename(file.getOriginalFilename());
						// 剩余大小
						long other = max;
						int len = 0;// 读取写入长度
						// 读写缓冲
						byte[] b = new byte[300];
						// 循环从输入流写入到输出流,结束循环是len==-1
						while ((len = in.read(b)) != -1) {
							out.write(b, 0, len);
							other -= len;
							video.setFileSY(other);
							// System.out.println("剩余大小:"+other);
							// 给DTO设置other
							// dto.setOther(other);
							// System.out.println("总大小="+max+"剩余大小="+other);
							// z总 max
							// 剩余 other
							// 传了 max-other
							float zong = (float) (Integer.parseInt(String.valueOf(max)));
							int shengxia = Integer.parseInt(String.valueOf(other));
							float ii3 = (float) zong - shengxia;// 传了多少
							if (shengxia != 0) {
								int baifenbi = (int) ((ii3 / zong) * 100);
								video.setBaifenbi(baifenbi);
								// request.getSession().setAttribute("baifenbi",
								// baifenbi);
								// sSystem.out.println(baifenbi);
							}
						}
						out.flush();// 刷新
						out.close();// 关闭
						in.close();// 关闭
						video.setTag(1);// 标记为1的时候表示上传成功
						System.out.println("上传成功");
						// 开始存储数据库 - - 这个好像好麻烦的说

					} catch (Exception e) {
						e.printStackTrace();
					}
					/*************************
					 * 我尼玛!这里
					 *********************************/

				}
			}
		}
		System.out.println("上传结束");

		return "videoFileTop";

	}

	/************************* 这里写个百分比的AJAX *******************************/
	@RequestMapping(value = "baifenbiAJAX", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void baifenbiAJAX(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (request.getSession().getAttribute("video") == null) {
			// new 出一个实体
			videoTopEntity video = new videoTopEntity();
			video.setBaifenbi(0);
			video.setFilename("请稍后..");
			video.setFileSize(0);
			video.setFileSY(0);
			video.setTag(0);
			// 放入session中
			request.getSession().setAttribute("video", video);// 放入到session中

			// - -想不到办法....就先让线程休息3秒在往下跑吧
			/*
			 * try { Thread.sleep(3000); } catch (InterruptedException e) {
			 * System.out.println("线程休息出错"); e.printStackTrace(); }
			 */
		} else {
			videoTopEntity video = (videoTopEntity) request.getSession().getAttribute("video");
			// 设置编码
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String sbb = gson.toJson(video);
			out.write(sbb);
		}

	}

	

/*	// 全部订单
	@RequestMapping("Adminbackgroundshipment")
	public ModelAndView admin(HttpServletRequest request) {
		List<ordertableEntity> ordertable = userListServiceImpl.ordertablelist();
		Map model = new HashMap();
		model.put("ordertable", ordertable);
		return new ModelAndView("Adminbackgroundshipment", model);
	}*/
	
	
			//论坛首页
	@RequestMapping("forum.sf") 
	public String forum(HttpServletRequest request) {
	//	System.out.println("论坛"+Callingmethod.count);//得到注册用户的总数量
		
		//将所有的论坛全部查询出来
		String a = (String) request.getServletContext().getAttribute("getUserName");
		request.setAttribute("userNamemessage", a);//最新注册的用户
		request.setAttribute("usercount", Callingmethod.count);//用户总数
		request.setAttribute("messacount", Callingmethod.messacount);//帖子总数
		request.setAttribute("onedaycount", Callingmethod.onedaycount);//今日总帖子数量
		request.setAttribute("yessdaycount", Callingmethod.yessdaycount);//昨日总帖子数量
		request.setAttribute("servedatcount", Callingmethod.servedatcount);//7天总帖子数量
		return "Forumindex";
	}
	
	@RequestMapping("Forum") 
	public ModelAndView Forum(HttpServletRequest request) {
		//将所有的论坛全部查询出来
		List<forumEntity> list =  userListServiceImpl.forumEnt("1");
		Map model = new HashMap();
		model.put("list", list);
		return new ModelAndView("Forum", model);
	}
	//
	//论坛帖子详细
	@RequestMapping("forumReply.sf") 
	public ModelAndView forumReply(HttpServletRequest request,String forumID) {
		//将所有的论坛全部查询出来
		forumEntity user = userListServiceImpl.forumentitymmp(forumID);
		//在根据此ID查询出所有的回复
		List<forumreplyEntity> forumre = userListServiceImpl.forumreply(forumID);
		Map model = new HashMap();
		model.put("user", user);
		model.put("forumre", forumre);
		return new ModelAndView("ForumReply", model);
	}

	
	//发布文章AJAX
	@RequestMapping(value = "forummessage.sf", method = RequestMethod.POST, produces = "text/html;charset=UTF-8") 
	public  @ResponseBody void forummessage(HttpServletRequest request,HttpServletResponse response,String biaoti , String neirong) throws IOException {
		forumEntity  forument = new forumEntity();
		//给实体设值
		forument.setForumID(GetUUID.getUUID());
		forument.setForumBT(biaoti);
		forument.setForummessage(neirong);
		forument.setForumuserName((String) request.getSession().getAttribute("userName"));
		forument.setForumTime(GetDataTime.DQtime());
		forument.setForumliebie("1");//类别也默认为1吧
		forument.setForumAmount("0");
		forument.setFirumhand((String) request.getSession().getAttribute("userHand"));
		String list="";
		
					//调用保存方法
						boolean bl = messageService.forumfuck(forument);
						if(bl){
							list="发表成功";
						}else {
							list="发表失败";
						}
					
		
					// 设置编码
					response.setCharacterEncoding("UTF-8");
					try {
						request.setCharacterEncoding("UTF-8");
						PrintWriter out = response.getWriter();
						Gson gson = new Gson();
						String sbb = gson.toJson(list);
						out.write(sbb);
					} catch (UnsupportedEncodingException e) {
						System.out.println("发布论坛文章这里出错了");
					}
					
	}
	
	/****************************************************************/
	
	//发布文章AJAX
		@RequestMapping(value = "forumreply.sf", method = RequestMethod.POST, produces = "text/html;charset=UTF-8") 
		public  @ResponseBody void forumreply(HttpServletRequest request,HttpServletResponse response,String neirong , String id) throws IOException {
			
						// 设置编码
						response.setCharacterEncoding("UTF-8");
						try {
							String listecho = "";
							forumreplyEntity forumreply = new forumreplyEntity();
							forumreply.setReplyhand((String) request.getSession().getAttribute("userHand"));
							forumreply.setReplyid(GetUUID.getUUID());
							forumreply.setReplyneirong(neirong);
							forumreply.setReplytieziid(id);
							forumreply.setReplytime(GetDataTime.DQtime());
							forumreply.setReplyname((String) request.getSession().getAttribute("userName"));
								//调用方法
							boolean  bl = messageServiceImpl.forumreply(forumreply);
							if(bl){
								listecho="回复成功";
							}else{
								listecho="回复失败,请联系管理员";
							}
							request.setCharacterEncoding("UTF-8");
							PrintWriter out = response.getWriter();
							Gson gson = new Gson();
							String sbb = gson.toJson(listecho);
							out.write(sbb);
						} catch (UnsupportedEncodingException e) {
							System.out.println("回复论坛帖子这里出错了");
						}
						
		}
		
	
	
	/*
	 * 
	 * //所有测试页面都进这
	 * 
	 * @RequestMapping("testshabi.sf") public String
	 * testshabi(HttpServletRequest request) {
	 * 
	 * return "DisplayVideo";
	 * 
	 * }
	 */

}
