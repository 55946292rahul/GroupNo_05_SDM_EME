package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.entity.RoomCategory;

import com.example.demo.repository.RoomCategoryRepository;

@Service
public class RoomCategoryService {
	@Autowired
	RoomCategoryRepository rcatrepo;
	
	public List<RoomCategory> getallcategory(){
		return rcatrepo.findAll();
	}

}
