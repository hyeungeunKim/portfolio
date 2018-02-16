package kr.co.domain;

public class CrewVO {
	private int cno;
	private String mid;
	private String region;
	private String title;
	private String content;
	private int attend_cnt;
	private int join_cnt;
	private String writeday;
	private int read_cnt;
	private String role;
	private String picture;
	private String category;
	private String files;
	

	public CrewVO() {
		// TODO Auto-generated constructor stub
	}

	public CrewVO(int cno, String mid, String region, String title, String content, int attend_cnt, int join_cnt,
			String writeday, int read_cnt, String role, String picture, String category) {
		super();
		this.cno = cno;
		this.mid = mid;
		this.region = region;
		this.title = title;
		this.content = content;
		this.attend_cnt = attend_cnt;
		this.join_cnt = join_cnt;
		this.writeday = writeday;
		this.read_cnt = read_cnt;
		this.role = role;
		this.picture = picture;
		this.category = category;
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

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getAttend_cnt() {
		return attend_cnt;
	}

	public void setAttend_cnt(int attend_cnt) {
		this.attend_cnt = attend_cnt;
	}

	public int getJoin_cnt() {
		return join_cnt;
	}

	public void setJoin_cnt(int join_cnt) {
		this.join_cnt = join_cnt;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cno;
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
		CrewVO other = (CrewVO) obj;
		if (cno != other.cno)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CrewVO [cno=" + cno + ", mid=" + mid + ", title=" + title + "]";
	}
	
}