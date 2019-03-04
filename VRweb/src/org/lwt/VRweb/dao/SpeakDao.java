package org.lwt.VRweb.dao;

import java.util.List;

import org.lwt.VRweb.model.Category;
import org.lwt.VRweb.model.Speak;
import org.lwt.VRweb.model.Answer;
import org.lwt.VRweb.model.Question;

public interface SpeakDao {
	Speak get(Integer id);
	
	Integer save(Speak speak);
	
	void update(Speak speak);
	
	public List<Speak> getAllSpeak();
	
	public List<Speak> getAllSpeakWithAnswers();

	Answer getSpeakWithSuppotor(Integer id);

	Answer getSpeakWithOpponent(Integer id);

	List<Answer> getAnswerOfQuestion(Integer id);

	Answer getSpeakWithVoter(Integer id);
	
	List<Question> getUserQuestions(int user_id);

	List<Answer> getUserAnswers(int user_id);
	
	List<Question> getCategoryQuestions(int category_id);

	int delete(int id);

	List<Question> getUserQuestionsByPage(int page_th, int user_id);

	List<Answer> getUserAnswersByPage(int page_th,int user_id);

	List<Question> getQuestionsByPage(int page_th);

	List<Question> getCategoryQuestionsByPage(int page_th, int category_id);

	List<Question> revealQuestion(String keyword,int page_th,int page_size) ;

	List<Category> revealCategory(String keyword, int page_th, int page_size);
	
}
