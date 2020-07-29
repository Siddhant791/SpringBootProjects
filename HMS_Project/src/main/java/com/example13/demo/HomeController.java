package com.example13.demo;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example13.demo.dao.DiagnosticDao;
import com.example13.demo.pojos.DiagnosticsMaster;
import com.example13.demo.pojos.Medicines;
import com.example13.demo.pojos.Patient;
import com.example13.demo.pojos.PatientDiagnostics;
import com.example13.demo.pojos.PatientMedicines;
import com.example13.demo.service.DiagnosticService;
import com.example13.demo.service.MedicinesService;
import com.example13.demo.service.PatientDiagnosticService;
import com.example13.demo.service.PatientMedicineService;

//import com.example13.demo.service.MedicinesService;
import com.example13.demo.service.PatientService;

@Controller
public class HomeController {
	
	@Autowired
	private PatientService p;

//-----------------Siddhant Work Area Started--------------------------------------------------------//	

	@Autowired
	private MedicinesService s;

	@Autowired
	private DiagnosticService diagnosService;
	
	@Autowired
	private PatientMedicineService pm;
	@Autowired
	private PatientDiagnosticService diagnos;
	
	
	private int commonPatientId;
	//private List<Integer> rateArray = new ArrayList<>();
	//private List<Integer> amountArray=new ArrayList<>();
	//private List<Integer> amountArrayForDiagnostics=new ArrayList<>();
	private Patient commonPatient=new Patient();
	private List<PatientMedicines> commonPatientMedicines=new ArrayList<>();
	private List<PatientDiagnostics> commonPatientDiagnostics=new ArrayList<>();
	private List<DiagnosticsMaster> commonDiagnosticsMaster=new ArrayList<>();
//	private MedicinesService s;

	
	@RequestMapping("/")
	public String home() {
		return "Home";
	}

	@RequestMapping("/send_createPatient")
	public void insertPatientInfoInDb(Patient patient, HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		p.insertData(patient);
		req.getSession().setAttribute("CreatePatient", true);
		res.sendRedirect("CreatePatient");
	}

	@RequestMapping("/CreatePatient")
	public String CreatePatient() // Return create patient jsp page
	{
		return "CreatePatient";
	}

	// ----------Create patient Upto Here--------------------------

	@RequestMapping("/send_updatePatient")
	public void updatePatientInfoInDb(Patient patient, HttpServletRequest req, HttpServletResponse res)
			throws IOException {

		List<PatientMedicines> patientMedicineDetails = pm.findBypatId(patient.getPatientId());
		for(PatientMedicines z:patientMedicineDetails)
		{
			patient.getAllMedicines().add(z);
		}
		
		p.insertData(patient);
		req.getSession().setAttribute("test", true);
		res.sendRedirect("UpdatePatient");
		//yo
	}

	@RequestMapping("/UpdatePatient")
	public String updatePatient(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().setAttribute("test", true);
		return "UpdatePatient";
	}

	@RequestMapping("/FindPatientById")
	public ModelAndView findPatientById(int id, HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mv = new ModelAndView();
		Patient patient = p.findbyId(id);
		if (patient == null) {
			mv.setViewName("UpdatePatient");
			req.setAttribute("UpdatePatientError", true);
		} else {
			mv.setViewName("UpdatePatient");
			mv.addObject("patient", patient);
			req.getSession().setAttribute("test", false);
		}
		return mv;
	}

	// --------------------------Update Patient upto here-------------------------

	@RequestMapping("/FindPatientByIdToDelete")
	public ModelAndView findPatientByIdToDelete(int id, HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		ModelAndView mv1 = new ModelAndView();
		Patient patient = p.findbyId(id);
		System.out.println(patient);
		if (patient == null) {
			// res.sendRedirect("/DeletePatient");
			mv1.setViewName("DeletePatient");
			req.setAttribute("DeletePatientError", true);
		} else {
			mv1.setViewName("DeletePatient");
			mv1.addObject("patient", patient);
			req.getSession().setAttribute("DeletePatient", false);
		}
		return mv1;
	}

	@RequestMapping("/send_DeletePatient")
	public String deletePatientInfoInDb(int patientId, HttpServletRequest req, HttpServletResponse res) {
		p.deleteById(patientId);
		req.getSession().setAttribute("DeletePatient", true);
		return "DeletePatient";
	}

