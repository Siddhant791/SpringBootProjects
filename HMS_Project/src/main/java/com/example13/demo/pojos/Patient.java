package com.example13.demo.pojos;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Patient {
	
	@Id
	private int patientId;
	private static int count=100000000;
	private long patientSsnId;
	private String name;
	private int age;
	private String Dob;
	private String typeOfBed;
	private String address;
	private String state;
	private String city;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "patId",referencedColumnName = "patientId")
	List<PatientMedicines> allMedicinesForPatient=new ArrayList<>();
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "patId",referencedColumnName = "patientId")
	List<PatientDiagnostics> allDiagnosticsForPatient=new ArrayList<>();
	
	public List<PatientDiagnostics> getAllDiagnosticsForPatient() {
		return allDiagnosticsForPatient;
	}
	public void setAllDiagnosticsForPatient(List<PatientDiagnostics> allDiagnosticsForPatient) {
		this.allDiagnosticsForPatient = allDiagnosticsForPatient;
	}
	public List<PatientMedicines> getAllMedicines() {
		return allMedicinesForPatient;
	}
	public void setAllMedicines(List<PatientMedicines> allMedicines) {
		this.allMedicinesForPatient = allMedicines;
	}
	public Patient() {
		super();
		this.patientId = (int) ((Math.random()*Math.random()*count++))*10;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public long getPatientSsnId() {
		return patientSsnId;
	}
	public void setPatientSsnId(long patientSsnId) {
		this.patientSsnId = patientSsnId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDob() {
		return Dob;
	}
	public void setDob(String dob) {
		Dob = dob;
	}
	public String getTypeOfBed() {
		return typeOfBed;
	}
	public void setTypeOfBed(String typeOfBed) {
		this.typeOfBed = typeOfBed;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Patient [patientId=" + patientId + ", patientSsnId=" + patientSsnId + ", name=" + name + ", age=" + age
				+ ", Dob=" + Dob + ", typeOfBed=" + typeOfBed + ", address=" + address + ", state=" + state + ", city="
				+ city + "]";
	}
	public Patient(int patientId, long patientSsnId, String name, int age, String dob, String typeOfBed, String address,
			String state, String city) {
		super();
		this.patientId = patientId;
		this.patientSsnId = patientSsnId;
		this.name = name;
		this.age = age;
		Dob = dob;
		this.typeOfBed = typeOfBed;
		this.address = address;
		this.state = state;
		this.city = city;
		//this.allMedicines = allMedicines;
	}

	
	
}
