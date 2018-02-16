package kr.co.domain;

public class ReplyVO {

	private int re_no;
	private String	mid;
	private int sg_no;
	private int	sb_no;
	private String re_content;
	private String re_writeday;
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + re_no;
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
		ReplyVO other = (ReplyVO) obj;
		if (re_no != other.re_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReplyVO [re_no=" + re_no + ", mid=" + mid + ", sg_no=" + sg_no + ", sb_no=" + sb_no + ", re_content="
				+ re_content + ", re_writeday=" + re_writeday + "]";
	}

	public ReplyVO(int re_no, String mid, int sg_no, int sb_no, String re_content, String re_writeday) {
		super();
		this.re_no = re_no;
		this.mid = mid;
		this.sg_no = sg_no;
		this.sb_no = sb_no;
		this.re_content = re_content;
		this.re_writeday = re_writeday;
	}

	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getSg_no() {
		return sg_no;
	}

	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
	}

	public int getSb_no() {
		return sb_no;
	}

	public void setSb_no(int sb_no) {
		this.sb_no = sb_no;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_writeday() {
		return re_writeday;
	}

	public void setRe_writeday(String re_writeday) {
		this.re_writeday = re_writeday;
	}
	
	
}
