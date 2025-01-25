package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Patient;
import com.example.demo.service.PatientService;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class PatientController {
	@Autowired
	PatientService patientserv;
	
	@GetMapping("/getById/{id}")
	public Patient getPatientById(@PathVariable int id) {
		return  patientserv.getPatientById(id);
	
	}
	

}
