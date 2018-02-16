package kr.co.domain;

public class StatusVO {
	private int sno;
	private int sl_no;
	private String name;
	private String mid;
	private int cno;
	
	public StatusVO() {
		// TODO Auto-generated constructor stub
	}
	
	public StatusVO(int sno, int sl_no, String name, String mid, int cno) {
		super();
		this.sno = sno;
		this.sl_no = sl_no;
		this.name = name;
		this.mid = mid;
		this.cno = cno;
	}

	@Override
	public String toString() {
		return "StatusVO [sno=" + sno + ", sl_no=" + sl_no + ", name=" + name + ", mid=" + mid + ", cno=" + cno + "]";
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getSl_no() {
		return sl_no;
	}

	public void setSl_no(int sl_no) {
		this.sl_no = sl_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	
	
}