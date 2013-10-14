package com.springinaction.springidol.impl;

import java.util.Iterator;
import java.util.Properties;

import com.springinaction.springidol.IPerformer;

public class OneManBand implements IPerformer {

	private Properties instruments;
	
	/**
	 * Constructor: OneManBand
	 */
	public OneManBand() {
		
	}
	
	@Override
	public void perform() {
		//throw new RuntimeException();
		for (Iterator iterator = instruments.keySet().iterator(); iterator.hasNext();){
			String key = (String) iterator.next();
			
			System.out.println(key + " : " + instruments.getProperty(key));
		}

	}

	public Properties getInstruments() {
		return instruments;
	}

	public void setInstruments(Properties instruments) {
		this.instruments = instruments;
	}

}
