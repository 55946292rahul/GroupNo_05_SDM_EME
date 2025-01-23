package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.concurrent.TimeUnit;
import com.example.demo.entity.Admission;
import com.example.demo.entity.Bill;
import com.example.demo.entity.DemoBill;
import com.example.demo.entity.Doctor;
import com.example.demo.entity.Room;
import com.example.demo.entity.RoomCategory;
import com.example.demo.repository.AdmissionRepository;
import com.example.demo.repository.BillRepository;
import com.example.demo.repository.DoctorRepository;
import com.example.demo.repository.RoomRepository;

@Service
public class BillService {
	
	@Autowired
	BillRepository brepo;
	
	@Autowired
	AdmissionRepository arepo;
	
	@Autowired
	DoctorRepository drepo;
	
	@Autowired
	RoomRepository rid;
	
	public Bill generateBill(DemoBill bill) {
		Bill b= new Bill();
		Admission a= arepo.findById(bill.getAdmissionid()).get();
		b.setAdmission(a);
		Doctor d= drepo.findById(bill.getDid()).get();
		b.setDoctor(d);
		Room rm= new Room();
		rm=a.getRoom();
		RoomCategory rc=rm.getRoomCategory();
		b.setCategory(rc);
		/////////////
		long startTime = a.getAdmissionDate().getTime();
        long endTime = a.getDischargeDate().getTime();

        // Calculate the difference in milliseconds
        long diffInMillis = endTime - startTime;

        // Convert milliseconds to days
        int n=(int)(TimeUnit.DAYS.convert(diffInMillis, TimeUnit.MILLISECONDS));
		//////////////
        
        float amount = Math.abs(n*rm.getPrice());
        b.setAmount(amount);
        b.setDischargeDate(a.getDischargeDate());
        b.setStatus("Pending");
		return brepo.save(b);
	}

}
