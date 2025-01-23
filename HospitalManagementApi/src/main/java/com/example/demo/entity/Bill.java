package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "bill")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int billId;

    private float amount;

    @Temporal(TemporalType.DATE)
    private Date dischargeDate;

    @Temporal(TemporalType.DATE)
    private Date billDate;

    private String status;

    @ManyToOne
    @JoinColumn(name = "did", referencedColumnName = "doctor_id")
    @JsonIgnoreProperties
    private Doctor doctor;

    @ManyToOne
    @JoinColumn(name = "cat_id", referencedColumnName = "roomcatid")
    @JsonIgnoreProperties
    private RoomCategory category;

    @ManyToOne
    @JoinColumn(name = "admission_id", referencedColumnName = "aid")
    @JsonIgnoreProperties
    private Admission admission;

   
}
