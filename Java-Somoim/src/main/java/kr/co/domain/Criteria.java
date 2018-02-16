package kr.co.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	public Criteria() {
		// TODO Auto-generated constructor stub
		page = 1;
		perPageNum = 10;
	}

	public Criteria(int page, int perPageNum) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getStartRow() {
		int startRow = (page-1)*perPageNum+1;
		return startRow;
	}
	
	public int getEndRow() {
		int endRow = page*perPageNum;
		return endRow;
	}
	
}
