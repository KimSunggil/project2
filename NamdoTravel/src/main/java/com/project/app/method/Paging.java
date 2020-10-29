package com.project.app.method;

public class Paging {
	private int pageStartNum = 0;
	private int pageEndNum = 0;
	private int lastPageNum = 0;
	
	public int getPageStartNum() {
		return pageStartNum;
	}
	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}
	public int getPageEndNum() {
		return pageEndNum;
	}
	public void setPageEndNum(int pageEndNum) {
		this.pageEndNum = pageEndNum;
	}	
    public int getLastPageNum() {
		return lastPageNum;
	}
	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}
	
	public void makePage(int curPage){
        int pageNum = 0;

        pageNum = (int)Math.floor((curPage-1)/ 10);
        pageStartNum = (10 * pageNum) + 1;
        pageEndNum = pageStartNum + (10-1);
    }
    
    // 총 페이지의 마지막 번호
    public void makeLastPageNum(int total) {
        if( total % 10 == 0 ) {
            lastPageNum = (int)Math.floor(total/10);
        }
        else {
            lastPageNum = (int)Math.floor(total/10) + 1;
        }
    }
    
    // 검색을 했을 때 총 페이지의 마지막 번호
    public void makeLastPageNum(int total, String kwd) {
        if( total % 10 == 0 ) {
            lastPageNum = (int)Math.floor(total/10);
        }
        else {
            lastPageNum = (int)Math.floor(total/10) + 1;
        }
    }
	
}
