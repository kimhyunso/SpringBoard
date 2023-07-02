package org.zerock.contoller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/sample/**")
@Log4j
public class SampleContoller {
	
	@RequestMapping(value="/basic",method= {RequestMethod.GET, RequestMethod.POST})
	public void basicGet() {
		log.info("basic get.............");
		
	}
	
	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		log.info("basic get only get.........");
	}
	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		System.out.println(dto.toString());
		log.info(""+dto);
		return "ex01";
	}
	
	
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
		
		log.info("name : "+name);
		log.info("age : "+age);
		
		System.out.println("name : "+name);
		System.out.println("age : "+age);
		
		return "ex02";
	}
	
	
	
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {
		log.info("array ids : "+ Arrays.toString(ids));
		System.out.println("array ids : "+ Arrays.toString(ids));
		return "ex02Array";
	}
	
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		log.info("list dtos : "+list);
		System.out.println("list dtos : "+list.toString());
		return "ex02Bean";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(sdf, false));
	}
	
	
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo : "+todo);
		System.out.println("todo : "+todo.toString());
		return "ex03";
	}
	
	
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
		log.info("dto : "+dto);
		log.info("page : "+page);
		
		System.out.println("dto : "+dto.toString());
		System.out.println("page : "+page);
		
		return "/sample/ex04";
	}
	
	
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("ex06.........");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("ȫ�浿");
		
		return dto;
	}
	
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07() {
		log.info("ex07.........");
		String msg = "{\"name\": \"ȫ�浿\"}";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type","application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}
	
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload..........");
	}
	
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		files.forEach(file->{
			log.info("------------------------------");
			log.info("name : "+file.getOriginalFilename());
			log.info("size : "+file.getSize());
		});
	}
	 
}
