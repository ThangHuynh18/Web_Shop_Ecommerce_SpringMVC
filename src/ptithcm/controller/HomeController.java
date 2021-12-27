package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.CTHoaDon;
import ptithcm.entity.HoaDon;
import ptithcm.entity.Product;
import ptithcm.entity.User;

@Transactional
@Controller
public class HomeController {
	@Autowired
	SessionFactory factory;

	public List<Product> getAllProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product ORDER BY NEWID()";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getSac() {
		Session session = factory.getCurrentSession();
		String sac = "FROM Product where MaLoaiSP = 1";
		Query query = session.createQuery(sac);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getLoa() {
		Session session = factory.getCurrentSession();
		String loa = "FROM Product where MaLoaiSP = 2";
		Query query = session.createQuery(loa);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getOpLung() {
		Session session = factory.getCurrentSession();
		String opl = "FROM Product where MaLoaiSP = 3";
		Query query = session.createQuery(opl);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getPin() {
		Session session = factory.getCurrentSession();
		String pin = "FROM Product where MaLoaiSP = 4";
		Query query = session.createQuery(pin);
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getTaiNghe() {
		Session session = factory.getCurrentSession();
		String taiNghe = "FROM Product where MaLoaiSP = 5";
		Query query = session.createQuery(taiNghe);
		List<Product> list = query.list();
		return list;
	}

	public User getuser(String username) {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("Username", username));
		User user = (User) crit.uniqueResult();
		return user;
	}

	public Product getproduct(int maSP) {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(Product.class);
		crit.add(Restrictions.eq("MaSP", maSP));
		Product product = (Product) crit.uniqueResult();
		return product;
	}

	@RequestMapping("index")
	public String index(ModelMap model) {

		model.addAttribute("all", getAllProduct());
		model.addAttribute("sac", getSac());
		model.addAttribute("loa", getLoa());
		model.addAttribute("opl", getOpLung());
		model.addAttribute("pin", getPin());
		model.addAttribute("taiNghe", getTaiNghe());

		Session session = factory.getCurrentSession();

		String apple = "FROM Product where idbrand = 1 order by newid()";
		Query qr1 = session.createQuery(apple);
		List<Product> lst1 = qr1.list();
		model.addAttribute("apple", lst1);

		String samSung = "FROM Product where idbrand = 2";
		Query qr2 = session.createQuery(samSung);
		List<Product> lst2 = qr2.list();
		model.addAttribute("samSung", lst2);

		String xiaomi = "FROM Product where idbrand = 3";
		Query qr3 = session.createQuery(xiaomi);
		List<Product> lst3 = qr3.list();
		model.addAttribute("xiaomi", lst3);

		String sony = "FROM Product where idbrand = 4";
		Query qr4 = session.createQuery(sony);
		List<Product> lst4 = qr4.list();
		model.addAttribute("sony", lst4);

		String jbl = "FROM Product where idbrand = 5";
		Query qr5 = session.createQuery(jbl);
		List<Product> lst5 = qr5.list();
		model.addAttribute("jbl", lst5);

		String other = "FROM Product where idbrand = 6";
		Query qr6 = session.createQuery(other);
		List<Product> lst6 = qr6.list();
		model.addAttribute("other", lst6);

		return "index";
	}

	@RequestMapping("index/{username}")
	public String index1(ModelMap model, @PathVariable String username) {

		model.addAttribute("all", getAllProduct());
		model.addAttribute("sac", getSac());
		model.addAttribute("loa", getLoa());
		model.addAttribute("opl", getOpLung());
		model.addAttribute("pin", getPin());
		model.addAttribute("taiNghe", getTaiNghe());

		Session session = factory.getCurrentSession();

		String apple = "FROM Product where idbrand = 1 order by newid()";
		Query qr1 = session.createQuery(apple);
		List<Product> lst1 = qr1.list();
		model.addAttribute("apple", lst1);

		String samSung = "FROM Product where idbrand = 2";
		Query qr2 = session.createQuery(samSung);
		List<Product> lst2 = qr2.list();
		model.addAttribute("samSung", lst2);

		String xiaomi = "FROM Product where idbrand = 3";
		Query qr3 = session.createQuery(xiaomi);
		List<Product> lst3 = qr3.list();
		model.addAttribute("xiaomi", lst3);

		String sony = "FROM Product where idbrand = 4";
		Query qr4 = session.createQuery(sony);
		List<Product> lst4 = qr4.list();
		model.addAttribute("sony", lst4);

		String jbl = "FROM Product where idbrand = 5";
		Query qr5 = session.createQuery(jbl);
		List<Product> lst5 = qr5.list();
		model.addAttribute("jbl", lst5);

		String other = "FROM Product where idbrand = 6";
		Query qr6 = session.createQuery(other);
		List<Product> lst6 = qr6.list();
		model.addAttribute("other", lst6);

		model.addAttribute("user", getuser(username));
		return "index";
	}

	// Tìm kiếm
	@RequestMapping("search_page")
	public String action_page(ModelMap model, HttpServletRequest rq) {
		try {

			String param = rq.getParameter("xsearch");
			Session ss = factory.getCurrentSession();
			String hql = "From Product where TenSP LIKE '%" + param + "%'";
			Query query = ss.createQuery(hql);
			List<Product> list = query.list();
			System.out.println(list.size());
			model.addAttribute("combo", list);
			model.addAttribute("title", "Tìm được " + list.size() + " kết quả cho " + param + "");
		} catch (Exception e) {
			System.out.println(e);
		}
		return "product/search";
	}

	@RequestMapping("search_page/{username}")
	public String action_page1(ModelMap model, HttpServletRequest rq, @PathVariable String username) {
		try {

			String param = rq.getParameter("xsearch");
			Session ss = factory.getCurrentSession();
			String hql = "From Product where TenSP LIKE '%" + param + "%'";
			Query query = ss.createQuery(hql);
			List<Product> list = query.list();
			System.out.println(list.size());
			model.addAttribute("combo", list);
			model.addAttribute("title", "Tìm được " + list.size() + " kết quả cho " + param + "");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			System.out.println(e);
		}
		return "product/search";
	}
	
	
	@RequestMapping(value = "product/detail/{id}/{username}", method = RequestMethod.GET)
	public String singleproduct(ModelMap model, @PathVariable int id, @PathVariable String username)
			throws IllegalStateException, SystemException {
		model.addAttribute("p", getproduct(id));
		model.addAttribute("user", getuser(username));
		if (getproduct(id) != null) {
			try {
				model.addAttribute("product", getproduct(id));
			} catch (Exception e) {
			}

		}

		return "product/detail";
	}

	public List<HoaDon> getHoaDonNull(int maKH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HoaDon H WHERE H.MaKH = :maKH and H.TrangThai='0'";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List<HoaDon> list = query.list();
		return list;
	}

	public void newHD(String username) {
		Session session = factory.getCurrentSession();

		HoaDon hd = new HoaDon();
		hd.setMaKH(getuser(username).getMaKH());
		hd.setNgay(new Date());
		hd.setTrangThai("0");		//0 là mở ra đơn hàng mới để thêm chi tiết vào: đang chờ

		session.save(hd);

	}

	
	@RequestMapping(value = "addtocart/{id}/{username}/{soluong}")
	public String addtocart(ModelMap model, @PathVariable int id, @PathVariable String username,
			@PathVariable int soluong, final RedirectAttributes redirectAttributes)
					throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();

		if (getHoaDonNull(getuser(username).getMaKH()).isEmpty()) {
			newHD(username);
		}
		if (username == null) {
			model.addAttribute("message1", "Bạn phải đăng nhập để mua hàng!");
			return "user/login";
		}

		try {
			CTHoaDon ct = new CTHoaDon();
			ct.setUser(getuser(username));
			ct.setProduct(getproduct(id));
			ct.setNgay(new Date());
			ct.setTrangThai("0");
			ct.setHoaDon(getHoaDonNull(getuser(username).getMaKH()).get(0));
			if (soluong == 0) {
				ct.setSoLuong(1);
			} else {
				ct.setSoLuong(soluong);
			}
			ct.setSoTien(getproduct(id).getGiaSP() * ct.getSoLuong());

			session.save(ct);
			model.addAttribute("message", "Thêm sản phẩm vào giỏ hàng thành công!");

		} catch (Exception e) {
			model.addAttribute("message", "Thêm sản phẩm vào giỏ hàng thất bại!");
		}

		redirectAttributes.addFlashAttribute("user", getuser(username));
		return "redirect:./../../../index.htm";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		return "redirect:/index.htm";
	}

/*	@RequestMapping("search/{username}")
	public String search(ModelMap model, @PathVariable String username, @RequestParam("timkiem") String timkiem) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		Criteria query = session.createCriteria(Product.class);
		query.add(Restrictions.like("TenSP", timkiem, MatchMode.ANYWHERE));
		List<Product> list = query.list();
		if (list.isEmpty() == true) {
			query.add(Restrictions.like("HangSX", timkiem, MatchMode.ANYWHERE));
			list = query.list();
		}
		int size = list.size();
		if (list.isEmpty() == true) {
			model.addAttribute("message", "Không tìm thấy kết quả cho: " + timkiem);
		} else {
			model.addAttribute("p", list);
			model.addAttribute("message", "Tìm thấy " + size + " kết quả cho: " + timkiem);
		}
		return "home/search";

	}

	@RequestMapping("search")
	public String search1(ModelMap model, @RequestParam("timkiem") String timkiem) {

		Session session = factory.getCurrentSession();
		Criteria query = session.createCriteria(Product.class);
		query.add(Restrictions.like("TenSP", timkiem, MatchMode.ANYWHERE));
		List<Product> list = query.list();
		if (list.isEmpty() == true) {
			query.add(Restrictions.like("HangSX", timkiem, MatchMode.ANYWHERE));
			list = query.list();
		}
		int size = list.size();
		if (list.isEmpty() == true) {
			model.addAttribute("message", "Không tìm thấy kết quả cho: " + timkiem);
		} else {
			model.addAttribute("p", list);
			model.addAttribute("message", "Tìm thấy " + size + " kết quả cho: " + timkiem);
		}
		return "home/search";

	}*/
}
