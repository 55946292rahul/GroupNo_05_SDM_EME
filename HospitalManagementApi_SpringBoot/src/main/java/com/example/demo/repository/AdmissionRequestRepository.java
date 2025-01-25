package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entity.AdmissionRequest;
@Transactional
public interface AdmissionRequestRepository extends JpaRepository<AdmissionRequest,Integer> {

	@Modifying
	@Query(value = "select * from admission_request where status = 1",nativeQuery = true)
	public List<AdmissionRequest> getPendingRequest();
	
	@Modifying
	@Query(value="update admission_request set status = 0 where adid = :adid ",nativeQuery = true)
	public int updateAdmissionRequest(int adid);
}
