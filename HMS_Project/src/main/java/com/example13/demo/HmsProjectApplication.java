package com.example13.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.example13.demo.dao.LoginRepository;
import com.example13.demo.pojos.Medicines;
import com.example13.demo.pojos.Patient;

@SpringBootApplication
@EnableJpaRepositories(basePackageClasses = LoginRepository.class)
public class HmsProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(HmsProjectApplication.class, args);
		
		
		//Patient patient=new Patient(5, 99, "HHH", 26, "9-8-5263", "Single", "dfghj", "Delhi", "NewDelhi");
		//Medicines med=new Medicines(2, "Colosprin", 100, 10, 55,550);
		
		
		
	}

}
