package com.springinaction.springidol.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.springinaction.springidol.IPerformer;

public class MainTest {

	/**
	 * @param args
	 * @description
	 */
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("springidol.xml");
		
		IPerformer hank =  (IPerformer) context.getBean("hank");
		hank.perform();

	}

}
