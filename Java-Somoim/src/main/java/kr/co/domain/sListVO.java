package kr.co.domain;

public class sListVO {
	private int sl_no;
	private int cno;
	private String attend_title;
	private String attend_date;
	private String attend_region;
	private int attend_cnt;
	private int attend_money;
	private int s_join_cnt;

	public sListVO() {
		// TODO Auto-generated constructor stub
	}
	
	public sListVO(int sl_no, int cno, String attend_title, String attend_date, String attend_region, int attend_cnt,
			int attend_money, int s_join_cnt) {
		super();
		this.sl_no = sl_no;
		this.cno = cno;
		this.attend_title = attend_title;
		this.attend_date = attend_date;
		this.attend_region = attend_region;
		this.attend_cnt = attend_cnt;
		this.attend_money = attend_money;
		this.s_join_cnt = s_join_cnt;
	}
	
	public int getSl_no() {
		return sl_no;
	}

	public void setSl_no(int sl_no) {
		this.sl_no = sl_no;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getAttend_title() {
		return attend_title;
	}

	public void setAttend_title(String attend_title) {
		this.attend_title = attend_title;
	}

	public String getAttend_date() {
		return attend_date;
	}

	public void setAttend_date(String attend_date) {
		this.attend_date = attend_date;
	}

	public String getAttend_region() {
		return attend_region;
	}

	public void setAttend_region(String attend_region) {
		this.attend_region = attend_region;
	}

	public int getAttend_cnt() {
		return attend_cnt;
	}

	public void setAttend_cnt(int attend_cnt) {
		this.attend_cnt = attend_cnt;
	}

	public int getAttend_money() {
		return attend_money;
	}

	public void setAttend_money(int attend_money) {
		this.attend_money = attend_money;
	}

	public int getS_join_cnt() {
		return s_join_cnt;
	}

	public void setS_join_cnt(int join_cnt) {
		this.s_join_cnt = join_cnt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + sl_no;
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
		sListVO other = (sListVO) obj;
		if (sl_no != other.sl_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "sListVO [sl_no=" + sl_no + ", cno=" + cno + ", attend_title=" + attend_title + "]";
	}
	
}
