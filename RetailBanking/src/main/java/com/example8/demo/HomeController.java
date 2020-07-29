package com.example8.demo;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example8.demo.Service.AccountServiceClass;
import com.example8.demo.Service.ServiceClass;
import com.example8.demo.pojos.Account;
import com.example8.demo.pojos.Customer;

@Controller
public class HomeController {
	
	@RequestMapping("/")   // Request for home page
	public String home()
	{
		//return "login";
		return "HomePage";
	}
	
	@RequestMapping("Home")
	public String Home(HttpServletRequest req,HttpServletResponse res) throws IOException {
		if(req.getSession().getAttribute("uname")==null)
		{
			res.sendRedirect("/");
			return null;
		}
		else {
			return "HomePage";	
		}
	}
	
	@RequestMapping("Check")
	public void Check(HttpServletRequest req,HttpServletResponse res) throws IOException {
		if(req.getSession().getAttribute("uname").equals("Vishesh") && req.getSession().getAttribute("pass").equals("0")) {
			  res.sendRedirect("Home");
			  	req.getSession().setAttribute("accountCreateFlag", false);
				req.getSession().setAttribute("accountCreateFlag1", false);
				req.getSession().setAttribute("accountCreateFlag2", false);
		  }
		  else {
			  req.getSession().setAttribute("credential_flag", false);
			  req.getSession().removeAttribute("uname");
			  req.getSession().removeAttribute("pass");
			  res.sendRedirect("/"); 
		  }
	}
	
	  @RequestMapping("HomePage") 
	  public void HomePage(HttpServletRequest req,HttpServletResponse res) throws IOException{
		  
		  String uname=req.getParameter("uname"); 
	  	  String pass=req.getParameter("pass");
	  	  req.setAttribute("flag", false);
	  	  req.getSession().setAttribute("uname", uname);
	  	  req.getSession().setAttribute("pass", pass);
	  	  res.sendRedirect("Check");
	  }
	 
	  @RequestMapping("logout")
		public void logout(HttpServletRequest req,HttpServletResponse res) throws IOException {
		  HttpSession session=req.getSession();
		  session.removeAttribute("uname");
		  res.sendRedirect("/");
		}
		@Autowired
		private ServiceClass s;
		@Autowired
		private AccountServiceClass s2;
	
//---------------------------Admin Login Page -----------------------------------------------------------	
		@RequestMapping("/user")   // Request for home page
		public String userLoginPage()
		{
			return "UserLogin";
		}
		  @RequestMapping("UserHomePage") 
		  public void UserHomePage(HttpServletRequest req,HttpServletResponse res) throws IOException{
			  
			  String uname=req.getParameter("username"); 
		  	  String pass=req.getParameter("userpass");
		  	  req.getSession().setAttribute("username", uname);
		  	  req.getSession().setAttribute("userpass", pass);
		  	  res.sendRedirect("UserCheck");
		  }
			@RequestMapping("UserCheck")
			public void UserCheck(HttpServletRequest req,HttpServletResponse res) throws IOException {
				int username=Integer.parseInt(req.getSession().getAttribute("username").toString());
				if(s.findByCustomerID(username).getCustomerId()==username && req.getSession().getAttribute("userpass").equals("1")) {
					  res.sendRedirect("UserHome");
				  }
				  else {
					  req.getSession().removeAttribute("username");
					  req.getSession().removeAttribute("userpass");
					  req.getSession().setAttribute("user_credential_flag", false);
					  res.sendRedirect("/user"); 
				  }
			}
		@RequestMapping("UserHome")
		public String userHome(HttpServletRequest req,HttpServletResponse res) throws IOException {
			if(req.getSession().getAttribute("username")==null)
			{
				res.sendRedirect("/user");
				return null;
			}
			else {
				return "UserHomePage";	
			}
		}
		
