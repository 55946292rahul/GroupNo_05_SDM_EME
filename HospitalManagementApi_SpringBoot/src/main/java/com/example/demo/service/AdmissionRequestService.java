package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.AdmissionRequest;
import com.example.demo.entity.DemoEntity;
import com.example.demo.repository.AdmissionRequestRepository;
import com.example.demo.repository.DoctorRepository;
import com.example.demo.repository.PatientRepository;


@Service
public class AdmissionRequestService {
	
	@Autowired
    AdmissionRequestRepository admissionReqRepo;
	
	@Autowired
	PatientRepository prepo;
	
	@Autowired
	DoctorRepository doctrepo;

    public List<AdmissionRequest> getAllAdmissionRequests() {
        return admissionReqRepo.getPendingRequest();
    }

    public AdmissionRequest addAdmissionRequest(DemoEntity demo) {
    	AdmissionRequest adreq= new AdmissionRequest();
    	adreq.setAdid(demo.getDid());
    	adreq.setDate(demo.getDate());
    	adreq.setReason(demo.getReason());
    	adreq.setPatient(prepo.findById(demo.getPid()).get());
    	adreq.setDoctor(doctrepo.findById(demo.getDid()).get());
    	adreq.setStatus(true);
    	return admissionReqRepo.save(adreq);
    }
    public int uppdate(int id) {
		return admissionReqRepo.updateAdmissionRequest(id);
	}
}
