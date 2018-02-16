package kr.co.domain;

public class JoinSlistVO {
	private int cno;
	private String title;
	private int crew_attend_cnt;
	private int join_cnt;
	private int sl_no;
	private String attend_title;
	private String attend_region;
	private String attend_date;
	private int slist_attend_cnt;
	private int s_join_cnt;
	private int attend_money;
	
	public JoinSlistVO() {
		// TODO Auto-generated constructor stub
	}

	public JoinSlistVO(int cno, String title, int crew_attend_cnt, int join_cnt, int sl_no, String attend_title,
			String attend_region, String attend_date, int slist_attend_cnt, int s_join_cnt, int attend_money) {
		super();
		this.cno = cno;
		this.title = title;
		this.crew_attend_cnt = crew_attend_cnt;
		this.join_cnt = join_cnt;
		this.sl_no = sl_no;
		this.attend_title = attend_title;
		this.attend_region = attend_region;
		this.attend_date = attend_date;
		this.slist_attend_cnt = slist_attend_cnt;
		this.s_join_cnt = s_join_cnt;
		this.attend_money = attend_money;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCrew_attend_cnt() {
		return crew_attend_cnt;
	}

	public void setCrew_attend_cnt(int crew_attend_cnt) {
		this.crew_attend_cnt = crew_attend_cnt;
	}

	public int getJoin_cnt() {
		return join_cnt;
	}

	public void setJoin_cnt(int join_cnt) {
		this.join_cnt = join_cnt;
	}

	public int getSl_no() {
		return sl_no;
	}

	public void setSl_no(int sl_no) {
		this.sl_no = sl_no;
	}

	public String getAttend_title() {
		return attend_title;
	}

	public void setAttend_title(String attend_title) {
		this.attend_title = attend_title;
	}

	public String getAttend_region() {
		return attend_region;
	}

	public void setAttend_region(String attend_region) {
		this.attend_region = attend_region;
	}

	public String getAttend_date() {
		return attend_date;
	}

	public void setAttend_date(String attend_date) {
		this.attend_date = attend_date;
	}

	public int getSlist_attend_cnt() {
		return slist_attend_cnt;
	}

	public void setSlist_attend_cnt(int slist_attend_cnt) {
		this.slist_attend_cnt = slist_attend_cnt;
	}

	public int getS_join_cnt() {
		return s_join_cnt;
	}

	public void setS_join_cnt(int s_join_cnt) {
		this.s_join_cnt = s_join_cnt;
	}

	public int getAttend_money() {
		return attend_money;
	}

	public void setAttend_money(int attend_money) {
		this.attend_money = attend_money;
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
		JoinSlistVO other = (JoinSlistVO) obj;
		if (sl_no != other.sl_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "JoinSlistVO [cno=" + cno + ", title=" + title + ", attend_title=" + attend_title + ", attend_date="
				+ attend_date + "]";
	}
	
}
