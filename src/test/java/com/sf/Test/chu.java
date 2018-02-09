package com.sf.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class chu {
	public static void main(String[] args) {

		 String  str = "银行业存款类金融机构协助查冻扣账户数量[3041900001#01]<=银行业存款类金融机构协助查询账户数量[3041900001#b1]+银行业存款类金融机构协助冻结账户数量[3041900001#b2]+银行业存款类金融机构协助扣划账户数量[3041900001#b3]";  
         String reg = "[\u4e00-\u9fa5]";  
         Pattern pat = Pattern.compile(reg);    
         Matcher mat = pat.matcher(str);   
         String repickStr = mat.replaceAll("");  
         System.out.println("去中文后:"+repickStr); 
		    
	}
}
