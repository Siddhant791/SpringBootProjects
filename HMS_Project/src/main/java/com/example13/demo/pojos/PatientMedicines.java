package com.example13.demo.pojos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PatientMedicines {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int Sno;
	private String medicineIssued;
	private int quantityIssued;
	
	public String getMedicineIssued() {
		return medicineIssued;
	}
	public void setMedicineIssued(String medicineIssued) {
		this.medicineIssued = medicineIssued;
	}
	public PatientMedicines(String medicineIssued, int quantityIssued) {
		super();
	
		this.medicineIssued = medicineIssued;
		this.quantityIssued = quantityIssued;
	}
	public int getQuantityIssued() {
		return quantityIssued;
	}
	public void setQuantityIssued(int quantityIssued) {
		this.quantityIssued = quantityIssued;
	}
	
	
	@Override
	public String toString() {
		return "PatientMedicines [Sno=" + Sno + ", medicineIssued=" + medicineIssued + ", quantityIssued="
				+ quantityIssued + "]";
	}
	public PatientMedicines() {
		super();
	}
	public int getSno() {
		return Sno;
	}
	public void setSno(int sno) {
		Sno = sno;
	}
	
	
	

}
