package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Doctor;

import com.example.demo.service.DoctorService;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class DoctorController {
	
	@Autowired
	DoctorService dser;
	
	@GetMapping("/getdoctorbydeptid/{id}")
	public List<Doctor> getDoctorById(@PathVariable int id){
		return dser.getDocByDeptId(id);
	}
	
}
