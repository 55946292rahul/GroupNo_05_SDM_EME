package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entity.Doctor;

@Transactional
@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Integer> {
	@Modifying
	@Transactional
	@Query(value="select * from doctor where dept_id= :dpetid",nativeQuery = true)
	public List<Doctor> findByDepartmentId(int dpetid);
}
