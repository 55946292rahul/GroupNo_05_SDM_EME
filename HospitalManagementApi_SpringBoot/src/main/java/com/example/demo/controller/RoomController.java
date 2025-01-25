package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;


import com.example.demo.entity.Room;
import com.example.demo.service.RoomService;

@RestController
@CrossOrigin
public class RoomController {
	@Autowired
	RoomService roomser;
	
	@GetMapping("/getroombycatid/{id}")
	public List<Room> getRoomByCatid(@PathVariable int id){
		return roomser.getdoctbycatid(id);
	}
	
	@GetMapping("/availablerooms")
	public List<Room> getAllRoom(){
		return roomser.getAllRooms();
	}
	
	@PutMapping("/updateRoomStatus/{id}")
	public int updateRoom(@PathVariable int id) {
		return roomser.updateRoom(id);
	}

}
