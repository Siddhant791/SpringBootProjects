package com.siddhant.demo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	// @RequestMapping("home")
	@RequestMapping("login")
	public String login() {
		return "login.jsp";
	}
	
	  @RequestMapping("loggedin") 
	  public String loggedin(HttpServletRequest req,HttpServletResponse response) throws IOException{
		  
		  String uname=req.getParameter("uname"); 
	  	  String pass=req.getParameter("pass");
	  	  
	  if(uname.equals("Vishesh") && pass.equals("mathur123")) {
		  //res.sendRedirect("Home"); 
		  HttpSession session=req.getSession();
		  session.setAttribute("uname",uname);
		  return "CreateCustomer.jsp";
	  }else if(uname.equals("Siddhant") && pass.equals("bhardwaj123")) {
		  //res.sendRedirect("Home"); 
		  HttpSession session=req.getSession();
		  session.setAttribute("uname",uname);
		  return "CreateCustomer.jsp";
	  }else if(uname.equals("Sadia") && pass.equals("usmani123")) {
		  //res.sendRedirect("Home"); 
		  HttpSession session=req.getSession();
		  session.setAttribute("uname",uname);
		  return "CreateCustomer.jsp";
	  }
	  else {
	  return "login.jsp";
	  }
		  
	  }
	  @RequestMapping("logout")
		public String logout(HttpServletRequest req,HttpServletResponse response) throws IOException {
		  HttpSession session=req.getSession();
		  //session.setAttribute("logout","logout");
		  session.removeAttribute("uname");
		  //session.invalidate();
		  return "login.jsp";
			//return "login.jsp";
		}
	  
		@RequestMapping("test")
		public String test() {
			return "test.jsp";
		}
	 

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