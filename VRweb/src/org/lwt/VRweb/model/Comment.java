package org.lwt.VRweb.model;

import java.util.HashSet;
import java.util.Set;

public class Comment extends Speak {
	private Speak speak;
	
	public Comment() {
		super();
	}

	public Comment(Speak speak) {
		super();
		this.speak = speak;
	}

	public Speak getSpeak() {
		return speak;
	}

	public void setSpeak(Speak speak) {
		this.speak = speak;
	}
	
	
}
