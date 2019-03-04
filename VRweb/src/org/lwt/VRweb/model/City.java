package org.lwt.VRweb.model;

public class City {
	public Integer getCity_id() {
		return city_id;
	}


	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}


	public String getCity_name() {
		return city_name;
	}


	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	
	public City(){
		super();
	}


	public City(Integer city_id, String city_name, 
			Integer aC) {
		super();
		this.city_id = city_id;
		this.city_name = city_name;
		AC = aC;
	}


	private Integer city_id;
	private String city_name;

	private Integer AC = 0; //∑√Œ ¡ø
	


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
