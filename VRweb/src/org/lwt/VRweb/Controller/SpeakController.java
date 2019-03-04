package org.lwt.VRweb.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.lwt.VRweb.dao.SpeakDao;
import org.lwt.VRweb.model.Answer;
import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Comment;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/speak")
@SessionAttributes("currUser")
public class SpeakController {
	private SpeakManager speakMgr;
	private CategoryManager categoryMgr;

	public SpeakManager getUserMgr() {
		return speakMgr;
	}
	
	@Autowired
	@Qualifier("speakMgr")
	public void setUserMgr(SpeakManager speakMgr) {
		this.speakMgr = speakMgr;
	}
	
	@Autowired
	@Qualifier("categoryMgr")
	public void setCategoryMgr(CategoryManager categoryMgr) {
		this.categoryMgr = categoryMgr;
	}
	public CategoryManager getCategoryMgr() {
		return categoryMgr;
	}
	

	
	//提问页面
	@RequestMapping("/publish")
	public String publishQuestion(Model model) {
		Question question = new Question();
		List<Category> categories = categoryMgr.getCategoryDao().getAllCategory();
		model.addAttribute("categories",categories);
		model.addAttribute(question);
	    return "bbs/speak/publish";
	}
	
	//编辑问题页面
	@RequestMapping(value="/publish/{questionID}",method=RequestMethod.GET)
	public String editQuestion(@PathVariable String questionID,Model model) {
		Question question =(Question) speakMgr.getSpeakDao().get(Integer.parseInt(questionID));
		List<Category> categories = categoryMgr.getCategoryDao().getAllCategory();
		model.addAttribute("categories",categories);
		model.addAttribute(question);
		model.addAttribute("mode","update");
	    return "bbs/speak/publish";
	}	
	
	//生成问题，转到问题页面
	@RequestMapping(value="/publish",method=RequestMethod.POST)
	public String addQuestion(@ModelAttribute("currUser") User user,HttpServletRequest request,@Valid Question question,BindingResult bindingResult,Model model) {
		Integer c_id = Integer.parseInt(request.getParameter("category_id"));
		if(bindingResult.hasErrors()||c_id==-1){
			List<Category> categories = categoryMgr.getCategoryDao().getAllCategory();
			model.addAttribute("categories",categories);
			if(c_id==-1){
				model.addAttribute("cateError","分类不能为空");
			}
			return "bbs/speak/publish";
		}
		Integer q_Id = speakMgr.addQuestion(c_id,user.getId(), question);
		return "redirect:/speak/"+q_Id;
	}
	
	//修改问题，转到问题页面
	@RequestMapping(value="/publish",params="update",method=RequestMethod.POST)
	public String updateQuestion(@ModelAttribute("currUser") User user,HttpServletRequest request,@Valid Question question,BindingResult bindingResult,Model model) {
		Integer c_id = Integer.parseInt(request.getParameter("category_id"));
		if(bindingResult.hasErrors()){
			List<Category> categories = categoryMgr.getCategoryDao().getAllCategory();
			question.setCategory(categoryMgr.getCategoryDao().get(c_id));
			model.addAttribute("categories",categories);
			Integer q_id = Integer.parseInt(request.getParameter("question_id"));
			question.setId(q_id);
			model.addAttribute(question);
			model.addAttribute("mode","update");
			return "bbs/speak/publish";
		}
		Integer q_id = Integer.parseInt(request.getParameter("question_id"));
		question.setId(q_id);
		speakMgr.updateQuestion(c_id,user.getId(),question);
		return "redirect:/speak/"+question.getId();
	}
	
	//添加回答
	@RequestMapping("/process/answer")
	public String addAnswer(@ModelAttribute("currUser") User user,HttpServletRequest request) {
		Integer qid = Integer.parseInt(request.getParameter("question_id"));
		String content = request.getParameter("answer");
		Answer answer = new Answer();
		answer.setContent(content);
		speakMgr.addAnswer(qid, user.getId(), answer);
		return "redirect:/speak/"+qid;
	}
	
		
	//添加评论
	@RequestMapping("/process/remark")
	public String addComment(@ModelAttribute("currUser") User user,HttpServletRequest request) {
		Integer qid = Integer.parseInt(request.getParameter("question_id"));
		Integer sid = Integer.parseInt(request.getParameter("speak_id"));
		String content = request.getParameter("comment");
		speakMgr.addComment(sid, user.getId(), content);
		return "redirect:/speak/"+qid;
	}
	
	//问题展示页面
	@RequestMapping(value="/{questionID}",method=RequestMethod.GET)
	public String showQuestion(@PathVariable String questionID,HttpServletRequest request, Model model) {
		int q_id = Integer.parseInt(questionID);
		Question question = (Question)speakMgr.accessQuestion(q_id);
		String sortkey = request.getParameter("sort_key");
		if(sortkey == null) sortkey = "vote";
		List<Answer> answerList = speakMgr.getOrderedQuestionAnswer(sortkey,q_id);
		model.addAttribute(question);
		model.addAttribute("answers",answerList);
		return "bbs/speak/view";
	}
	
	
	//赞同回答
	@ResponseBody
	@RequestMapping(value="/ajax/support",method=RequestMethod.POST)
	public String ajaxSupportAnswer(HttpServletRequest request) {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		String result = speakMgr.supportAnswer(answer_id, user_id);
		return result;
	}
	
	//反对回答
	@ResponseBody
	@RequestMapping(value="/ajax/oppose",method=RequestMethod.POST)
	public String ajaxOpposeAnswer(HttpServletRequest request) {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		String result = speakMgr.opposeAnswer(answer_id, user_id);
		return result;
	}
	
	//得到用户投票状态
	@ResponseBody
	@RequestMapping(value="/ajax/getuservotestatus",method=RequestMethod.POST)
	public String ajaxUserVoteStatus(HttpServletRequest request) {
		int user_id = Integer.parseInt(request.getParameter("uid"));
		int answer_id = Integer.parseInt(request.getParameter("aid"));
		String result = speakMgr.getUserVoteStatusOfAnswer(answer_id, user_id);
		return result;
	}
		
	//删除评论
	@ResponseBody
	@RequestMapping(value="/ajax/deleteSpeak",method=RequestMethod.POST)
	public String ajaxDeleteSpeak(HttpServletRequest request) {
		int speak_id = Integer.parseInt(request.getParameter("speak_id"));
		int result = speakMgr.getSpeakDao().delete(speak_id);
		return result == 1 ? "success":"fail";
	}
		
}
