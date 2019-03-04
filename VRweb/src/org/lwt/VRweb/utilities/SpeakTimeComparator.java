package org.lwt.VRweb.utilities;

import java.util.Comparator;

import org.lwt.VRweb.model.Speak;

public class SpeakTimeComparator implements Comparator {
	@Override
	public int compare(Object o1, Object o2) {
		// TODO Auto-generated method stub
		Speak s1 = (Speak)o1;
		Speak s2 = (Speak)o2;
		return s2.getDate().compareTo(s1.getDate()); 
	}
	
}
