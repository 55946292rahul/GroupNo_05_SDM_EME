package com.example.demo.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DummyAdmission {

	
	private Date admissionDate;
	private int doctorid,patientid,rooomid;
}
