package org.lwt.VRweb.service.impl;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.lwt.VRweb.dao.CategoryDao;
import org.lwt.VRweb.dao.SpeakDao;
import org.lwt.VRweb.dao.UserDao;
import org.lwt.VRweb.model.Answer;
import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Comment;
import org.lwt.VRweb.model.Question;
import org.lwt.VRweb.model.User;
import org.lwt.VRweb.utilities.AnswerVoteComparator;
import org.lwt.VRweb.utilities.SpeakTimeComparator;

import com.opensymphony.xwork2.Result;

public class SpeakManager {
	private UserDao userDao; 
	private SpeakDao speakDao;
	private CategoryDao categoryDao;
	
	public int publishQuestion() {
		// TODO Auto-generated method stub
		return 0;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public SpeakDao getSpeakDao() {
		return speakDao;
	}

	public void setSpeakDao(SpeakDao speakDao) {
		this.speakDao = speakDao;
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	public List<Question> revealQuestion(String keyword,int page_th) {
		return speakDao.revealQuestion(keyword, page_th, 10);
	}
	
	//访问问题，并计数
	public Question accessQuestion(int questionID) {
		Question question = (Question)speakDao.get(questionID);
		question.incAC();
		speakDao.update(question);
		return question;
	}
	
	//按学校类型访问问题
	public List<Question> CategoryQuestions(int category_id) {
		List<Question> qlist = speakDao.getCategoryQuestions(category_id);
		return qlist;
	}
	
	
	//添加回答
	public int addAnswer(Integer question_id,Integer user_id,Answer answer) {
		answer.setOwner(userDao.get(user_id));
		answer.setQuestion((Question)speakDao.get(question_id));
		return speakDao.save(answer);
	}
	
	//添加评论
	public int addComment(Integer speak_id,Integer user_id,String content) {
		Comment comment = new Comment();
		Pattern p = Pattern.compile("@(.*?):");
        Matcher m = p.matcher(content);
        if (m.find()) {
        	User user = userDao.getUserByUsername(m.group(1));
        	content = content.replaceFirst("@.*?:", "<a href='/VRweb/user/"+user.getId()+"'>"+"@"+m.group(1)+":"+"</a>");         
        }
		comment.setContent(content);
		comment.setOwner(userDao.get(user_id));
		comment.setSpeak(speakDao.get(speak_id));
		return speakDao.save(comment);
	}
	
	//添加问题
	public int addQuestion(Integer category_id,Integer user_id,Question question) {
		question.setOwner(userDao.get(user_id));
		question.setCategory(categoryDao.get(category_id));
		return speakDao.save(question);
	}
	
	//修改问题
	public void updateQuestion(Integer category_id,Integer user_id,Question question) {
		question.setOwner(userDao.get(user_id));
		question.setCategory(categoryDao.get(category_id));
		speakDao.update(question);
		return;
	}

	public String supportAnswer(int answer_id,int user_id){
		Answer answer = (Answer)speakDao.getSpeakWithVoter(answer_id);
		User user = userDao.get(answer.getOwner().getId());
		Set<User> s_users = answer.getSupportor();
		Set<User> o_users = answer.getOpponent();
		User voter = userDao.get(user_id);
		if(s_users.contains(voter)){
			s_users.remove(voter);
			answer.decSupport();
			speakDao.update(answer);
			user.subCredit(7);
		}else{
			if(o_users.contains(voter))return "refuse";
			s_users.add(voter);
			answer.incSupport();
			speakDao.update(answer);
			user.addCredit(7);
		}
		userDao.update(user);
		return ""+answer.getVote();
	}
	
	public String opposeAnswer(int answer_id,int user_id){
		Answer answer = (Answer)speakDao.getSpeakWithVoter(answer_id);
		User user = userDao.get(answer.getOwner().getId());
		Set<User> s_users = answer.getSupportor();
		Set<User> o_users = answer.getOpponent();
		User voter = userDao.get(user_id);
		if(o_users.contains(voter)){
			o_users.remove(voter);
			answer.decOppose();
			speakDao.update(answer);
			user.addCredit(3);
		}else{
			if(s_users.contains(voter))return "refuse";
			o_users.add(voter);
			answer.incOppose();
			speakDao.update(answer);
			user.subCredit(3);
		}
		userDao.update(user);
		return ""+answer.getVote();
	}
	
	public List<Answer> getOrderedQuestionAnswer(String sortkey,int question_id) {
		List<Answer> answerList = speakDao.getAnswerOfQuestion(question_id);
		if (sortkey.equals("vote")) {
			Collections.sort(answerList, new AnswerVoteComparator());
		} 
		return answerList;
	}
	
	public Category accessCategory(int category_id) {
		Category cate = categoryDao.get(category_id);
		cate.incAC();
		categoryDao.update(cate);
		return cate;
	}
	
	
	public List<Category> revealCategory(String keyword,int page_th) {
		return speakDao.revealCategory(keyword, page_th, 10);
	}
	
	public String getUserVoteStatusOfAnswer(int answer_id,int user_id) {
		Answer answer = (Answer)speakDao.getSpeakWithVoter(answer_id);
		Set<User> s_users = answer.getSupportor();
		Set<User> o_users = answer.getOpponent();
		User voter = userDao.get(user_id);
		if(s_users.contains(voter)){
			return "support";
		}
		
		if(o_users.contains(voter)){
			return "oppose";
		}
		
		return "none";
		
	}
	

}
