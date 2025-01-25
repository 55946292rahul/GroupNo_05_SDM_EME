package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Area;

public interface CityRepository extends JpaRepository<Area, Integer> {

}
