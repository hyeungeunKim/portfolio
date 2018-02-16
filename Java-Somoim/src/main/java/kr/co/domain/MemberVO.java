package kr.co.domain;

public class MemberVO {
	private String mid;
	private String password;
	private String name;
	private int gender;
	private String birth;
	
	private String address;
	private String phone;
	private String category;
	private int power;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String mid, String password, String name, int gender, String birth, String address, String phone,
			String category, int power) {
		super();
		this.mid = mid;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.address = address;
		this.phone = phone;
		this.category = category;
		this.power = power;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", password=" + password + ", name=" + name + ", gender=" + gender + ", birth="
				+ birth + ", address=" + address + ", phone=" + phone + ", category=" + category + ", power=" + power
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mid == null) ? 0 : mid.hashCode());
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
		MemberVO other = (MemberVO) obj;
		if (mid == null) {
			if (other.mid != null)
				return false;
		} else if (!mid.equals(other.mid))
			return false;
		return true;
	}
	
	
	
}