	@RequestMapping("/DeletePatient")
	public String deletePatient(HttpServletRequest req, HttpServletResponse res) {
		// req.setAttribute("DeletePatientError",false);
		req.getSession().setAttribute("DeletePatient", true);
		return "DeletePatient";
	}

	// -----------------------------DeletePatient upto here--------------------

	@RequestMapping("/SearchPatient")
	public String SearchPatient(HttpServletRequest req, HttpServletResponse res) // Return create patient jsp page
	{
		req.getSession().setAttribute("SearchPatient", true);
		return "SearchPatient";
	}

	@RequestMapping("/FindPatientByIdToSearch")
	public ModelAndView findPatientByIdToSearch(int id, HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mv = new ModelAndView();
		Patient patient = p.findbyId(id);
		if (patient == null) {
			mv.setViewName("SearchPatient");
			req.setAttribute("SearchPatientError", true);
		} else {
			mv.setViewName("SearchPatient");
			mv.addObject("patient", patient);
			req.getSession().setAttribute("SearchPatient", false);
		}
		return mv;
	}

	// ------------------------Search Patient upto
	// here--------------------------------

	@RequestMapping("/ViewAllPatients")
	public ModelAndView ViewAllPatients(HttpServletRequest req, HttpServletResponse res) // Return create patient jsp
																							// page
	{
		List<Patient> mylist = p.patientList();
		ModelAndView mv1 = new ModelAndView();
		mv1.setViewName("ViewAllPatients");
		mv1.addObject("mylist", mylist);
		return mv1;
	}
	
	//-------------------------------View Patient ends here------------------------------------------
	
	@RequestMapping("/PatientBilling")
	public String patientBilling() {
		return "PatientBilling";
	}
	
	@RequestMapping("/FindBillOfPatient")
	public ModelAndView findBillOfPatient(int patientId, HttpServletRequest req, HttpServletResponse res) throws IOException, ParseException {
		List<Integer> amountArrayForBill=new ArrayList<>();
		List<Integer> rateArrayForBill=new ArrayList<>();
		List<Integer> amountArrayForDiagnosticsForBill=new ArrayList<>();
		int totalBillOfMedicines=0;
		int totalBillOfDiagnostics=0;
		int finalBill=0;
		ModelAndView mv1 = new ModelAndView();
		Patient patientDetails = p.findbyId(patientId);
		System.out.println(patientDetails);
		if (patientDetails == null) {
			mv1.setViewName("PatientBilling");
			req.setAttribute("PatientBillingError", true);
		} else {
//			try {
				int chargesForRoom=0;
				String doa=patientDetails.getDob();
				Date date=new Date();
			    //Date date1=new SimpleDateFormat("dd/MM/yyyy").parse("30/06/1998");
		        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		        String strCurrentDate = dateFormat.format(date); 			    
			    DateTimeFormatter formatter=DateTimeFormatter.ofPattern("uuuu-MM-dd");
			    LocalDate currentDate= LocalDate.parse(strCurrentDate,formatter);
			    LocalDate patientDoa= LocalDate.parse(doa,formatter);	    
			    long totalNoOfDays=ChronoUnit.DAYS.between(patientDoa,currentDate);
//			    System.out.println(totalNoOfDays);
//			    System.out.println(patientDetails.getTypeOfBed());
			    if(patientDetails.getTypeOfBed().toLowerCase().equals("general")) {
			    	chargesForRoom=(int)(totalNoOfDays*2000);
			    	System.out.println(chargesForRoom);
			    }else if(patientDetails.getTypeOfBed().toLowerCase().equals("semi")) {
			    	chargesForRoom=(int)(totalNoOfDays*4000);
			    }else if(patientDetails.getTypeOfBed().toLowerCase().equals("single")){
			    	chargesForRoom=(int)(totalNoOfDays*8000);
			    }
			List<PatientMedicines> patientMedicineDetails = pm.findBypatId(patientId);
			List<PatientDiagnostics> patientDiagnosticDetails = diagnos.findBypatId(patientId);
				//System.out.println(patientMedicineDetails);
			for (PatientMedicines z : patientMedicineDetails) {
				Medicines medicine = s.findByMedicineName(z.getMedicineIssued());
				try {
					rateArrayForBill.add(medicine.getRate()); // if null pointer exception comes here ,then it means that medicine
					amountArrayForBill.add(z.getQuantityIssued()*medicine.getRate());		
				}catch(Exception e){
					System.out.println("In medicine exception block");
				}				
				totalBillOfMedicines+=z.getQuantityIssued()*medicine.getRate();
			}
			for(PatientDiagnostics z:patientDiagnosticDetails)
			{
				DiagnosticsMaster diagnosticDetail=diagnosService.findByMedicineName(z.getTestName1());
				try {
					amountArrayForDiagnosticsForBill.add(diagnosticDetail.getChargeForTest());
					totalBillOfDiagnostics+=diagnosticDetail.getChargeForTest();
				}catch(Exception e) {
					System.out.println("in exception block");
				}
			}
			finalBill=chargesForRoom+totalBillOfMedicines+totalBillOfDiagnostics;
			System.out.println(chargesForRoom);
			mv1.setViewName("PatientBilling");
			mv1.addObject("patientDetails", patientDetails);
			
			mv1.addObject("patientMedicineDetails", patientMedicineDetails);
			mv1.addObject("rateArray", rateArrayForBill);
			mv1.addObject("amountArray", amountArrayForBill);
			
			mv1.addObject("totalBillOfMedicines",totalBillOfMedicines);
			mv1.addObject("ChargesForRoom",chargesForRoom);
			mv1.addObject("NoOfDays",totalNoOfDays);
			mv1.addObject("DateOfDischarge",strCurrentDate);
			
			mv1.addObject("patientDiagnosticDetails",patientDiagnosticDetails);
			mv1.addObject("totalBillOfDiagnostics",totalBillOfDiagnostics);
			mv1.addObject("finalBill",finalBill);
			mv1.addObject("amountArrayForDiagnostics", amountArrayForDiagnosticsForBill);
			mv1.addObject("patientIdToDischarge",patientId);
//	catch (Exception e) {
//		// e.printStackTrace();
//		ModelAndView m1 = new ModelAndView();
//		m1.setViewName("PatientBilling");
//		m1.addObject("patientDetails", patientDetails);
//		System.out.println("in exception");
//		// m1.addObject("patientMedicineDetails", patientMedicineDetails);
//		// m1.addObject("rateArray", rateArray);
//		return m1;
//	}
		}
		return mv1;
	}
	//--------------------------Bill generation ends here-------------------------------------------
	
