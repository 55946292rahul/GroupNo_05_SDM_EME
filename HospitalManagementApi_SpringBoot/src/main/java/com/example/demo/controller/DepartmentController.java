package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Department;
import com.example.demo.repository.DepartmentRepository;
import com.example.demo.service.DepartmentService;

@RestController
@CrossOrigin
public class DepartmentController {
	@Autowired
    DepartmentService dservice;

    @GetMapping("/getalldept")
    public List<Department> getAllDepartments() {
        return dservice.getallDept();
    }

}
