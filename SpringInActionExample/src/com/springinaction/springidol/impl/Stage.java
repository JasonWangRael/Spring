package com.springinaction.springidol.impl;

public class Stage {
	/**
	 * Constructor: Stage
	 */
	private Stage() {
	}
	
	private static class StageSingletonHolder{
		static Stage instance = new Stage();
	}
	
	public static Stage getInstance() {
		return StageSingletonHolder.instance;
	}
}
