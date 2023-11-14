package com.RentalProject.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class betaController {
	
	
@RequestMapping(value="/betaTest")	
public ModelAndView betaTest() {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("betaTest");
	return mav;
}

@RequestMapping(value="/betaChat")	
public ModelAndView betaChat() {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("betaChat");
	return mav;
}

	
@RequestMapping(value="/beta3d")
public ModelAndView beta() throws IOException {
	ModelAndView mav = new ModelAndView();
	System.out.println("베타서비스 페이지");
	File file = new File("src/main/resources/assets/scene.gltf");
	
	System.out.println("FILE: "+file);
	
	mav.setViewName("beta3d");
	return mav;
}


@RequestMapping(value="/getFilePath")
public @ResponseBody String getFilePath() throws IOException{

	ClassPathResource resource = new ClassPathResource("scene.gltf");
	 BufferedReader br = new BufferedReader(new InputStreamReader(resource.getInputStream()));
	   String s = "";
       while((s = br.readLine()) != null){
           System.out.println(s);

       }
       System.out.println("resource: "+resource);
return "";
}
}
