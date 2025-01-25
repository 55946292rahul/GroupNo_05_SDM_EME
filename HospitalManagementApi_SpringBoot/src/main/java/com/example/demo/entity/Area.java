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
@Table(name = "area")
public class Area {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int aid;

    private String name;
    private String pincode;

    @ManyToOne
    @JoinColumn(name = "cityid", referencedColumnName = "cid")
    @JsonIgnoreProperties("areas")
    private City city;

   
}