	@RequestMapping("/discharge")
	public String patientDischarge(int patientId) {
		
		List<PatientMedicines> patientMedicines=pm.findBypatId(patientId);
		List<PatientDiagnostics> patientDiagnostics=diagnos.findBypatId(patientId);
		for(PatientMedicines z:patientMedicines) {
			pm.deleteByID(z.getSno());
		}
		for(PatientDiagnostics z:patientDiagnostics) {
			diagnos.deleteByID(z.getSnoo());
		}
		p.deleteById(patientId);
		return "Home";
	}
	
	//--------------------------Siddhant Work area end---------------------------------------------------

	@RequestMapping("/issueMedicinesPatientId")
	public ModelAndView IssueMedicinesPatientId(@RequestParam("patientId") int patientId,HttpServletRequest request) {
		setCommonPatientId(patientId);
		Patient patientDetails = p.findbyId(patientId);
		setCommonPatient(patientDetails); // commonPatient details
		request.setAttribute("flag3", null);
		//this.amountArray=[];
		/*
		 * if (patientMedicineDetails.isEmpty()) { ModelAndView m1=new ModelAndView();
		 * m1.setViewName("issueMedicines"); m1.addObject("patientDetails",
		 * patientDetails); //m1.addObject("patientMedicineDetails",
		 * patientMedicineDetails); //m1.addObject("rateArray", rateArray); return m1;
		 */
		List<Integer> rateArray = new ArrayList<>();
		List<Integer> amountArray=new ArrayList<>();

		try {
			List<PatientMedicines> patientMedicineDetails = pm.findBypatId(patientId);
			setCommonPatientMedicines(patientMedicineDetails);// common Patient Medicines

			for (PatientMedicines z : patientMedicineDetails) {
				// System.out.println(z);
				Medicines medicine = s.findByMedicineName(z.getMedicineIssued());
				
				// System.out.println(medicine);
				rateArray.add(medicine.getRate()); // if null pointer exception comes here ,then it means that medicine
				amountArray.add(z.getQuantityIssued()*medicine.getRate());								// master table doesnt have the medicine but it is assigned in the
													// patient_medicines
			}
			
			//System.out.println(amountArray);
						
			ModelAndView m1 = new ModelAndView();
			m1.setViewName("issueMedicines");
			m1.addObject("patientDetails", patientDetails);
			m1.addObject("patientMedicineDetails", commonPatientMedicines);
			m1.addObject("rateArray", rateArray);
			m1.addObject("amountArray", amountArray);
			return m1;
		} catch (Exception e) {
			// e.printStackTrace();
			ModelAndView m1 = new ModelAndView();
			m1.setViewName("issueMedicines");
			m1.addObject("patientDetails", patientDetails);
			// m1.addObject("patientMedicineDetails", patientMedicineDetails);
			// m1.addObject("rateArray", rateArray);
			return m1;
		}
		// Patient medicineDetails=s.findByPatientId(patientId);
		// System.out.println(medicineDetails);
	}

