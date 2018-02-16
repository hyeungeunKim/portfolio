package kr.co.domain;


public class sGalleryVO {

	private int sg_no;
	private int	cno;
	private String mid;
	private String sg_picture;
	private String sg_writeday;

	/*sg_no, cno, sg_picture*/
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cno;
		result = prime * result + sg_no;
		result = prime * result + ((sg_picture == null) ? 0 : sg_picture.hashCode());
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
		sGalleryVO other = (sGalleryVO) obj;
		if (cno != other.cno)
			return false;
		if (sg_no != other.sg_no)
			return false;
		if (sg_picture == null) {
			if (other.sg_picture != null)
				return false;
		} else if (!sg_picture.equals(other.sg_picture))
			return false;
		return true;
	}
	
	public sGalleryVO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "sGalleryVO [sg_no=" + sg_no + ", cno=" + cno + ", mid=" + mid + ", sg_picture=" + sg_picture
				+ ", sg_writeday=" + sg_writeday + "]";
	}

	public sGalleryVO(int sg_no, int cno, String mid, String sg_picture, String sg_writeday) {
		super();
		this.sg_no = sg_no;
		this.cno = cno;
		this.mid = mid;
		this.sg_picture = sg_picture;
		this.sg_writeday = sg_writeday;
	}

	public int getSg_no() {
		return sg_no;
	}

	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
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

	public String getSg_picture() {
		return sg_picture;
	}

	public void setSg_picture(String sg_picture) {
		this.sg_picture = sg_picture;
	}

	public String getSg_writeday() {
		return sg_writeday;
	}

	public void setSg_writeday(String sg_writeday) {
		this.sg_writeday = sg_writeday;
	}

}
