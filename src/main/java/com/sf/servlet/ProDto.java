package com.sf.servlet;

public class ProDto {
	private String fileName;// 上传的文件名
	private long max;// 最大值
	private long other;// 剩余值
	private int Test;
	


	public int getTest() {
		return Test;
	}

	public void setTest(int test) {
		Test = test;
	}

	private int endTag=0;//结束标记，为1代表结束
    
    
	public int getEndTag() {
		return endTag;
	}

	public void setEndTag(int endTag) {
		this.endTag = endTag;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getMax() {
		return max;
	}

	public void setMax(long max) {
		this.max = max;
	}

	public long getOther() {
		return other;
	}

	public void setOther(long other) {
		this.other = other;
	}
}
