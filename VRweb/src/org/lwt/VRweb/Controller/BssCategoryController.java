package org.lwt.VRweb.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.City;
import org.lwt.VRweb.model.Question;
import org.lwt.VRweb.service.impl.CategoryManager;
import org.lwt.VRweb.service.impl.CityManager;
import org.lwt.VRweb.service.impl.SpeakManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/category")
public class BssCategoryController {
	private SpeakManager speakMgr;
	private CategoryManager categoryMgr;
	private CityManager cityMgr;

	@Autowired
	@Qualifier("speakMgr")
	public void setUserMgr(SpeakManager speakMgr) {
		this.speakMgr = speakMgr;
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
	
	@Autowired
	@Qualifier("cityMgr")
	public void setCityMgr(CityManager cityMgr) {
		this.cityMgr = cityMgr;
	}
	public CityManager getCityMgr() {
		return cityMgr;
	}
	
	
	//显示所有学校
	@RequestMapping("/")
	public String ShowAllCategory(Model model){
		List<Category> categories = categoryMgr.getCategoryDao().getAllCategory();
		List<City> allCity = cityMgr.getCityDao().getAllCity();
		model.addAttribute("categories",categories);
		model.addAttribute("allCity",allCity);
		return "bbs/category/all";
	}
	
	//显示当前学校
	@RequestMapping(value="/{category_id}",method=RequestMethod.GET)
	public String showCategory(@PathVariable String category_id, HttpServletRequest request,Model model){
		Category category;
		String para = request.getParameter("page");	
		int cid = Integer.parseInt(category_id);
		if (para == null) {
			para = "1";
			category = speakMgr.accessCategory(cid);
		}else{
			category = speakMgr.getCategoryDao().get(cid);
		}	
		int page = Integer.parseInt(para);
		List<Question> questions = speakMgr.getSpeakDao().getCategoryQuestionsByPage(page, cid);
		model.addAttribute("category",category);
		model.addAttribute("questions",questions);
		return "bbs/category/view";
	}
	
	 //已经根据类型选择再根据城市选择校园论坛
	@RequestMapping(value="/city/{city_id}",method=RequestMethod.GET)
	public String selectScenicByCity(@PathVariable int city_id, HttpServletRequest request,Model model){
		List<Category> categoryList;
		String para = request.getParameter("page");	
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		categoryList = categoryMgr.getCategoryDao().getShoolByCity(page, city_id);
		model.addAttribute("categoryList",categoryList);
		return "bbs/category/finalSelectShool";
	}
}
