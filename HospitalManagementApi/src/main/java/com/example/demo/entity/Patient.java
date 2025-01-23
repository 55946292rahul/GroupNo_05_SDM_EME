package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int patient_id;

    private String fname;
    private String lname;
    
    @Column(name="mob_no")
    private String mobNo;
    
    @Column(name="email_address")
    private String emailAddress;
    
    @Column(name="aadhar_no")
    private String aadharNo;
    
    @Column(name="p_address")
    private String pAddress;
    
    @Column(name="gender")
    private String gender;
    
    @Column(name="blood_grp")
    private String bloodGrp;

    @Temporal(TemporalType.DATE)
    private Date dob;

    @ManyToOne
    @JoinColumn(name = "areaid", referencedColumnName = "aid")
    @JsonIgnoreProperties({"patients"})
    private Area area;

    @ManyToOne
    @JoinColumn(name = "loginid", referencedColumnName = "loginId")
    @JsonIgnoreProperties({"patients"})
    private Login login;
    
    
    @OneToMany(mappedBy = "patient")
    @JsonIgnoreProperties({"patient", "doctor", "room"})
    private List<Admission> admissions;

    // Getters and Setters
}
