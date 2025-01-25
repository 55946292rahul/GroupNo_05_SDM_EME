package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "room")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int room_id;

    @Column(name = "room_number")
    private String roomNumber;
    
    @Column(name = "room_type")
    private String roomType;
    
    @Column(name = "availability")
    private Boolean availability; 
    
    @Column(name = "price")
    private Float price; 

    @ManyToOne
    @JoinColumn(name = "roomcatid")
    @JsonIgnoreProperties({"rooms"})
    private RoomCategory roomCategory;
}
