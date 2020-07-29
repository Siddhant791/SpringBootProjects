package com.example13.demo.pojos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PatientDiagnostics {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int Snoo;
	
	
	private String testName1;


	public int getSnoo() {
		return Snoo;
	}



	public void setSnoo(int snoo) {
		Snoo = snoo;
	}



	public String getTestName1() {
		return testName1;
	}



	public void setTestName1(String testName1) {
		this.testName1 = testName1;
	}

	
	@Override
	public String toString() {
		return "PatientDiagnostics [Snoo=" + Snoo + ", testName1=" + testName1 + "]";
	}



	public PatientDiagnostics(String testName1) {
		super();
		this.testName1 = testName1;
	}

	public PatientDiagnostics() {
		super();
	}
	
	
	
	
}