	@RequestMapping("/issueMedicinesPage_UpadteNewMedicines")
	public ModelAndView IssueMedicines_UpdateNewMedicines(@RequestParam("medicineIssued") String medicineIssued,@RequestParam("quantityIssued") int quantityIssued, @RequestParam("rate") int rate,@RequestParam("amount") int amount,HttpServletRequest request) {
		Patient patientDetails = p.findbyId(commonPatientId);
		PatientMedicines patientMedicineDetails = new PatientMedicines(medicineIssued, quantityIssued);
		// patientMedicineDetails.setPatientId(commonPatientId);
		patientDetails.getAllMedicines().add(patientMedicineDetails);
		p.insertData(patientDetails); // update
		//pm.insertData(patientMedicineDetails);

		List<PatientMedicines> patientMedicineDetails1 = pm.findBypatId(commonPatientId);
		List<Integer> rateArray = new ArrayList<>();
		List<Integer> amountArray=new ArrayList<>();
		setCommonPatientMedicines(patientMedicineDetails1);
		if (patientMedicineDetails1.isEmpty()) {
			ModelAndView m1 = new ModelAndView();
			m1.setViewName("issueMedicines");
			
			// m1.addObject("patientDetails", patientDetails);
			// m1.addObject("patientMedicineDetails", patientMedicineDetails1);
			// m1.addObject("rateArray", rateArray);
			System.out.println("in patientMedicineDetails1");
			return m1;
		}

		else {
			try {

				Medicines medicine = s.findByMedicineName(medicineIssued);
				for (PatientMedicines z : patientMedicineDetails1) {
					// System.out.println(z);
					Medicines medicine1 = s.findByMedicineName(z.getMedicineIssued());
					
					// System.out.println(medicine);
					rateArray.add(medicine1.getRate()); // if null pointer exception comes here ,then it means that medicine
					amountArray.add(z.getQuantityIssued()*medicine1.getRate());								// master table doesnt have the medicine but it is assigned in the
														
				}
				//rateArray.add(medicine.getRate());
				//amountArray.add(medicine.getRate()*quantityIssued);
				medicine.setQuantityAvailable(medicine.getQuantityAvailable()-quantityIssued);
				s.insertData(medicine);
				ModelAndView m1 = new ModelAndView();
				m1.setViewName("issueMedicines");
				m1.addObject("patientDetails", commonPatient);
				m1.addObject("patientMedicineDetails", commonPatientMedicines);
				m1.addObject("rateArray", rateArray);
				m1.addObject("amountArray", amountArray);//yo

				return m1;
			} catch (Exception e) {
				e.printStackTrace();
			}

			/*
			 * try { for(PatientMedicines z:patientMedicineDetails1) { Medicines medicine
			 * =s.findByMedicineName(z.getMedicineIssued());
			 * rateArray.add(medicine.getRate());
			 * 
			 * } } catch(Exception e) { e.printStackTrace(); }
			 */

		}

		ModelAndView m1 = new ModelAndView();
		m1.setViewName("issueMedicines");
		m1.addObject("patientDetails", commonPatient);
		m1.addObject("patientMedicineDetails", commonPatientMedicines);
		m1.addObject("rateArray", rateArray);
		m1.addObject("amountArray", amountArray);

		return m1;

		// Medicines medicine =s.findByMedicineName(medicineIssued);
		// rateArray.add(medicine.getRate());
		// System.out.println(medicine);
		// System.out.println(medicine);
		// Patient medicineDetails=s.findByPatientId(patientId);
		// System.out.println(medicineDetails);
	}

