package org.lwt.VRweb.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.lwt.VRweb.dao.CategoryDao;
import org.lwt.VRweb.dao.SpeakDao;
import org.lwt.VRweb.dao.UserDao;
import org.lwt.VRweb.model.Answer;
import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Comment;
import org.lwt.VRweb.model.Question;
import org.lwt.VRweb.model.User;

public class UserManager {
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

	public void test() {
		
	}

	public int saveUser(User user) {
		// TODO Auto-generated method stub
		return  userDao.save(user);
	}

	public Object login(String uname, String pwd) {
		// TODO Auto-generated method stub
		List result = userDao.findByNameAndPass(uname, pwd);
		return result.size()==0 ? null: result.get(0);
	}

	//∑√Œ ”√ªß
    public User accessUser(int user_id) {
		User user = (User)userDao.get(user_id);
		user.incAC();
		userDao.update(user);
		return user;
    }
    
    public List<User> getHotUser(int num) {
		return userDao.getHotUserByPage(0, num);
	}
    
	public List<User> revealUser(String keyword,int page_th) {
		return userDao.revealUser(keyword, page_th, 10);
	}

	public String focusUser(int user_id,int focus_id) {
		String result = "";
		User focus = userDao.get(focus_id);
		User user = userDao.getUserWithFocus(user_id);
		Set<User> all_focus = user.getFocus();
		if (all_focus.contains(focus)) {
			all_focus.remove(focus);
			result = "unfocus";
		}else{
			all_focus.add(focus);
			result = "focus";
		}	
		userDao.update(user);
		return result;
	}
	
	public String getFocusStatus(int user_id,int focus_id) {
		String result = "";
		User focus = userDao.get(focus_id);
		User user = userDao.getUserWithFocus(user_id);
		Set<User> all_focus = user.getFocus();
		if (all_focus.contains(focus)) {
			result = "focus";
		}else{
			result = "unfocus";
		}	
		return result;
	}
	
	public List<User> getFocusUserByPage(int page_th, int uid) {
		return userDao.getUserFocusByPage(page_th, 7, uid);
	}
}
