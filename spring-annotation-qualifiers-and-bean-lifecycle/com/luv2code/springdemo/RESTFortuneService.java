package com.luv2code.springdemo;

import org.springframework.stereotype.Component;

@Component // creates RESTFortuneService bean, not rESTFortuneService
public class RESTFortuneService implements FortuneService {

	@Override
	public String getFortune() {
		return null;
	}

}
