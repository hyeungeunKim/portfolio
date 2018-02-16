package kr.co.domain;


public class sBoardVO {
	
	private int sb_no;
	private int cno;
	private String mid;
	private String sb_title;
	private String sb_content;
	private String sb_writeday;
	private String sb_picture;
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + sb_no;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		sBoardVO other = (sBoardVO) obj;
		if (sb_no != other.sb_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "sBoardVO [sb_no=" + sb_no + ", cno=" + cno + ", mid=" + mid + ", sb_title=" + sb_title + ", sb_content="
				+ sb_content + ", sb_writeday=" + sb_writeday + ", sb_picture=" + sb_picture + "]";
	}

	public sBoardVO(int sb_no, int cno, String mid, String sb_title, String sb_content, String sb_writeday,
			String sb_picture) {
		super();
		this.sb_no = sb_no;
		this.cno = cno;
		this.mid = mid;
		this.sb_title = sb_title;
		this.sb_content = sb_content;
		this.sb_writeday = sb_writeday;
		this.sb_picture = sb_picture;
	}

	public sBoardVO() {
		// TODO Auto-generated constructor stub
	}

	public int getSb_no() {
		return sb_no;
	}

	public void setSb_no(int sb_no) {
		this.sb_no = sb_no;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getSb_title() {
		return sb_title;
	}

	public void setSb_title(String sb_title) {
		this.sb_title = sb_title;
	}

	public String getSb_content() {
		return sb_content;
	}

	public void setSb_content(String sb_content) {
		this.sb_content = sb_content;
	}

	public String getSb_writeday() {
		return sb_writeday;
	}

	public void setSb_writeday(String sb_writeday) {
		this.sb_writeday = sb_writeday;
	}

	public String getSb_picture() {
		return sb_picture;
	}

	public void setSb_picture(String sb_picture) {
		this.sb_picture = sb_picture;
	}
	
	

}
