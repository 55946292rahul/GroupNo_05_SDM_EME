package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "city")
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;

    private String name;

    @JsonIgnoreProperties("city")
    @OneToMany(mappedBy = "city")
    private List<Area> areas;

  
}
