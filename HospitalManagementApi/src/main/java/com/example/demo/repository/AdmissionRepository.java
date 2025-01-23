package com.example.demo.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Admission;
import com.example.demo.entity.AdmissionRequest;

import jakarta.transaction.Transactional;
@Repository
@Transactional
public interface AdmissionRepository extends JpaRepository<Admission, Integer> {
	
	@Modifying
	@Query(value = "select * from admission where status = 1" ,nativeQuery = true)
	public List<Admission> getAdmittedPatientOnly();
	
	@Modifying
	@Transactional
	@Query(value = "update admission set status = 0 , discharge_date = curdate() where aid = :aid",nativeQuery = true)
	public int updateAdmissionStatusAndDischargeDate(int aid);
}
