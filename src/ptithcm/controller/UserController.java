package ptithcm.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.CTHoaDon;
import ptithcm.entity.User;


@Controller
@Transactional
@RequestMapping("/user/")
public class UserController {
	@Autowired 
	SessionFactory factory;
	
	
	@RequestMapping(value = "login", method =RequestMethod.GET)			
	public String login(ModelMap model ) {
		model.addAttribute("user",new User());
		return "user/login";
	}
			

	@RequestMapping(value = "login", method =RequestMethod.POST)
	public String login(ModelMap model,@ModelAttribute("user") User user, HttpSession hs, final RedirectAttributes redirectAttributes) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("Username", user.getUsername()));
	     User kh = (User) crit.uniqueResult();
	     if(kh==null) {
	    	 model.addAttribute("message", "Bạn phải đăng nhập để mua hàng!");
	     }else if(kh.getPassword().equalsIgnoreCase(user.getPassword())==true){
	    	 model.addAttribute("message", "Đăng nhập thành công");
	    	 if(kh.getPhanQuyen().equalsIgnoreCase("user")|| kh.getPhanQuyen()=="") {
	    		 redirectAttributes.addFlashAttribute("user", kh);
	    		 return "redirect:../index.htm";
	    	 }else if(kh.getPhanQuyen().equalsIgnoreCase("admin")) {
	    		 hs.setAttribute("admin", kh);
	    		 return "redirect:../admin/user.htm";
	    	 }
	     }else {
	    	 model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng! Mời bạn kiểm tra lại.");
	     }
		return "user/login";
	}	
	
	
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute("user", new User());
		return "user/register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String insertRegister(ModelMap model, @ModelAttribute("user") User user)
			throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("Username", user.getUsername()));
		User user1 = (User) crit.uniqueResult();
		if (user1 != null) {
			model.addAttribute("message", "Tên đăng nhập đã được sử dụng bởi người khác. Vui lòng chọn tên đăng nhập khác!!");
			return "user/register";
		} else if (user1 == null) {
			if (user.getUsername().trim().equalsIgnoreCase("") == true
					|| user.getPassword().trim().equalsIgnoreCase("") == true) {
				model.addAttribute("name", "Tên đăng nhập và mật khẩu không được bỏ trống!");
				return "user/register";
			}if(user.getEmail().trim().equalsIgnoreCase("")== true){
				model.addAttribute("email", "Email không được bỏ trống!");
				return "user/register";
			}
			else {
				try {
					user.setPhanQuyen("user");
					session.save(user);
					model.addAttribute("message",
							"Đăng ký thành công. <a href=\"user/login.htm\">Đăng nhập tại đây.</a>");
				} catch (Exception e) {
					model.addAttribute("message", "Đăng ký thất bại! Vui lòng kiểm tra lại");
					return "user/register";
				}
			}

		}
		return "user/login";
	}
	
	
	@RequestMapping(value = "/userinfo/{username}", method = RequestMethod.GET)
	public String update(ModelMap model,@PathVariable String username) throws IllegalStateException, SystemException {
		 Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("Username", username));
	     User user = (User) crit.uniqueResult();
	        if (user != null) {
	        	try {
	        		model.addAttribute("user", user);
				} catch (Exception e) {
				}
	        	
	        	
	        }
		
		return "user/userinfo";
		
	}
	
	public User getuser(String username) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(User.class);
	     crit.add(Restrictions.eq("Username", username));
	     User user = (User) crit.uniqueResult();
		return user;
	}
	
	@RequestMapping(value = "/updateuser/{id}", method = RequestMethod.POST)
	public String deleteuser(ModelMap model,@PathVariable int id,@Validated @ModelAttribute("user") User user, BindingResult errors) throws IllegalStateException, SystemException {
		 Session session = factory.getCurrentSession();
	        	if(user.getUsername().trim().length()==0) {
	    			errors.rejectValue("username", "user", "Vui lòng nhập vào username!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}if(user.getPassword().trim().length()==0){
	    			errors.rejectValue("password", "user", "Vui lòng nhập vào password!");
	    			model.addAttribute("user", user);
	    			return "user/userinfo";
	    		}else{
	    			try {	  
	    				user.setPhanQuyen("user");
	    				session.update(user);
	    				model.addAttribute("user", user);
	    				model.addAttribute("message", "Sửa thành công!");
	    			} catch (Exception e) {
	    				model.addAttribute("message", "Sửa thất bại!");
	    				model.addAttribute("user", user);
	    				return "user/userinfo";
	    			}
	    			}
		return "user/userinfo";
		
	}

}
