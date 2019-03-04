package org.lwt.VRweb.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Answer extends Speak {
	private int support = 0;
	private int oppose = 0;
	private Question question;
	private Set<User> supportor;
	private Set<User> opponent;
	
	String curSurpt ="";
	String curOppt ="";
	
	public Answer() {
		super();
	}

	public Answer(Question question) {
		super();
		this.question = question;
	}

	public int getSupport() {
		return support;
	}


	public void setSupport(int support) {
		this.support = support;
	}


	public int getOppose() {
		return oppose;
	}


	public void setOppose(int oppose) {
		this.oppose = oppose;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Set<User> getSupportor() {
		return supportor;
	}

	public void setSupportor(Set<User> supportor) {
		this.supportor = supportor;
	}

	public Set<User> getOpponent() {
		return opponent;
	}

	public void setOpponent(Set<User> opponent) {
		this.opponent = opponent;
	}
	
	public int getVote() {
		return getSupport()-getOppose();
	}

	public int incSupport(){
		return ++support;
	}
	
	public int decSupport(){
		return --support;
	}
		
	public int incOppose(){
		return ++oppose;
	}
	
	public int decOppose(){
		return --oppose;
	}

	public String getCurSurpt() {
		return curSurpt;
	}

	public void setCurSurpt(String curSurpt) {
		this.curSurpt = curSurpt;
	}

	public String getCurOppt() {
		return curOppt;
	}

	public void setCurOppt(String curOppt) {
		this.curOppt = curOppt;
	}
	
	
}
