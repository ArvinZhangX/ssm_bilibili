package com.sf.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sf.entity.messageEntity;
import com.sf.entity.userEntity;
import com.sf.entity.videoEntity;
import com.sf.service.impl.LoginServiceImpl;
import com.sf.service.impl.MessageServiceImpl;
import com.sf.service.impl.UserListServiceImpl;
import com.sf.tool.GetDataTime;
import com.sf.tool.GetUUID;

@Controller
public class MessageRequest {

	@Autowired
	LoginServiceImpl loginServiceImpl;

	@Autowired
	UserListServiceImpl userListServiceImpl;

	@Autowired
	MessageServiceImpl messageServiceImpl;

	@RequestMapping(value = "messageuser.sf", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody void web3(String message, HttpServletRequest request, HttpServletResponse response,
			String shipingID) throws IOException {
		String userName = (String) request.getSession().getAttribute("userName");// 得到用户登录的用户名
		// 如果Session 里面的用户名存在 就相当于用户已经登录 可以留言 否则不能
		// 设置编码
		// System.out.println("ajax 进入了 发表留言里面");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String tishi = "";
		Gson gson = new Gson();
		if (userName != null) {

			// 随机生成一个留言表ID
			String messageID = GetUUID.getUUID();
			// 获得当前时间
			String dataTime = GetDataTime.DQtime();
			// System.out.println(message);//得到留言内容
			// System.out.println(shipingID);//得到视频ID
			// String
			userEntity user = userListServiceImpl.userlist(userName);
			// 得到用户ID
			String userID = user.getUserID();
			String userHand = user.getUserHand();

			// 将留言类容过滤掉 html 标签
			message = message.replaceAll("<[^<]+>//s*|/t|/r|/n|&nbsp;", "");
			//留言内容不能超过150个字
			if (message.length() < 150) {
				
				// new 一个用户实体
				messageEntity messageent = new messageEntity();
				messageent.setMessage(message);
				messageent.setMessageID(messageID);
				messageent.setMessageTime(dataTime);
				messageent.setMessageuserID(userID);
				messageent.setMessageuserName(userName);
				messageent.setMessagevideoID(shipingID);
				messageent.setMessageHand(userHand);// 将用户留言头像地址存放的留言表
				boolean bl = messageServiceImpl.message(messageent);
				if (bl) {
					// 留言成功
					// System.out.println("向这个视频留言成功");
					tishi = "留言成功";
				} else {
					// 留言失败
					// System.out.println("留言失败");
					tishi = "留言失败";
				}
			}else{
				System.out.println(message.length());
				tishi="对不起,留言内容过长";
			}
		} else {
			// 说明用户没有登录 就在留言
			// System.out.println("用户没有登录");
			tishi = "请登录之后留言";
		}
		// redirect:/messageuser.sf
		String t1 = gson.toJson(tishi);
		out.write(t1);

	}
}
