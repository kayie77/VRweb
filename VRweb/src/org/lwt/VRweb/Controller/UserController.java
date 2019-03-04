package org.lwt.VRweb.Controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.lwt.VRweb.model.Answer;
import org.lwt.VRweb.model.Question;
import org.lwt.VRweb.model.User;
import org.lwt.VRweb.service.impl.SpeakManager;
import org.lwt.VRweb.service.impl.UserManager;
import org.lwt.VRweb.utilities.SpeakTimeComparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.HttpRequestHandlerAdapter;

import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.inject.Inject;

import edu.emory.mathcs.backport.java.util.Collections;

@Controller
@RequestMapping("/user")
@SessionAttributes("currUser")
public class UserController {
	private UserManager userMgr;
	private SpeakManager speakMgr;

	
	@Autowired
	@Qualifier("speakMgr")
	public void setUserMgr(SpeakManager speakMgr) {
		this.speakMgr = speakMgr;
	}
	
	@Autowired
	@Qualifier("userMgr")
	public void setUserMgr(UserManager userMgr) {
		this.userMgr = userMgr;
	}
	public UserManager getUserMgr() {
		return userMgr;
	}
	public SpeakManager getSpeakMgr() {
		return speakMgr;
	}
	
	
	@RequestMapping("/login") 
	public String login() {
		return "bbs/user/login";
	}
	
	@RequestMapping("/register") 
	public String register(Model model) {
		User user = new User();
		model.addAttribute(user);
		return "bbs/user/register";
	}
	
	@RequestMapping(value="/process/register", method = RequestMethod.POST)
	public String createUser(@Valid User user, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()){
			return "bbs/user/register";
		}
		userMgr.saveUser(user);
		model.addAttribute("currUser", user);
		return "redirect:/bbs/index";
	}
	
	@RequestMapping(value="/process/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		String uname = request.getParameter("username");
		String pwd = request.getParameter("password");
		User user = (User) userMgr.login(uname, pwd); 
		if(user==null){
			return "redirect:/bbs/user/login?error=1";
		}else{
			model.addAttribute("currUser", user);
			return "redirect:/bbs/index";
		}
	}
	
	//显示所有用户
	@RequestMapping("/")
	public String showHotUser(HttpServletRequest request,Model model){
		String para = request.getParameter("page");
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		List<User> userList = userMgr.getUserDao().getHotUserByPage(page,10);
		model.addAttribute("userList",userList);
		return "bbs/user/all";
	}

	//展示用户信息页面
	@RequestMapping(value="/{user_id}",method=RequestMethod.GET)
	public String showUser(@PathVariable String user_id, HttpServletRequest request,Model model){
		User user;
		String para = request.getParameter("page");
		if (para == null) {
			para = "1";
			user = (User)userMgr.accessUser(Integer.parseInt(user_id));
		}else{
			user = userMgr.getUserDao().get(Integer.parseInt(user_id));
		}
		int page = Integer.parseInt(para);		
		List<Question> questions = speakMgr.getSpeakDao().getUserQuestionsByPage(page, user.getId());
		List<Answer> answers = speakMgr.getSpeakDao().getUserAnswersByPage(page, user.getId());
		List<User> focuslList = userMgr.getFocusUserByPage(page,user.getId());
		Collections.sort(questions,new SpeakTimeComparator());
		Collections.sort(answers,new SpeakTimeComparator());
		model.addAttribute("questions",questions);
		model.addAttribute("answers",answers);
		model.addAttribute("user",user);
		model.addAttribute("focuslList",focuslList);
		return "bbs/user/view";
	}
	
	//编辑展示用户资料首页
	@RequestMapping(value="/curruser",params="update",method=RequestMethod.GET)
	public String editUserInfo(@ModelAttribute("currUser") User currUser,HttpServletRequest request,Model model) {
		User user = new User();
		user.setSex(currUser.getSex());
		user.setOneWord(currUser.getOneWord());
		user.setPersonalDescribe(currUser.getPersonalDescribe());
		model.addAttribute("user", user);
		return "bbs/user/edit";
	}
	
	//编辑展示用户资料首页
	@RequestMapping(value="/curruser",params="update",method=RequestMethod.POST)
	public String updateUserInfo(@ModelAttribute("currUser") User currUser,HttpServletRequest request,Model model) {
		currUser.setSex(request.getParameter("sex"));
		currUser.setOneWord(request.getParameter("oneWord"));
		currUser.setPersonalDescribe(request.getParameter("personalDescribe"));
		userMgr.getUserDao().update(currUser);
		model.addAttribute("currUser",currUser);
		return "redirect:/user/"+currUser.getId();
	}
	
	//登出系统
	@RequestMapping(value="/curruser",params="logout",method=RequestMethod.GET)
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/bbs/index";
	}
	
	//关注用户
	@ResponseBody
	@RequestMapping(value="/ajax/focususer",method=RequestMethod.POST)
	public String focusUser(HttpServletRequest request) {
		int user_id = Integer.parseInt(request.getParameter("uid"));
		int focus_id = Integer.parseInt(request.getParameter("fid"));
		String result = userMgr.focusUser(user_id, focus_id);
		return result;
	}
	
	//得到关注状态
	@ResponseBody
	@RequestMapping(value="/ajax/getfocusstatus",method=RequestMethod.POST)
	public String getFocusStatus(HttpServletRequest request) {
		int user_id = Integer.parseInt(request.getParameter("uid"));
		int focus_id = Integer.parseInt(request.getParameter("fid"));
		String result = userMgr.getFocusStatus(user_id, focus_id);
		return result;
	}
}
