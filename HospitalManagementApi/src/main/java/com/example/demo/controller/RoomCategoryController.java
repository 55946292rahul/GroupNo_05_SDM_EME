package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


import com.example.demo.entity.RoomCategory;

import com.example.demo.service.RoomCategoryService;

@RestController
@CrossOrigin
public class RoomCategoryController {
	
	@Autowired
   RoomCategoryService rcatservice;

    @GetMapping("/getallcat")
    public List<RoomCategory> getAllDepartments() {
        return rcatservice.getallcategory();
    }

}
