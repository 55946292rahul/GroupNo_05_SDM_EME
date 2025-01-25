package com.example.demo.entity;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DemoEntity {
	private int did;
	private int pid;
	private String reason;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date date;
	private int status;
	@Override
	public String toString() {
		return "DemoEntity [did=" + did + ", pid=" + pid + ", reason=" + reason + ", date=" + date + ", status="
				+ status + "]";
	}
	
	

}
