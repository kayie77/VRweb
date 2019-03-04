package org.lwt.VRweb.dao;

import java.util.List;

import	org.lwt.VRweb.model.User;


public interface UserDao {
	User get(Integer id);
	
	Integer save(User user);
	
	void update(User user);
	
	List findByNameAndPass(String uname, String pwd);
	
	public List<User> getAllUser();

	User getUserByUsername(String username);

	List<User> getHotUserByPage(int page_th,int page_size);

	List<User> revealUser(String keyword, int page_th, int page_size);

	User getUserWithFocus(int user_id);

	List<User> getUserFocusByPage(int page_th, int page_size,int uid);
}