	 @RequestMapping("/issueMedicines")
	 public String IssueMedicines(HttpServletRequest request) { 
		 
		 request.setAttribute("flag3", true);
		 return "issueMedicines";
		 }
	 
	public List<PatientMedicines> getCommonPatientMedicines() {
		return commonPatientMedicines;
	}

	public void setCommonPatientMedicines(List<PatientMedicines> commonPatientMedicines) {
		this.commonPatientMedicines = commonPatientMedicines;
		
	}

	
	  @RequestMapping("/issueMedicinesPage_GetMedicineDetails")
	  public ModelAndView IssueMedicines_GetMedicineDetails(@RequestParam("medicineIssued") String medicineIssued,HttpServletRequest request,@RequestParam("quantityIssued") int quantityIssued)
	  { 
		  
		  request.setAttribute("flag", true);
		  request.setAttribute("flag5", true);
		  Medicines medicine =s.findByMedicineName(medicineIssued); 
		  ModelAndView m4=new ModelAndView(); 
/*
		  if(quantityIssued<=medicine.getQuantityAvailable())
		  {
			  
		  m4.setViewName("issueMedicines");
		  m4.addObject("medicines", medicine);
		  m4.addObject("patientDetails",commonPatient);
		  m4.addObject("patientMedicineDetails",commonPatientMedicines);
		  m4.addObject("quant", quantityIssued);
		  m4.addObject("amount", medicine.getRate()*quantityIssued);
		  m4.addObject("amountArray", amountArray);
		  return m4;
		  }*/
		  List<Integer> rateArray = new ArrayList<>();
		  List<Integer> amountArray=new ArrayList<>();
		  try {
		  	List<PatientMedicines> patientMedicineDetails1 = pm.findBypatId(commonPatientId);
		  	
		  	for (PatientMedicines z : patientMedicineDetails1) {
				// System.out.println(z);
				Medicines medicine2 = s.findByMedicineName(z.getMedicineIssued());
				
				// System.out.println(medicine);
				rateArray.add(medicine2.getRate()); // if null pointer exception comes here ,then it means that medicine
				amountArray.add(z.getQuantityIssued()*medicine2.getRate());								// master table doesnt have the medicine but it is assigned in the
													// patient_medicines
			}
			
		  }
		  
		  catch(Exception e)
		  {
			  
		  }

		  if(medicine == null) {
			//request.setAttribute("checkQuantityAvail", true);
			  m4.setViewName("issueMedicines");
			  request.setAttribute("issueMedicineInvalidNameError", true);
			  m4.addObject("patientMedicineDetails",commonPatientMedicines);
			  m4.addObject("patientDetails",commonPatient);
			  //m4.addObject("maxQuant", medicine.getQuantityAvailable());
			  m4.addObject("amountArray", amountArray);
			  System.out.println("hello21");
			  //return m4;
		  }else if(quantityIssued>medicine.getQuantityAvailable())

		  {
			  //request.setAttribute("checkQuantityAvail", true);
			  m4.setViewName("issueMedicines");
			  request.setAttribute("issueMedicineQuantityError", true);
			  m4.addObject("patientMedicineDetails",commonPatientMedicines);
			  m4.addObject("patientDetails",commonPatient);
			  m4.addObject("maxQuant", medicine.getQuantityAvailable());
			  m4.addObject("amountArray", amountArray);
			  System.out.println("hello");
			  //return m4;

		  }
		  else
		  {
			  m4.setViewName("issueMedicines");
			  m4.addObject("medicines", medicine);
			  m4.addObject("patientDetails",commonPatient);
			  m4.addObject("patientMedicineDetails",commonPatientMedicines);
			  m4.addObject("quant", quantityIssued);
			  m4.addObject("amount", medicine.getRate()*quantityIssued);
			  m4.addObject("amountArray", amountArray);
			  m4.addObject("rateArray", rateArray);
			  
			 // return m4;
			  System.out.println(amountArray);
		  }
		  return m4;
		  
	  
	  }
	  
