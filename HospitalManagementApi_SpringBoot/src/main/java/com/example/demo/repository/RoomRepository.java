package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


import com.example.demo.entity.Room;

public interface RoomRepository extends JpaRepository<Room, Integer> {
	@Modifying
	@Transactional
	@Query(value="select * from room where roomcatid= :catid and availability = 1 ",nativeQuery = true)
	public List<Room> findByRoomcatId(int catid);
	
	@Modifying
	@Transactional
	@Query(value="update room set availability = 0 where room_id = :id ",nativeQuery = true)
	public int updateRoomStatus(int id);
	
	@Modifying
	@Query(value= "select * from room where availability = 1 ", nativeQuery = true)
	public List<Room> getavailablerooms();
	
	@Modifying
	@Transactional
	@Query(value="update room set availability = 1 where room_id = :roomid ",nativeQuery = true)
	public int updateRoomStatusAfterDischarge(int roomid);
}
	


