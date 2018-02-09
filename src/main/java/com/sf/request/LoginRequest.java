package com.sf.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sf.entity.ordertableEntity;
import com.sf.entity.userEntity;
import com.sf.service.impl.LoginServiceImpl;
import com.sf.service.impl.UserListServiceImpl;
import com.sf.tool.GetDataTime;
import com.sf.tool.GetUUID;

@Controller
public class LoginRequest {
		
	@Autowired
	LoginServiceImpl loginServiceImpl;
	
	@Autowired
	UserListServiceImpl userListServiceImpl;
	
	@RequestMapping("loginservice.sf")
	public String web3(String userName,String passWord,HttpServletRequest request){
	 boolean bl=	loginServiceImpl.loginuser(userName, passWord);
	 if(bl){
		 //将用户的全部信息查询出来
		 userEntity list = userListServiceImpl.userlist(userName);
		 		//request.setAttribute("userlist", list);
		 //成功
		 	//将用户ID放到session里面
		 	request.getSession().setAttribute("userID", list.getUserID());
		 	request.getSession().setAttribute("userName", userName);
		 	request.getSession().setAttribute("userHand", list.getUserHand());
		 	String mamaipi = "logoone.sf";
		 	
		 	if(request.getSession().getAttribute("jiequ")!=null){
		 		
		 		//说明这个地址是用户想访问的地址 但是没用登录
		 		String ceshidizhi=(String) request.getSession().getAttribute("jiequ");
		 		//重置为空
		 		String jiequ = "";
		 		request.getSession().setAttribute("jiequ", jiequ);
		 		
		 		//赋值
		 		mamaipi = ceshidizhi;
		 		
		 	}
		 	
		 	return "redirect:/"+mamaipi;
	 }else{
		 //失败
		 request.setAttribute("PHO", "用户名或密码错误!");
		 
	 }
		
		return "loginnew";
	}
	
	
	
	
	
	//AJAX 提交
	@RequestMapping(value="yanzhengpass.sf",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public @ResponseBody  void yanzhengpass(HttpServletRequest request,HttpServletResponse response
		,String pass,String zong,String shangpingmingzi,String shangpingtupiao,String dizhi) throws IOException{
		//System.out.println(pass);"shangpingmingzi":shangpingmingzi,"shangpingtupiao":shangpingtupiao,"dizhi":dizhi
		//System.out.println(zong);//拿到物品的所有价格
		
		String userName = (String) request.getSession().getAttribute("userName");
		
		String list = "";
		boolean bl = loginServiceImpl.paypassword(userName, pass);
		if(bl){
			//拿到数据库里面的全部金额
			userEntity	user=userListServiceImpl.userlist(userName);
			//金额
			String RMB=user.getUserRMB();
			int shangpingjiage= 0;
			shangpingjiage=Integer.valueOf(zong).intValue();//商品价格
			int sqljiage= 0;
			sqljiage=Integer.valueOf(RMB).intValue();//用户的钱
			int yuer=sqljiage-shangpingjiage;
			if(yuer<0){
				list="对不起,您的余额不足";
			}else{
				//将yuer转换为字符串然后保存数据库
				String userRMB="";
				userRMB=String.valueOf(yuer);
				
				//支付成功之后 将数据库里面的价格修改
				boolean b = loginServiceImpl.updateRMB(userRMB, userName);
				if(b){
					//得到下单时间
					String Time = GetDataTime.DQtime();
					//将订单存到数据库
					ordertableEntity ordertable = new ordertableEntity();
						ordertable.setOrderID(GetUUID.getUUID());
						ordertable.setOrderuserName(userName);
						ordertable.setOrderIgridsName(shangpingmingzi);
						ordertable.setOrdergridsImg(shangpingtupiao);
						ordertable.setOrderzongRMB(zong);
						ordertable.setOrderStat("1");
						ordertable.setOrderTime(Time);
						ordertable.setOrderAddr(dizhi);
						boolean yes= loginServiceImpl.ordertable(ordertable);
						if(yes){
							list="下单成功";
						}else{
							list="服务器错误...请联系管理员!";
						}
				}else{
					list="服务器错误...请联系管理员!";
				}
			}
		}else{
			list="对不起,您输入的支付密码有误!";
		}
		

			
		//设置编码
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson=new Gson();
		String sbb=gson.toJson(list);
		out.write(sbb);
	}
	
	
	

	//这里是确认收货
	@RequestMapping("querendingdan.sf")
	public String querendingdan(HttpServletRequest request,String orderID) {
		boolean bl = loginServiceImpl.Confirmorder(orderID);
		if(bl){
			//收货成功
			//System.out.println("成功");
		}else{
			//收货失败
			//System.out.println("失败");
		}
		return "forward:/Order.sf";
		
	}	
	
	
	
	//这里是待取消订单
		@RequestMapping("Cancellationoforder.sf")
		public String Cancellationoforder(HttpServletRequest request,String orderID) {
			boolean bl = loginServiceImpl.Cancellationoforder(orderID);
			if(bl){
				//收货成功
				//System.out.println("待取消成功");
			}else{
				//收货失败
				//System.out.println("待取消失败");
			}
			return "forward:/Order.sf";
			
		}	
		
		
		
		//这里是用户删除的订单
		@RequestMapping("delordertable.sf")
		public String delordertable(HttpServletRequest request,String orderID) {
			boolean bl = loginServiceImpl.delordertable(orderID);
			if(bl){
				//收货成功
				//System.out.println("删除成功");
			}else{
				//收货失败
				//System.out.println("删除失败");
			}
			return "forward:/Order.sf";
			
		}	
		
		
		
		//这里是立即发货
				@RequestMapping("Delivergoods.sf")
				public String Delivergoods(HttpServletRequest request,String orderID) {
					boolean bl = loginServiceImpl.Delivergoods("2",orderID);
					if(bl){
						
					}else{
						
					}
					return "forward:/Shipmentpending";
					
				}
				
				//这里是立即退货
				@RequestMapping("Returngoods.sf")
				public String Returngoods(HttpServletRequest request,String orderID) {
					boolean bl = loginServiceImpl.Delivergoods("5",orderID);
					if(bl){
						
					}else{
						
					}
					return "forward:/Returngoods";
					
				}
		
				@RequestMapping("loginforum.sf")
				public String loginforum(String username,String password,HttpServletRequest request){
				 boolean bl=	loginServiceImpl.loginuser(username, password);
				 String sb = "";
				 if(bl){
					 //将用户的全部信息查询出来
					 userEntity list = userListServiceImpl.userlist(username);
					 		request.setAttribute("登录成功", sb);
					 //成功
					 	//将用户ID放到session里面
					 	request.getSession().setAttribute("userID", list.getUserID());
					 	request.getSession().setAttribute("userName", username);
					 	request.getSession().setAttribute("userHand", list.getUserHand());
					 }else{
						 request.setAttribute("登录失败", sb);
						 return "forward:/forum.sf";
					 }
				 		return "forward:/forum.sf";
				}
}