		  @RequestMapping("userLogout")
			public void userLogout(HttpServletRequest req,HttpServletResponse res) throws IOException {
			  HttpSession session=req.getSession();
			  session.removeAttribute("username");
			  session.removeAttribute("userpass");
			  res.sendRedirect("/user");
			}
//-----------------------------User login Page-----------------------------------------------------	  

		
//		private HttpServletRequest req;
//		private HttpServletResponse res;
		
		
		@RequestMapping("/CreateCustomerScreen")
		public String sendData(HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
				return null;
			}
			else {
				return "CreateCustomer";
			}	
		}
		
		
		@RequestMapping("/sendData_CreateCustomer")
		public void dataFromCreateCustomer(Customer customerStatus,HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
			}
			else {
				s.insertData(customerStatus);
				req.getSession().setAttribute("flag", true);
				res.sendRedirect("CreateCustomerScreen");
			}
		}
		
		@RequestMapping("/UpdateDeleteCustomerScreen")
		public ModelAndView functionUpdateDeleteScreen(HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
				return null;
			}else {
			  List<Customer> mylist=s.customerList();
			  ModelAndView mv1=new ModelAndView();
			  mv1.setViewName("CustomerListNew");
			  mv1.addObject("mylist", mylist); 
			  return mv1;
			  }
		}
		
		@RequestMapping("/DeleteCustomerScreen")
		public ModelAndView functionDeleteCustomerScreen(@RequestParam("id") int id,HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
				return null;
			}else {
			Customer deleteDataByID=s.findByID(id);
			ModelAndView mv2=new ModelAndView();
			mv2.setViewName("DeleteCustomer");
			mv2.addObject("customers", deleteDataByID);
			return mv2;
			}
		}
		@RequestMapping("/sendData_DeleteCustomer")
		public void dataFromDeleteCustomerScreen(@RequestParam("id") int id,HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			s.deleteByID(id);
			res.sendRedirect("/UpdateDeleteCustomerScreen");
		}
		@RequestMapping("/UpdateCustomerScreen")
		public ModelAndView functionUpdateCustomerScreen(@RequestParam("id") int id,HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
				return null;
			}else {
			Customer updateDataByID=s.findByID(id);
			System.out.println(updateDataByID.getCity());
			ModelAndView mv2=new ModelAndView();
			mv2.setViewName("UpdateCustomer");
			mv2.addObject("customers", updateDataByID);
			return mv2;
			}
		}
		
		@RequestMapping("/sendData_UpdateCustomer")
		public void dataFromUpdateCustomerScreen(Customer customer,HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
			}
			else {
			s.insertData(customer);
			res.sendRedirect("/UpdateDeleteCustomerScreen");
			}
		}
		
		@RequestMapping("/CreateAccountScreen")
		public String functionCreateAccountScreen(HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
				return null;
			}else {
				return "CreateAccountNew";
			}
		}
		
		@RequestMapping("/sendData_CreateAccount")
		public void dataFromCreateAccountScreen(Account account,HttpServletResponse res,HttpServletRequest req) throws IOException
		{
			int temp=0;
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
			}else {
				try {
					if(s2.findByCustomerID(account.getCustomerId()).getCustomerId()==account.getCustomerId()) {
						System.out.println("In first block");
						req.getSession().setAttribute("accountCreateFlag1",true);
						temp=1;
						res.sendRedirect("/CreateAccountScreen");
					}
				}catch(NullPointerException e){
					System.out.println("Nullpointer exception in first block");
				}
				try {
					if(s.findByCustomerID(account.getCustomerId()).getCustomerId()==account.getCustomerId() && temp==0){
						s2.insertData(account);
						System.out.println("yo hurray");
						req.getSession().setAttribute("accountCreateFlag",true);
						res.sendRedirect("/CreateAccountScreen");	
					}
				}catch(NullPointerException e) {
					req.getSession().setAttribute("accountCreateFlag2",true);
					res.sendRedirect("/CreateAccountScreen");
					System.out.println("NullPointerException");
				}
			}
		}
