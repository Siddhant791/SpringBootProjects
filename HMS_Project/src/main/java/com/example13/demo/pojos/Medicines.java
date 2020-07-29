package com.example13.demo.pojos;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Medicines {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int medicineId;
	private String medicineName;
	private int quantityAvailable;
	private int quantityNeeded;
	private int rate;
	private int amount;
	
	public int getQuantityNeeded() {
		return quantityNeeded;
	}
	public void setQuantityNeeded(int quantityNeeded) {
		this.quantityNeeded = quantityNeeded;
	}
	
	
	public int getMedicineId() {
		return medicineId;
	}
	public void setMedicineId(int medicineId) {
		this.medicineId = medicineId;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public int getQuantityAvailable() {
		return quantityAvailable;
	}
	public void setQuantityAvailable(int quantityAvailable) {
		this.quantityAvailable = quantityAvailable;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	public Medicines(int medicineId, String medicineName, int quantityAvailable, int quantityNeeded, int rate,
			int amount) {
		super();
		this.medicineId = medicineId;
		this.medicineName = medicineName;
		this.quantityAvailable = quantityAvailable;
		this.quantityNeeded = quantityNeeded;
		this.rate = rate;
		this.amount = amount;
		
	}
	@Override
	public String toString() {
		return "Medicines [medicineId=" + medicineId + ", medicineName=" + medicineName + ", quantityAvailable="
				+ quantityAvailable + ", rate=" + rate + ", amount=" + amount + "]";
	}
	public Medicines() {
		super();
	}
	

}

