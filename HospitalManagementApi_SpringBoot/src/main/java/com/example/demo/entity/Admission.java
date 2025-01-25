package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "admission")
public class Admission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int aid;

    private String status;

    @Temporal(TemporalType.DATE)
    private Date admissionDate;

    @Temporal(TemporalType.DATE)
    private Date dischargeDate;

    @ManyToOne
    @JoinColumn(name = "doctor_id", referencedColumnName = "doctor_id")
    @JsonIgnoreProperties({"admissions", "login"})
    private Doctor doctor;

//    @ManyToOne
//    @JoinColumn(name = "patient_id", referencedColumnName = "patient_id")
//    private Patient patient;
    @ManyToOne
    @JoinColumn(name = "patient_id")
    @JsonIgnoreProperties({"admissions", "login", "area"})
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "room_id", referencedColumnName = "room_id")
    @JsonIgnoreProperties({"roomCategory"})
    private Room room;

    
}
