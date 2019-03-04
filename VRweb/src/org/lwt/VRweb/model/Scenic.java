package org.lwt.VRweb.model;

public class Scenic {

	private int scenic_id;
	private String scenic_name;
	private String scenic_detail;
	private Integer AC = 0;
	private Category category; 
	private City city; 
	
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public int getScenic_id() {
		return scenic_id;
	}
	public void setScenic_id(int scenic_id) {
		this.scenic_id = scenic_id;
	}
	public String getScenic_name() {
		return scenic_name;
	}
	public void setScenic_name(String scenic_name) {
		this.scenic_name = scenic_name;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getScenic_detail() {
		return scenic_detail;
	}
	public void setScenic_detail(String scenic_detail) {
		this.scenic_detail = scenic_detail;
	}

	public Integer getAC() {
		return AC;
	}
	public void setAC(Integer aC) {
		AC = aC;
	}
	public Scenic(){
		super();
	}
	public int incAC() {
		return AC += 1;
	}
}
