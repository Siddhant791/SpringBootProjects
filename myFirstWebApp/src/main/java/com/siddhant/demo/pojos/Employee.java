package com.siddhant.demo.pojos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

//@Component
@Entity
public class Employee {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String name;
	private String gender;
	private String phone;
	private String qualification;
	private String district;
	private String state;
	private String canSpeakEnglish;
	private String workedBefore;
	private String discDate;
	private String action;
	private String drivingLicence;
	private String bike;
	private String other;
	private String offered;
	
	public Employee() {
		
	}
	public Employee(int id, String name, String gender, String phone, String qualification, String district,
			String state, String canSpeakEnglish, String workedBefore, String discDate, String action,
			String drivingLicence, String bike, String other, String offered) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.qualification = qualification;
		this.district = district;
		this.state = state;
		this.canSpeakEnglish = canSpeakEnglish;
		this.workedBefore = workedBefore;
		this.discDate = discDate;
		this.action = action;
		this.drivingLicence = drivingLicence;
		this.bike = bike;
		this.other = other;
		this.offered = offered;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCanSpeakEnglish() {
		return canSpeakEnglish;
	}
	public void setCanSpeakEnglish(String canSpeakEnglish) {
		this.canSpeakEnglish = canSpeakEnglish;
	}
	public String getWorkedBefore() {
		return workedBefore;
	}
	public void setWorkedBefore(String workedBefore) {
		this.workedBefore = workedBefore;
	}
	public String getDiscDate() {
		return discDate;
	}
	public void setDiscDate(String discDate) {
		this.discDate = discDate;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getDrivingLicence() {
		return drivingLicence;
	}
	public void setDrivingLicence(String drivingLicence) {
		this.drivingLicence = drivingLicence;
	}
	public String getBike() {
		return bike;
	}
	public void setBike(String bike) {
		this.bike = bike;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getOffered() {
		return offered;
	}
	public void setOffered(String offered) {
		this.offered = offered;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", gender=" + gender + ", phone=" + phone + ", qualification="
				+ qualification + ", district=" + district + ", state=" + state + ", canSpeakEnglish=" + canSpeakEnglish
				+ ", workedBefore=" + workedBefore + ", discDate=" + discDate + ", action=" + action
				+ ", drivingLicence=" + drivingLicence + ", bike=" + bike + ", other=" + other + ", offered=" + offered
				+ "]";
	}
	
	
	
	
}
