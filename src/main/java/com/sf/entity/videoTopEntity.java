package com.sf.entity;

public class videoTopEntity {
	private String Filename;// 文件名字

	private long FileSize;// 文件总大小

	private long FileSY;// 文件上传 剩余的
	
	private int tag=0;//如果大于0就是上传完成
	
	private int baifenbi=0;//百分比

	public String getFilename() {
		return Filename;
	}

	public void setFilename(String filename) {
		Filename = filename;
	}

	public long getFileSize() {
		return FileSize;
	}

	public void setFileSize(long fileSize) {
		FileSize = fileSize;
	}

	public long getFileSY() {
		return FileSY;
	}

	public void setFileSY(long fileSY) {
		FileSY = fileSY;
	}

	public int getTag() {
		return tag;
	}

	public void setTag(int tag) {
		this.tag = tag;
	}

	public int getBaifenbi() {
		return baifenbi;
	}

	public void setBaifenbi(int baifenbi) {
		this.baifenbi = baifenbi;
	}


	
}