	  @RequestMapping("/diagnostics")
		 public ModelAndView Diagnostics(HttpServletRequest request) { 
		  List<DiagnosticsMaster> diagnosticMasterDetails =diagnosService.getAllDiagnosticMaster();
			setCommonDiagnosticsMaster(diagnosticMasterDetails);
			request.setAttribute("flag2", true);
			ModelAndView m1=new ModelAndView(); 
			m1.setViewName("DiagnosticPage");
			m1.addObject("diagnosticMasterDetails", diagnosticMasterDetails);

			return m1;
			 
			 }
	  
	  
	  @RequestMapping("/diagnosticsPatientId")
		public ModelAndView diagnosticsPatientId(@RequestParam("patientId") int patientId,HttpServletRequest request)
		{
		    setCommonPatientId(patientId);
			Patient patientDetails = p.findbyId(patientId);
			//System.out.println(patientDetails);
			setCommonPatient(patientDetails);
			request.setAttribute("flag2", null);
			
			List<DiagnosticsMaster> diagnosticMasterDetails =diagnosService.getAllDiagnosticMaster();
			/*
			 * for(DiagnosticsMaster v:diagnosticMasterDetails) { System.out.println(v); }
			 */
			
			setCommonDiagnosticsMaster(diagnosticMasterDetails);
			List<Integer> amountArrayForDiagnostics=new ArrayList<>();
			
			try {
				List<PatientDiagnostics> patientDiagnosticDetails = diagnos.findBypatId(patientId);
				setCommonPatientDiagnostics(patientDiagnosticDetails);  // common Patient Diagnostics
				
				
			    
				for(PatientDiagnostics z:patientDiagnosticDetails)
				{
					DiagnosticsMaster diagnosticDetail=diagnosService.findByMedicineName(z.getTestName1());
					amountArrayForDiagnostics.add(diagnosticDetail.getChargeForTest());
				}
				
				ModelAndView m1 = new ModelAndView();
				m1.setViewName("DiagnosticPage");
				m1.addObject("patientDetails", patientDetails);
				m1.addObject("patientDiagnosticDetails", patientDiagnosticDetails);
				m1.addObject("diagnosticMasterDetails", diagnosticMasterDetails);
				m1.addObject("amountArrayForDiagnostics", amountArrayForDiagnostics);
				return m1;
				
			} 
			catch(Exception e)
			{
				ModelAndView m1 = new ModelAndView();
				m1.setViewName("DiagnosticPage");
				m1.addObject("patientDetails", patientDetails);
				m1.addObject("patientDiagnosticDetails", commonPatientDiagnostics);
				m1.addObject("diagnosticMasterDetails", diagnosticMasterDetails);
				m1.addObject("amountArrayForDiagnostics", amountArrayForDiagnostics);
				// m1.addObject("patientMedicineDetails", patientMedicineDetails);
				// m1.addObject("rateArray", rateArray);
				return m1;
			}

		  
		}
	  

	  @RequestMapping("/diagnosticPage_GetDiagnosticName")
	  public ModelAndView diagnostic_GetDiagnosticName(@RequestParam("nameOfTest") String nameOfTest,HttpServletRequest request)
	  { 
		  
	
		  
		  int amount=0;
		  request.setAttribute("flag1", true);
		  request.setAttribute("flag6", true);
		  for(DiagnosticsMaster x:commonDiagnosticsMaster)
		  {
			  
			  if(x.getTestName().equals(nameOfTest))
			  {
				  amount=x.getChargeForTest();
				  break;
			  }
		  }
		  List<Integer> amountArrayForDiagnostics=new ArrayList<>();
		  try
		  {
		  List<PatientDiagnostics> patientDiagnosticDetails1 = diagnos.findBypatId(commonPatientId);

		  for(PatientDiagnostics z:patientDiagnosticDetails1)
			{
				DiagnosticsMaster diagnosticDetail=diagnosService.findByMedicineName(z.getTestName1());
				amountArrayForDiagnostics.add(diagnosticDetail.getChargeForTest());
			}
		  ModelAndView m1=new ModelAndView();
		  m1.setViewName("DiagnosticPage");
		  m1.addObject("nameOfTest", nameOfTest);
		  m1.addObject("amount", amount);
		  m1.addObject("patientDetails", commonPatient);
		  m1.addObject("patientDiagnosticDetails", patientDiagnosticDetails1);
		  m1.addObject("diagnosticMasterDetails", commonDiagnosticsMaster);
		  m1.addObject("amountArrayForDiagnostics", amountArrayForDiagnostics);
		  return m1;
		  }
		  catch(Exception e)
		  {
			  ModelAndView m1=new ModelAndView();
			  m1.setViewName("DiagnosticPage");
			  m1.addObject("nameOfTest", nameOfTest);
			  m1.addObject("amount", amount);
			  m1.addObject("patientDetails", commonPatient);
			  m1.addObject("patientDiagnosticDetails", commonPatientDiagnostics);
			  m1.addObject("diagnosticMasterDetails", commonDiagnosticsMaster);
			  m1.addObject("amountArrayForDiagnostics", amountArrayForDiagnostics);
			  return m1;
		  }  
	  }
	  
