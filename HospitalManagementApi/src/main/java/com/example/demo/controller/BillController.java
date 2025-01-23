package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Bill;
import com.example.demo.entity.DemoBill;
import com.example.demo.service.BillService;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class BillController {
	
	@Autowired
	BillService bservice;
	
	@PostMapping("/generateBill")
	public Bill generateBill(@RequestBody DemoBill bill) {
		return bservice.generateBill(bill);
	}
	

}
