package org.lwt.VRweb.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lwt.VRweb.model.City;
import org.lwt.VRweb.service.impl.CityManager;
import org.lwt.VRweb.service.impl.ScenicManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/city")
public class CityController {
	private CityManager cityMgr;

	@Autowired
	@Qualifier("cityMgr")
	public void setCityMgr(CityManager cityMgr) {
		this.cityMgr = cityMgr;
	}
	
	public CityManager getCityMgr() {
		return cityMgr;
	}
	
	//显示所有翻译类型
	@RequestMapping("/")
	public String ShowAllCity(Model model){
		List<City> allcity = cityMgr.getCityDao().getAllCity();
		model.addAttribute("allcity",allcity);
		return "city/all";
	}
		
	//显示根据城市选择场景
	@RequestMapping(value="/{city_id}",method=RequestMethod.GET)
	public String showScenicByCity(@PathVariable int city_id, HttpServletRequest request,Model model){
		City city;
		String para = request.getParameter("page");	
		if (para == null) {
			para = "1";
			city = cityMgr.getCityDao().get(city_id);
		}else{
			city = cityMgr.getCityDao().get(city_id);
		}	
		model.addAttribute("city",city);
		return "city/view";
	}
}