	  @RequestMapping("/diagnosticsPage_UpdateNewDiagnostic")
		public ModelAndView diagnostics_UpdateNewDiagnostic(@RequestParam("name") String name,@RequestParam("amount") int amount,HttpServletRequest request) {
	
		request.setAttribute("directSubmitButtonError", true);  
		Patient patientDetails = p.findbyId(commonPatientId);
		PatientDiagnostics patientDiagnosticDetails = new PatientDiagnostics(name);
		patientDetails.getAllDiagnosticsForPatient().add(patientDiagnosticDetails);
		p.insertData(patientDetails);
		
		List<PatientDiagnostics> patientDiagnosticDetails1 = diagnos.findBypatId(commonPatientId);
		List<Integer> amountArrayForDiagnostics=new ArrayList<>();
		if (patientDiagnosticDetails1.isEmpty()) {
			ModelAndView m1 = new ModelAndView();
			m1.setViewName("DiagnosticPage");		
			// m1.addObject("patientDetails", patientDetails);
			// m1.addObject("patientMedicineDetails", patientMedicineDetails1);
			// m1.addObject("rateArray", rateArray);
			System.out.println("in patientMedicineDetails1");
			return m1;
		}

		else {
			try {
				
				 for(PatientDiagnostics z:patientDiagnosticDetails1)
					{
						DiagnosticsMaster diagnosticDetail=diagnosService.findByMedicineName(z.getTestName1());
						amountArrayForDiagnostics.add(diagnosticDetail.getChargeForTest());
					}

				amountArrayForDiagnostics.add(amount);

				ModelAndView m1 = new ModelAndView();
				m1.setViewName("DiagnosticPage");
				m1.addObject("patientDetails", commonPatient);
				m1.addObject("patientDiagnosticDetails", patientDiagnosticDetails1);
				m1.addObject("diagnosticMasterDetails", commonDiagnosticsMaster);
				m1.addObject("amountArrayForDiagnostics", amountArrayForDiagnostics);
				return m1;
			} catch (Exception e) {
				e.printStackTrace();
			}

			/*
			 * try { for(PatientMedicines z:patientMedicineDetails1) { Medicines medicine
			 * =s.findByMedicineName(z.getMedicineIssued());
			 * rateArray.add(medicine.getRate());
			 * 
			 * } } catch(Exception e) { e.printStackTrace(); }
			 */

		}
		ModelAndView m1 = new ModelAndView();
		m1.setViewName("DiagnosticPage");
		m1.addObject("patientDetails", commonPatient);
		m1.addObject("patientDiagnosticDetails", patientDiagnosticDetails1);
		m1.addObject("diagnosticMasterDetails", commonDiagnosticsMaster);
		m1.addObject("amountArrayForDiagnostics", amountArrayForDiagnostics);
		return m1; 
		  
		  
	  }
	  
	  public int getCommonPatientId() { return commonPatientId; }
	  
	  public void setCommonPatientId(int commonPatientId) { this.commonPatientId =
	  commonPatientId; }
	  
	  public Patient getCommonPatient() { return commonPatient; }
	  
	  public void setCommonPatient(Patient commonPatient) { this.commonPatient =
	  commonPatient; }

	

	public List<PatientDiagnostics> getCommonPatientDiagnostics() {
		return commonPatientDiagnostics;
	}

	public void setCommonPatientDiagnostics(List<PatientDiagnostics> commonPatientDiagnostics) {
		this.commonPatientDiagnostics = commonPatientDiagnostics;
	}

	public List<DiagnosticsMaster> getCommonDiagnosticsMaster() {
		return commonDiagnosticsMaster;
	}

	public void setCommonDiagnosticsMaster(List<DiagnosticsMaster> commonDiagnosticsMaster) {
		this.commonDiagnosticsMaster = commonDiagnosticsMaster;
	}
	  
	  
	  
	 }
