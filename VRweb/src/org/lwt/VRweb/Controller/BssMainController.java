package org.lwt.VRweb.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.hibernate.annotations.Parent;
import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Question;
import org.lwt.VRweb.model.Speak;
import org.lwt.VRweb.model.User;
import org.lwt.VRweb.service.impl.CategoryManager;
import org.lwt.VRweb.service.impl.SpeakManager;
import org.lwt.VRweb.service.impl.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/bbs")
public class BssMainController {
	private UserManager userMgr;
	private SpeakManager speakMgr;
	private CategoryManager categoryMgr;
	
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
	
	@Autowired
	@Qualifier("categoryMgr")
	public void setCategoryMgr(CategoryManager categoryMgr) {
		this.categoryMgr = categoryMgr;
	}
	public CategoryManager getCategoryMgr() {
		return categoryMgr;
	}
	
	//ÏÔÊ¾ÍøÕ¾Ê×Ò³
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model) {
		String para = request.getParameter("page");
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		List<Question> questions = speakMgr.getSpeakDao().getQuestionsByPage(page);
		List<Category> categories = categoryMgr.getCategoryDao().getAllCategory();
		List<User> users = userMgr.getHotUser(5);
		model.addAttribute("users",users);
		model.addAttribute("categories",categories);
		model.addAttribute("questions",questions);
	    return "bbs/index";
	}	
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request,Model model) {
		String para = request.getParameter("page");
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		String keyword = request.getParameter("keyword");
		List<Question> questions = speakMgr.revealQuestion(keyword, page);
		List<Category> categories = categoryMgr.revealCategory(keyword, page);
		List<User> users = userMgr.revealUser(keyword, page);
		model.addAttribute("questions",questions);
		model.addAttribute("categories",categories);
		model.addAttribute("users",users);
		model.addAttribute("keyword",keyword);
	    return "bbs/reveal";
	}	
}
