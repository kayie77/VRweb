package org.lwt.VRweb.model;

public class Category {
	private Integer id;
	private String name;
	private String cateDescribe;
	private String logo_img;
	private String startTime;
	private String Nature;
	private String address;
	private String tel;
	private String cate_detail;
	private String webAddress;
	private Integer AC = 0; //∑√Œ ¡ø
	
	private City city;
	
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getWebAddress() {
		return webAddress;
	}

	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}

	public String getNature() {
		return Nature;
	}

	public void setNature(String nature) {
		Nature = nature;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Category() {
		super();
	}
	
	public String getLogo_img() {
		return logo_img;
	}


	public void setLogo_img(String logo_img) {
		this.logo_img = logo_img;
	}

	
	public String getCate_detail() {
		return cate_detail;
	}

	public void setCate_detail(String cate_detail) {
		this.cate_detail = cate_detail;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
		
	public void setName(String name) {
		this.name = name;
	}


	public String getCateDescribe() {
		return cateDescribe;
	}


	public void setCateDescribe(String cateDescribe) {
		this.cateDescribe = cateDescribe;
	}


	public Integer getAC() {
		return AC;
	}


	public void setAC(Integer aC) {
		AC = aC;
	}
	
	public int incAC() {
		return AC += 1;
	}
}
