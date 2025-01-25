package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Admission;
import com.example.demo.entity.DemoDischarge;
import com.example.demo.entity.DummyAdmission;
import com.example.demo.repository.AdmissionRepository;
import com.example.demo.repository.RoomRepository;
import com.example.demo.service.AdmissionService;
//@CrossOrigin(origins = "http://localhost:3000")
@RestController
@CrossOrigin
public class AdmissionController {

	@Autowired
	AdmissionService adservice;
	
	@Autowired
	AdmissionRepository adrepo;
	
	@Autowired 
	RoomRepository rrepo;
	
	@PostMapping("/admission")
	public Admission admitPatient(@RequestBody DummyAdmission demo) {
		return adservice.addAdmission(demo);
	}
	
	@GetMapping("/getadmission")
	public List<Admission> getAllAdmission(){
		return adrepo.getAdmittedPatientOnly();
	}
	
	@PutMapping("/updateDischarge")
	public int updateDischargeStatus(@RequestBody DemoDischarge d) {
		rrepo.updateRoomStatusAfterDischarge(d.getRoomid());
		return adrepo.updateAdmissionStatusAndDischargeDate(d.getPatientid());
	}
}
