package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Doctor;
import com.example.demo.repository.DoctorRepository;


@Service
public class DoctorService {
	@Autowired
	DoctorRepository drepo;
	
	public List<Doctor> getDocByDeptId(int id){
		return drepo.findByDepartmentId(id);
	}

}
