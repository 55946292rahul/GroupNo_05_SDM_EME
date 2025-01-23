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
@Table(name = "doctor")
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int doctor_id;

    private String dfName;
    private String dlName;
    private String mobileNo;
    private String emailId;
    private String dAddress;
    private String registrationId;

    @Temporal(TemporalType.DATE)
    private Date doj;

    private String specialization;

    @ManyToOne
    @JoinColumn(name = "dept_id")
    @JsonIgnoreProperties({"doctors"})
    private Department department;

    @ManyToOne
    @JoinColumn(name = "loginId")
    @JsonIgnoreProperties({"doctor"})
    private Login login;

   
}
