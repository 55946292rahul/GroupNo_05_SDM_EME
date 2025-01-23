package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.AdmissionRequest;
import com.example.demo.entity.DemoEntity;
import com.example.demo.service.AdmissionRequestService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class AdmissionRequestController {
	  @Autowired
	  private AdmissionRequestService admissionReqSer;

	    @GetMapping("/admissionRequests")
	    public List<AdmissionRequest> getAdmissionRequests() {
	        return admissionReqSer.getAllAdmissionRequests();
	    }
	    
	    @PostMapping("admitpatient")
	    public AdmissionRequest addAdmissionRequest(@RequestBody DemoEntity demo) {
	    	
	    	
	    	
	    	return admissionReqSer.addAdmissionRequest(demo);
	    }
	    
	    @PutMapping("/updatereqstatus/{id}")
	    public int updateReqStatus(@PathVariable int id) {
	    	return admissionReqSer.uppdate(id);
	    }
	    

}
