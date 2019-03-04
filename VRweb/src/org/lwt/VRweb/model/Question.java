package org.lwt.VRweb.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.*;
public class Question extends Speak {
	@Size(min=5,message="标题不得少于5个字")
	private String title;
	private Set<Answer> answers = new HashSet<Answer>();
	private	String tag = ""; //空格分隔的标签列表
	private Category category;
	private Integer AC = 0; //访问量
	
	public Question() {
		super();
	}

	public Question(String title, Set<Answer> answers) {
		super();
		this.title = title;
		this.answers = answers;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public Set<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public Integer getAC() {
		return AC;
	}

	public void setAC(Integer ac) {
		AC = ac;
	}
	
	public int incAC() {
		return AC += 1;
	}
}
