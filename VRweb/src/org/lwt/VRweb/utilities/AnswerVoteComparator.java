package org.lwt.VRweb.utilities;

import java.util.Comparator;

import org.lwt.VRweb.model.Answer;

public class AnswerVoteComparator implements Comparator{

	@Override
	public int compare(Object o1, Object o2) {
		// TODO Auto-generated method stub
		Answer answer1 = (Answer)o1;
		Answer answer2 = (Answer)o2;
		return answer2.getVote() - answer1.getVote(); 
	}
	
}
