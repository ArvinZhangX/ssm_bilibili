package com.sf.tool;


public class Html_guolv {
/*	String content = "文章内容";
	// 过滤文章内容中的html
	content = content.replaceAll("<[^<]+>", "");
	// 去除字符串中的空格 回车 换行符 制表符 等
	content = content.replaceAll("\\s*|\t|\r|\n", "");
	// 去除空格
	content = content.replaceAll("&nbsp;", "");
	// 去掉其他一些字符
	content = content.replaceAll("\", "");
	后面的如果有特殊字符，根据自己需要进行过滤。*/
	
	
	public static void main(String[] args) {
		String content = "<asjhdjasd>asdjasdjkzxc爱仕达技术的{/r}123i12<sc>撒客户端";
		content = content.replaceAll("<[^<]+>//s*|/t|/r|/n|&nbsp;", "");
		System.out.println(content);
	}
}
