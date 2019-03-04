package org.lwt.VRweb.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.VRweb.model.City;
import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Scenic;
import org.lwt.VRweb.service.impl.CityManager;
import org.lwt.VRweb.service.impl.ScenicManager;
import org.lwt.VRweb.service.impl.CategoryManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private CityManager cityMgr;
	private CategoryManager categoryMgr;
	private ScenicManager scenicMgr;
	
	@Autowired
	@Qualifier("cityMgr")
	public void setCityMgr(CityManager cityMgr) {
		this.cityMgr = cityMgr;
	}
	public CityManager getCityMgr() {
		return cityMgr;
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
	@Qualifier("scenicMgr")
	public void setScenicMgr(ScenicManager scenicMgr) {
		this.scenicMgr = scenicMgr;
	}
	public ScenicManager getScenicMgr() {
		return scenicMgr;
	}

	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model) {
		List<City> allcity = cityMgr.getCityDao().getAllCity();
		List<Category> allCategory = categoryMgr.getCategoryDao().getAllCategory();
		List<Scenic> scenicList= scenicMgr.getScenicDao().getHotScenic(3);
		model.addAttribute("allcity",allcity);
		model.addAttribute("allCategory",allCategory);
		model.addAttribute("scenicList",scenicList);
		 return "index";
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request,Model model) {
		String para = request.getParameter("page");
		if (para == null) {
			para = "1";
		}
		int page = Integer.parseInt(para);
		String keyword = request.getParameter("keyword");
		System.out.println("¹Ø¼ü×Ö"+keyword);
		List<Category> categoryList = categoryMgr.revealCategory(keyword, page);
		model.addAttribute("categoryList",categoryList);
	    return "category/finalSelectShool";
	    
	}	
	
}
