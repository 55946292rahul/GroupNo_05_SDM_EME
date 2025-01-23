package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Admission;
import com.example.demo.entity.Doctor;
import com.example.demo.entity.DummyAdmission;
import com.example.demo.entity.Patient;
import com.example.demo.entity.Room;
import com.example.demo.repository.AdmissionRepository;
import com.example.demo.repository.DoctorRepository;
import com.example.demo.repository.PatientRepository;
import com.example.demo.repository.RoomRepository;

@Service
public class AdmissionService {
	
	@Autowired
	AdmissionRepository admissionrepo;
	
	@Autowired
	PatientRepository prepo;
	
	@Autowired
	DoctorRepository drepo;
	
	@Autowired
	RoomRepository rrepo;
	
	public Admission addAdmission(DummyAdmission demo) {
	Patient p=prepo.findById(demo.getPatientid()).get();
	Room r= rrepo.findById(demo.getRooomid()).get();
	Doctor d= drepo.findById(demo.getDoctorid()).get();
	Admission a = new Admission();
	a.setAdmissionDate(demo.getAdmissionDate());
	a.setStatus("1");
	a.setRoom(r);
	a.setDoctor(d);
	a.setPatient(p);
	return admissionrepo.save(a);
}
	
}
