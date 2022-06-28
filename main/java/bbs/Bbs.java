package bbs;

import java.util.Date;

public class Bbs {
   private int bbsID;
   private String bbsTitle;
   private String id;
   private String bbsDate;
   private String bbsContent;
   private int view;
   private int bbsAvailable;
   
   
   
public Bbs() {
	super();
	// TODO Auto-generated constructor stub
}

public int getBbsID() {
	return bbsID;
}
public void setBbsID(int bbsID) {
	this.bbsID = bbsID;
}
public String getBbsTitle() {
	return bbsTitle;
}
public void setBbsTitle(String bbsTitle) {
	this.bbsTitle = bbsTitle;
}
public String getid() {
	return id;
}
public void setid(String id) {
	this.id = id;
}
public String getBbsDate() {
	return bbsDate;
}
public void setBbsDate(String bbsDate) {
	this.bbsDate = bbsDate;
}
public String getBbsContent() {
	return bbsContent;
}
public void setBbsContent(String bbsContent) {
	this.bbsContent = bbsContent;
}
public int getBbsAvailable() {
	return bbsAvailable;
}
public void setBbsAvailable(int bbsAvailable) {
	this.bbsAvailable = bbsAvailable;
}
public int getView() {
	return view;
}
public void setView(int view) {
	this.view = view;
}

public Bbs(int bbsID, String bbsTitle, String id, String bbsDate, int bbsAvailable, int view,String bbsContent) {
	super();
	this.bbsID = bbsID;
	this.bbsTitle = bbsTitle;
	this.id = id;
	this.bbsDate = bbsDate;
	this.bbsContent = bbsContent;
	this.view = view;
	this.bbsAvailable = bbsAvailable;
	
}
public Bbs(int bbsID, String bbsTitle, String id, String bbsDate, String bbsContent, int bbsAvailable) {
	super();
	this.bbsID = bbsID;
	this.bbsTitle = bbsTitle;
	this.id = id;
	this.bbsDate = bbsDate;
	this.bbsContent = bbsContent;
	this.bbsAvailable = bbsAvailable;
}

public Bbs(String bbsTitle, String bbsDate, String bbsContent, int bbsAvailable) {
	super();
	this.bbsTitle = bbsTitle;
	this.bbsDate = bbsDate;
	this.bbsContent = bbsContent;
	this.bbsAvailable = bbsAvailable;
}
   
   
	
}
