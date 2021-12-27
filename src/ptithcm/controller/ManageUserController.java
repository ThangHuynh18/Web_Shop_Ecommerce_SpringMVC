package ptithcm.controller;

import java.util.List;

import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/admin/")
public class ManageUserController {

	@Autowired
	SessionFactory factory;

	@RequestMapping("user")
	public String user(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		model.addAttribute("users", list);

		return "admin/user";
	}

	@RequestMapping(value = "deleteuser/{id}")
	public String delete(@PathVariable int id, ModelMap model) throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("MaKH", id));
		User user = (User) crit.uniqueResult();
		try{
			
		
		if (user != null) {
			session.delete(user);
			model.addAttribute("message", "Xóa user thành công!");
			t.commit();
		}
		}catch(Exception e){
			model.addAttribute("message", "Xóa user thất bại!");
			t.rollback();
		}
		return "redirect:../user.htm";

	}

	@RequestMapping(value = "insertuser", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("user", new User());
		return "admin/insertuser";
	}

	@RequestMapping(value = "insertuser", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user") User user, BindingResult errors)
			throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("Username", user.getUsername()));
		User user1 = (User) crit.uniqueResult();
		if (user1 != null) {
			model.addAttribute("message", "Tên đăng nhập đã được sử dụng, vui lòng dùng tên đăng nhập khác!");
			return "admin/insertuser";
		} else if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user", "Vui lòng nhập vào username!");
			return "admin/insertuser";
		} else if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Vui lòng nhập vào password!");
			return "admin/insertuser";
		}else if (user.getHo().trim().length() == 0) {
			errors.rejectValue("ho", "user", "Vui lòng nhập vào họ!");
			return "admin/insertuser";
		} else if (user.getTen().trim().length() == 0) {
			errors.rejectValue("ten", "user", "Vui lòng nhập vào tên!");
			return "admin/insertuser";
		} else if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập vào email!");
			return "admin/insertuser";
		} else if (user.getSDT().trim().length() == 0) {
			errors.rejectValue("sDT", "user", "Vui lòng nhập vào số điện thoại!");
			return "admin/insertuser";
		} 
		else {
			try {
				user.setPhanQuyen("user");
				session.save(user);
				t.commit();
				model.addAttribute("message", "Thêm user mới thành công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Thêm user mới thất bại!");
			}
		}

		return "redirect:admin/../user.htm";
	}

	@RequestMapping(value = "updateuser/{id}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable int id) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("MaKH", id));
		User user = (User) crit.uniqueResult();
		if (user != null) {
			try {
				model.addAttribute("user", user);
			} catch (Exception e) {
			}
		}

		return "admin/updateuser";

	}

	@RequestMapping(value = "updateuser/{id}", method = RequestMethod.POST)
	public String deleteuser(ModelMap model, @PathVariable int id, @Validated @ModelAttribute("user") User user,
			BindingResult errors) throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user", "Vui lòng nhập vào username!");
			return "admin/updateuser";
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Vui lòng nhập vào password!");
			return "admin/updateuser";
		}
		if (user.getHo().trim().length() == 0) {
			errors.rejectValue("ho", "user", "Vui lòng nhập vào họ!");
			return "admin/updateuser";
		}
		if (user.getTen().trim().length() == 0) {
			errors.rejectValue("ten", "user", "Vui lòng nhập vào tên!");
			return "admin/updateuser";
		}
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập vào email!");
			return "admin/updateuser";
		}
		if (user.getSDT().trim().length() == 0) {
			errors.rejectValue("sDT", "user", "Vui lòng nhập vào số điện thoại!");
			return "admin/updateuser";
		}
		else {
			try {
				user.setPhanQuyen("user");
				session.update(user);
				model.addAttribute("message", "Sửa user thành công!");
				t.commit();
			} catch (Exception e) {
				model.addAttribute("message", "Sửa user thất bại!");
				t.rollback();
				return "admin/updateuser";
			}
		}

		return "redirect:../user.htm";

	}
}