//--------------------------------Create customer & account creation till here--------------------
		
		@RequestMapping("/AccountSearch")   // Request for Account Search Page
		public String accountSearch(HttpServletRequest req,HttpServletResponse res) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
				return null;
			}else {
			return "AccountSearch";
			}
		}
		
		@RequestMapping("/sendData_AccountSearch")
		public ModelAndView dataFromAccountSearchScreen(@RequestParam("accountId") int accountId,HttpServletRequest req,HttpServletResponse res ) throws IOException
		{
			if(req.getSession().getAttribute("uname")==null)
			{
				res.sendRedirect("/");
				return null;
			}else {
			  Account accountDetail=s2.findByAccountID(accountId);
			  ModelAndView mv3=new ModelAndView();
			  mv3.setViewName("AccountSearch");
			  mv3.addObject("accountDetail", accountDetail);
			  req.getSession().setAttribute("accountSearchDetail",accountDetail);
			  return mv3; //return "DeleteAccount";
			}
		}
//-------------------Account Search Completed----------------------------------------------------
		@RequestMapping("/user/DepositMoney")
		public ModelAndView functionDepositMoneyScreen(HttpServletRequest req,HttpServletResponse res) throws IOException
		{	
			if(req.getSession().getAttribute("username")==null)
			{
				res.sendRedirect("/user");
				return null;
			}else {
				int customerId=Integer.parseInt(req.getSession().getAttribute("username").toString());
				System.out.println(customerId);
				Account depositMoneyAccountDetail=s2.findByCustomerID(customerId);
				 ModelAndView mv4=new ModelAndView();
				 mv4.addObject("depositMoneyAccountDetail", depositMoneyAccountDetail);
				  mv4.setViewName("DepositPage");
				  	return mv4;
			}
		}
		

		@RequestMapping("/user/sendData_DepositMoney")
		public void dataFromDepositMoneyScreen(Account account, @RequestParam("depositNewAmount") int depositNewAmount, HttpServletResponse res,HttpServletRequest req) throws IOException
		{
			if(req.getSession().getAttribute("username")==null)
			{
				res.sendRedirect("/user");
			}else {
			account.setBalance(account.getBalance()+ depositNewAmount);
			System.out.println(depositNewAmount);
			s2.insertData(account);
			res.sendRedirect("/user/DepositMoney");
			}
		}
//--------------------------Deposit Money end-------------------------------------------------
		
		@RequestMapping("/user/withDrawMoney")
		public ModelAndView functionWithdrawMoneyScreen(HttpServletRequest req,HttpServletResponse res) throws IOException
		{	
			if(req.getSession().getAttribute("username")==null)
			{
				res.sendRedirect("/user");
				return null;
			}else {
				 int customerId=Integer.parseInt(req.getSession().getAttribute("username").toString());
				 Account withDrawMoneyAccountDetail=s2.findByCustomerID(customerId);
				 ModelAndView mv5=new ModelAndView();
				 mv5.setViewName("WithDraw");
				 mv5.addObject("withDrawMoneyAccountDetail", withDrawMoneyAccountDetail);
				  return mv5;
				//return "CreateCustomer";
			}
		}
		
		@RequestMapping("/user/sendData_WithDrawAmount")
		public void dataFromWithdrawMoneyScreen(Account account, @RequestParam("withDrawAmount") int depositNewAmount, HttpServletResponse res,HttpServletRequest req) throws IOException
		{
			if(req.getSession().getAttribute("username")==null)
			{
				res.sendRedirect("/user");
			}else {
				account.setBalance(account.getBalance()- depositNewAmount);
				System.out.println(depositNewAmount);
				s2.insertData(account);
				res.sendRedirect("/user/withDrawMoney");
			}
		}
		
		@RequestMapping("/Error")   // Request for home page
		public String Error()
		{
			return "Error";
		}
		
	}
