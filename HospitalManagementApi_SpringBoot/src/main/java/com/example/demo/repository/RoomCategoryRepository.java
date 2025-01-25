package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.RoomCategory;

public interface RoomCategoryRepository extends JpaRepository<RoomCategory, Integer> {
	

}
