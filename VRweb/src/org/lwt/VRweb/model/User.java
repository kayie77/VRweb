package org.lwt.VRweb.model;
import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.*;

public class User {
	private Integer id;
	
	@Size(min=4,max=16,message="用户名不符合格式")
	@Pattern(regexp="^[\u4e00-\u9fa5a-zA-Z0-9]+$",message="用户名只能有中文，英文，数字构成")
	private String username;
	
	@Size(min=6,max=16,message="密码在6-16位之间")
	private String password;
	
	private String sex;
	private String personalDescribe;
	private String oneWord;
	private Set<Speak> speaks = new HashSet<Speak>();
	private Set<Answer> support_speaks = new HashSet<Answer>();
	private Set<Answer> oppose_speaks = new HashSet<Answer>();
	private Set<User>	focus =  new HashSet<User>();
	
	private Integer AC = 0; //访问量
	private Integer credit = 0; //积分
	
	public User() {
		super();
	}
	
	public User(String username, String password,String sex,
			String describe, String oneWord){
		super();
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.personalDescribe = describe;
		this.oneWord = oneWord;
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getPersonalDescribe() {
		return personalDescribe;
	}

	public void setPersonalDescribe(String personalDescribe) {
		this.personalDescribe = personalDescribe;
	}

	public String getOneWord() {
		return oneWord;
	}
	
	public void setOneWord(String oneWord) {
		this.oneWord = oneWord;
	}
	
	public Set<Speak> getSpeaks() {
		return speaks;
	}
	
	public void setSpeaks(Set<Speak> speaks) {
		this.speaks = speaks;
	}
	
	public Set<Answer> getSupport_speaks() {
		return support_speaks;
	}

	public void setSupport_speaks(Set<Answer> support_speaks) {
		this.support_speaks = support_speaks;
	}

	public Set<Answer> getOppose_speaks() {
		return oppose_speaks;
	}

	public void setOppose_speaks(Set<Answer> oppose_speaks) {
		this.oppose_speaks = oppose_speaks;
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
	
	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	
	public Set<User> getFocus() {
		return focus;
	}

	public void setFocus(Set<User> focus) {
		this.focus = focus;
	}

	public void addCredit(int c) {
		credit += c; 
	}
	
	public void subCredit(int c) {
		credit -= c; 
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		User other = (User) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
