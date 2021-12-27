package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Product;
import ptithcm.entity.User;

@Controller
@Transactional
public class DirectController {
	@Autowired
	SessionFactory factory;

	@RequestMapping(value="all", method=RequestMethod.GET)
	public String all(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "SELECT COUNT(*) FROM Product ";
			Query query = session.createQuery(hql);
			long totalPro = (long) query.uniqueResult();
			int totalPage = (int) (totalPro / 9 +((totalPro % 9 == 0)? 0 : 1));
			
			hql = "FROM Product";
			query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(8);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Tất cả sản phẩm");
			model.addAttribute("totalPage", totalPage);	
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}
	
	@RequestMapping(value="all/page{stt}", method=RequestMethod.GET)
	public String alll(ModelMap model, @PathVariable int stt) {
		
		try {

			Session session = factory.getCurrentSession();
			String hql = "SELECT COUNT(*) FROM Product ";
			Query query = session.createQuery(hql);
			long totalPro = (long) query.uniqueResult();
			int totalPage = (int) (totalPro / 9 +((totalPro % 9 == 0)? 0 : 1));
			
			if(stt>totalPage)
				return "redirect:/all.htm";
			
			hql = "FROM Product";
			query = session.createQuery(hql);
			query.setFirstResult((stt-1)*9);
			query.setMaxResults(9);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Tất cả sản phẩm");
			model.addAttribute("totalPage", totalPage);	
			

		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}
	
	@RequestMapping(value="category/{category}", method=RequestMethod.GET)
	public String showCate(ModelMap model, @PathVariable("category") String category){
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM Product WHERE MaLoaiSP.TenLoaiSP ='"+category+"'";
		Query query = session.createQuery(hql);
		long totalPro = (long) query.uniqueResult();
		int totalPage = (int) (totalPro / 9 +((totalPro % 9 == 0)? 0 : 1));
		
		hql = "From Product p where p.MaLoaiSP.TenLoaiSP = '"+category+"'";
		query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(8);
		List<Product> list = query.list();
		
		model.addAttribute("lstProCate", list);
		model.addAttribute("cateName", category);
		model.addAttribute("totalPage", totalPage);	
		return "product/direct";
	}
	
	@RequestMapping("cap")
	public String cap(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 1";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Cáp Sạc Giá Cực Cạnh Tranh");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("loa")
	public String loa(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 2";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Loa Giá Rẻ Công Suất Mạnh Mẽ !");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("op")
	public String op(ModelMap model) {

		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 3";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Ốp Lưng Giá Rẻ Cực Bền !");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}

	@RequestMapping("sac")
	public String sac(ModelMap model) {

		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 4";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Sạc Dự Phòng Giá Rẻ Pin Trâu !");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}

	@RequestMapping("tai")
	public String tai(ModelMap model) {

		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 5";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Tai Nghe Giá Rẻ Chất Âm Hay !");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}

	@RequestMapping("apple")
	public String apple(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 1";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện dành cho sản phẩm Apple");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("samsung")
	public String samsung(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 2";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện dành cho sản phẩm Samsung");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("xiaomi")
	public String xiaomi(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 3";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện dành cho sản phẩm Xiaomi");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("sony")
	public String sony(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 4";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện Sony chính hãng");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("jbl")
	public String jbl(ModelMap model) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 5";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện JBL chính hãng");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	
	
	
	public User getuser(String username) {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("Username", username));
		User user = (User) crit.uniqueResult();
		return user;
	}

	@RequestMapping(value="all/{username}", method=RequestMethod.GET)
	public String all1(ModelMap model, @PathVariable String username) {
		
		try {

			Session session = factory.getCurrentSession();
			String hql = "SELECT COUNT(*) FROM Product ";
			Query query = session.createQuery(hql);
			long totalPro = (long) query.uniqueResult();
			int totalPage = (int) (totalPro / 9 +((totalPro % 9 == 0)? 0 : 1));
			
			hql = "FROM Product";
			query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(9);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Tất cả sản phẩm");
			model.addAttribute("totalPage", totalPage);	
			model.addAttribute("user", getuser(username));

		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}
	
	
	@RequestMapping(value="all/{username}/page{stt}", method=RequestMethod.GET)
	public String all2(ModelMap model, @PathVariable String username, @PathVariable int stt) {
		
		try {

			Session session = factory.getCurrentSession();
			String hql = "SELECT COUNT(*) FROM Product ";
			Query query = session.createQuery(hql);
			long totalPro = (long) query.uniqueResult();
			int totalPage = (int) (totalPro / 9 +((totalPro % 9 == 0)? 0 : 1));
			
			if(stt>totalPage)
				return "redirect:/all/{username}.htm";
			
			hql = "FROM Product";
			query = session.createQuery(hql);
			query.setFirstResult((stt-1)*9);
			query.setMaxResults(9);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Tất cả sản phẩm");
			model.addAttribute("totalPage", totalPage);	
			model.addAttribute("user", getuser(username));

		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}
	

	@RequestMapping("cap/{username}")
	public String cap1(ModelMap model, @PathVariable String username) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 1";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Cáp Sạc Giá Cực Cạnh Tranh");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("loa/{username}")
	public String loa1(ModelMap model, @PathVariable String username) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 2";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Loa Giá Rẻ Công Suất Mạnh Mẽ !");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("op/{username}")
	public String op1(ModelMap model, @PathVariable String username) {

		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 3";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Ốp Lưng Giá Rẻ Cực Bền !");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}

	@RequestMapping("sac/{username}")
	public String sac1(ModelMap model, @PathVariable String username) {

		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 4";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Sạc Dự Phòng Giá Rẻ Pin Trâu !");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}

	@RequestMapping("tai/{username}")
	public String tai1(ModelMap model, @PathVariable String username) {

		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where MaLoaiSP = 5";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Tai Nghe Giá Rẻ Chất Âm Hay !");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";

	}

	@RequestMapping("apple/{username}")
	public String apple1(ModelMap model, @PathVariable String username) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 1";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện dành cho sản phẩm Apple");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("samsung/{username}")
	public String samsung1(ModelMap model, @PathVariable String username) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 2";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện dành cho sản phẩm Samsung");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("xiaomi/{username}")
	public String xiaomi1(ModelMap model, @PathVariable String username) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 3";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện dành cho sản phẩm Xiaomi");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("sony/{username}")
	public String sony1(ModelMap model, @PathVariable String username) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 4";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện Sony chính hãng");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

	@RequestMapping("jbl/{username}")
	public String jbl1(ModelMap model, @PathVariable String username) {
		try {

			Session session = factory.getCurrentSession();
			String hql = "FROM Product where idbrand = 5";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();

			model.addAttribute("direct", list);
			model.addAttribute("title", "Phụ kiện JBL chính hãng");
			model.addAttribute("user", getuser(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "product/direct";
	}

}
