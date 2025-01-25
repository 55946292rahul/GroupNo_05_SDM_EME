package com.example.demo.entity;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "admission_request")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AdmissionRequest {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int adid;
    @ManyToOne
    @JoinColumn(name = "did", referencedColumnName = "doctor_id", nullable = false)
    @JsonIgnoreProperties
    private Doctor doctor;
    
    
    @ManyToOne
    @JoinColumn(name = "pid", referencedColumnName = "patient_id", nullable = false)
    @JsonIgnoreProperties
    private Patient patient;
    

    private Date date;

    private String reason;
    
    private boolean status;
}
