package com.mystudy.bbs.vo;

public class CommentVO {
	private String commentIdx, writer, content, pwd, writeIate,
			ip, bbsIdx;

	public String getCommentIdx() {
		return commentIdx;
	}

	public void setCommentIdx(String commentIdx) {
		this.commentIdx = commentIdx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getWriteIate() {
		return writeIate;
	}

	public void setWriteIate(String writeIate) {
		this.writeIate = writeIate;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getBbsIdx() {
		return bbsIdx;
	}

	public void setBbsIdx(String bbsIdx) {
		this.bbsIdx = bbsIdx;
	}

	@Override
	public String toString() {
		return "CommentVO [commentIdx=" + commentIdx + ", writer=" + writer + ", content=" + content + ", pwd=" + pwd
				+ ", writeIate=" + writeIate + ", ip=" + ip + ", bbsIdx=" + bbsIdx + "]";
	}
	
	
}