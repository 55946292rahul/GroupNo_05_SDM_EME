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
@Table(name = "login")
public class Login {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int loginId;

    private String username;
    private String pwd;
    private String status;

    @ManyToOne
    @JoinColumn(name = "r_id", referencedColumnName = "r_id")
    @JsonIgnoreProperties
    private Role role;

   
}
