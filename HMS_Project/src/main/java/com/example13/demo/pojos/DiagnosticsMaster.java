package com.example13.demo.pojos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DiagnosticsMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int testId;
	private String testName;
    private int chargeForTest;
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public int getChargeForTest() {
		return chargeForTest;
	}
	public void setChargeForTest(int chargeForTest) {
		this.chargeForTest = chargeForTest;
	}
	@Override
	public String toString() {
		return "DiagnosticsMaster [testId=" + testId + ", testName=" + testName + ", chargeForTest=" + chargeForTest
				+ "]";
	}
	public DiagnosticsMaster(int testId, String testName, int chargeForTest) {
		super();
		this.testId = testId;
		this.testName = testName;
		this.chargeForTest = chargeForTest;
	}
	public DiagnosticsMaster() {
		super();
	}
	
	

}
