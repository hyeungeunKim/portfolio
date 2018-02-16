package kr.co.domain;

public class VisitorVO {
	private int count	;
	private String visit_day;
	
	public VisitorVO() {
		// TODO Auto-generated constructor stub
	}

	public VisitorVO(int count, String visit_day) {
		super();
		this.count = count;
		this.visit_day = visit_day;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getVisit_day() {
		return visit_day;
	}

	public void setVisit_day(String visit_day) {
		this.visit_day = visit_day;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((visit_day == null) ? 0 : visit_day.hashCode());
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
		VisitorVO other = (VisitorVO) obj;
		if (visit_day == null) {
			if (other.visit_day != null)
				return false;
		} else if (!visit_day.equals(other.visit_day))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "VisitorVO [count=" + count + ", visit_day=" + visit_day + "]";
	}
	
}