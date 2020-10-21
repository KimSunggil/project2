package com.project.app.vo;

public class ReplyVO {
	private int replyId;
	private int superReply;
	private int userId;
	private int nickName;
	private String content;
	private String replyDate;
	
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getSuperReply() {
		return superReply;
	}
	public void setSuperReply(int superReply) {
		this.superReply = superReply;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getNickName() {
		return nickName;
	}
	public void setNickName(int nickName) {
		this.nickName = nickName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	
}
