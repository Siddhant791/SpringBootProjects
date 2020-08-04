package com.siddhant.demo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	String line="";
	List<Employee> list=new ArrayList<>();
	
	@RequestMapping("/")
	public String main(HttpServletRequest req) throws IOException {
		BufferedReader br=new BufferedReader(new FileReader("src/main/resources/Data.csv"));
		int count=0;
//		req.getSession().setAttribute("SearchPatient", true);
//		req.getSession().setAttribute("SearchPatientList", true);
		//return "EmployeeSearch.jsp";
		while((line=br.readLine())!=null) {
			try {
				String[] data=line.split(",");
				list.add(new Employee(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[9],data[10],data[11],data[12],data[13],data[14]));
				//System.out.println(data[0]);
				count++;
				System.out.println(count);
			}catch(ArrayIndexOutOfBoundsException e) {
				break;
			}
		}
		//return "FindEmployeeListByName.jsp";
		return "Home.jsp";
	}
	
	@RequestMapping("/writeData")
	@ResponseBody
	public String writeData(String name,String gender) throws IOException {
		File f=new File("src/main/resources/Data.csv");
		FileWriter fw=new FileWriter(f,true);
		//fw.append("\n");
		fw.append(name);
		fw.append(",");
		fw.append(gender);
		fw.flush();
		fw.close();
		return "H";
	}
	@RequestMapping("/requestSearchEmployeePage")
	public String requestSearchEmployeePage(HttpServletRequest req) {
		req.getSession().setAttribute("SearchPatient", true);
		return "EmployeeSearch.jsp";
	}
	
	@RequestMapping("/findEmployeeListByNamePage")
	public String findEmployeeListByNamePage(HttpServletRequest req) {
		req.getSession().setAttribute("SearchPatientList", true);
		return "FindEmployeeListByName.jsp";
	}
	
	@RequestMapping("/searchEmployee")
	@ResponseBody
	public ModelAndView test1(String name,HttpServletRequest req) throws IOException,ArrayIndexOutOfBoundsException {
		//BufferedReader br=new BufferedReader(new FileReader("src/main/resources/Data.csv"));
		//int count=0;
		//System.out.println(br.readLine());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("EmployeeSearch.jsp");
		//String name="anish";
		System.out.println(name);
//		while((line=br.readLine())!=null) {
//			try {
//				String[] data=line.split(",");
//				list.add(new Employee(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[9],data[10],data[11],data[12],data[13],data[14]));
//				//System.out.println(data[0]);
//				count++;
//				System.out.println(count);
//			}catch(ArrayIndexOutOfBoundsException e) {
//				break;
//			}
//		}
		
		for(Employee e:list) {
			if(e.getName().toLowerCase().startsWith(name.toLowerCase())) {
				req.getSession().setAttribute("SearchPatient", false);
				mv.addObject("patient",e);
				return mv;
				//return e.toString();
			}
		}
		req.getSession().setAttribute("SearchPatient", true);
		return mv;
	}

	@RequestMapping("/searchEmployeeListByName")
	@ResponseBody
	public ModelAndView findEmployeeListByName(String name,HttpServletRequest req) throws IOException,ArrayIndexOutOfBoundsException {
//		BufferedReader br=new BufferedReader(new FileReader("src/main/resources/Data.csv"));
//		int count=0;
		List<Employee> myList=new ArrayList<>();
		myList.clear();
		//list.clear();
		//System.out.println(br.readLine());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("FindEmployeeListByName.jsp");
		//String name="anish";
//		while((line=br.readLine())!=null) {
//			try {
//				String[] data=line.split(",");
//				list.add(new Employee(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[9],data[10],data[11],data[12],data[13],data[14]));
//				//System.out.println(data[0]);
//				count++;
//				System.out.println(count);
//			}catch(ArrayIndexOutOfBoundsException e) {
//				break;
//			}
//		}
		
		for(Employee e:list) {
			if(e.getName().toLowerCase().startsWith(name.toLowerCase())) {
				req.getSession().setAttribute("SearchPatientList", false);
				myList.add(e);
			}
		}
		mv.addObject("mylist",myList);
		if(myList.size()==0) {
			req.getSession().setAttribute("SearchPatientList", true);
		}
		//req.getSession().setAttribute("SearchPatient", true);
		return mv;
	}
	
	//---------------------------------------DadProject--------------------------------------//
	

//	@RequestMapping("login")
//	public String login() {
//		return "login.jsp";
//	}
//	
//	  @RequestMapping("loggedin") 
//	  public String loggedin(HttpServletRequest req,HttpServletResponse response) throws IOException{
//		  
//		  String uname=req.getParameter("uname"); 
//	  	  String pass=req.getParameter("pass");
//	  	  
//	  if(uname.equals("Vishesh") && pass.equals("mathur123")) {
//		  //res.sendRedirect("Home"); 
//		  HttpSession session=req.getSession();
//		  session.setAttribute("uname",uname);
//		  return "CreateCustomer.jsp";
//	  }else if(uname.equals("Siddhant") && pass.equals("bhardwaj123")) {
//		  //res.sendRedirect("Home"); 
//		  HttpSession session=req.getSession();
//		  session.setAttribute("uname",uname);
//		  return "CreateCustomer.jsp";
//	  }else if(uname.equals("Sadia") && pass.equals("usmani123")) {
//		  //res.sendRedirect("Home"); 
//		  HttpSession session=req.getSession();
//		  session.setAttribute("uname",uname);
//		  return "CreateCustomer.jsp";
//	  }
//	  else {
//	  return "login.jsp";
//	  }
//		  
//	  }
//	  @RequestMapping("logout")
//		public String logout(HttpServletRequest req,HttpServletResponse response) throws IOException {
//		  HttpSession session=req.getSession();
//		  //session.setAttribute("logout","logout");
//		  session.removeAttribute("uname");
//		  //session.invalidate();
//		  return "login.jsp";
//			//return "login.jsp";
//		}
//	  
//		@RequestMapping("test")
//		public String test() {
//			return "test.jsp";
//		}
//	 

//------------------------------------------------------------------------------------------------

	// @ResponseBody
	/*
	 * public ModelAndView home(Student s) { ModelAndView mv=new ModelAndView();
	 * //String name=req.getParameter("name"); //HttpSession
	 * session=req.getSession(); //session.setAttribute("n", myName);
	 * mv.addObject("obj",s); mv.setViewName("Home"); //System.out.println(myName);
	 * return mv;
	 */
}