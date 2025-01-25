package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.entity.Room;

import com.example.demo.repository.RoomRepository;

@Service
public class RoomService {
	@Autowired
	RoomRepository roomrepo;
	
	public List<Room> getdoctbycatid(int id){
		return roomrepo.findByRoomcatId(id);
	}
	
	public int updateRoom(int id) {
		return roomrepo.updateRoomStatus(id);
	}

	public List<Room> getAllRooms(){
		return roomrepo.getavailablerooms();
	}
	

	
}
