package com.accenture.mircoservice.controller;

import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.accenture.mircoservice.Data.Student;

@Controller
public class HomeController {

	@Autowired
	private RestTemplate restTemplate;
	@GetMapping("/")
	public String getStudent(Model model) {
		ArrayList obj = restTemplate.getForObject("http://localhost:8081/api/v1/student/getStudent", ArrayList.class);
		model.addAttribute("obj",obj);
		return "home";
	}
	
	@GetMapping("/addStudent")
	public String goToStudent(Model model) {
		getStudent(model);
		return "addStudent";
	}
	
	@PostMapping("/")
	public String addStudent(Model model, @RequestParam String name, 
			@RequestParam String email,@RequestParam String department, 
			@RequestParam Long phone,@RequestParam Integer age ) {
		LinkedHashMap status = (LinkedHashMap) restTemplate.postForObject("http://localhost:8081/api/v1/student/saveStudent?name="+name+"&email="+email+"&department="+department+"&phone="+phone+"&age="+age, null,Object.class);
		model.addAttribute("status",status);
		ArrayList obj = restTemplate.getForObject("http://localhost:8081/api/v1/student/getStudent", ArrayList.class);
		model.addAttribute("obj",obj);
		return "home";
	}
	
	@GetMapping("/deleteStudent/{id}")
	public String deleteStudent(Model model,@PathVariable("id") int id) {
		restTemplate.delete("http://localhost:8081/api/v1/student/deleteStudent?id="+id);
		LinkedHashMap deleteStatus = new LinkedHashMap<>();
		deleteStatus.put("deleteID", id);
		deleteStatus.put("deleteStatus", true);
		model.addAttribute("deleteStatus",deleteStatus);
		ArrayList obj = restTemplate.getForObject("http://localhost:8081/api/v1/student/getStudent", ArrayList.class);
		model.addAttribute("obj",obj);
		return "home";
	}
	
	@GetMapping("/updateStudent/{id}")
	public String updateStudent(Model model,@PathVariable("id") int id) {
		getStudent(model);
		model.addAttribute("id",id);
		LinkedHashMap object = restTemplate.getForObject("http://localhost:8081/api/v1/student/getStudentById?id="+id, LinkedHashMap.class);
		model.addAttribute("object",object);
		return "UpdateStudent";
	}
}




