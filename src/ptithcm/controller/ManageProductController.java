package ptithcm.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Product;
import ptithcm.entity.Type;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/product/")
public class ManageProductController {

	@Autowired
	SessionFactory factory;

	@RequestMapping(value="index", method=RequestMethod.GET)
	public String user(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM Product";
		Query query = session.createQuery(hql);
		long totalPro = (long) query.uniqueResult();
		int totalPage = (int) (totalPro / 9 +((totalPro % 9 == 0)? 0 : 1));
		
		hql = "FROM Product order by MaSP DESC";
		query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(8);
		
		List<Product> list = query.list();
		model.addAttribute("products", list);
		model.addAttribute("totalPage", totalPage);
		
		return "product/index";
	}
	
	
	@RequestMapping(value="index/page{stt}", method=RequestMethod.GET)
	public String user1(ModelMap model, @PathVariable int stt) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM Product";
		Query query = session.createQuery(hql);
		long totalPro = (long) query.uniqueResult();
		int totalPage = (int) (totalPro / 9 +((totalPro % 9 == 0)? 0 : 1));
		
		if(stt>totalPage)
			return "redirect:/product/index.htm";
		
		hql = "FROM Product order by MaSP DESC";
		query = session.createQuery(hql);
		query.setFirstResult((stt-1)*9);
		query.setMaxResults(9);
		List<User> list = query.list();
		model.addAttribute("products", list);
		model.addAttribute("totalPage", totalPage);
		
		return "product/index";
	}

	@ModelAttribute("types")
	public List<Type> getType(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Type";
		Query query = session.createQuery(hql);
		List<Type> list = query.list();
		model.addAttribute("types", list);
		return list;
	}

	@ModelAttribute("brands")
	public List<Type> getBrand(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Brand";
		Query query = session.createQuery(hql);
		List<Type> list = query.list();
		model.addAttribute("brands", list);
		return list;
	}

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("product", new Product());
		return "product/insert";
	}

	@Autowired
	ServletContext context;

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @RequestParam("photo") MultipartFile photo,
			@ModelAttribute("product") Product product, BindingResult errors)
					throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (product.getTenSP().trim().length() == 0) {
			errors.rejectValue("tenSP", "product", "Vui l??ng nh???p v??o t??n s???n ph???m!");
			return "product/insert";
		}
		if (photo.isEmpty()) {
			errors.rejectValue("anhSP", "product", "???nh s???n ph???m kh??ng ???????c ????? tr???ng!");
			return "product/insert";
		}
		if (product.getType().getMaLoaiSP() > 6 || product.getType().getMaLoaiSP() < 1) {
			errors.rejectValue("type.maLoaiSP", "product", "Lo???i s???n ph???m kh??ng ch??nh x??c!");
			return "product/insert";
		}
		if(product.getGiaSP()==0){
			errors.rejectValue("giaSP","product","Vui l??ng nh???p gi?? s???n ph???m!");
			return "product/insert";
		}
		if (product.getGiaSP() < 0) {
			errors.rejectValue("giaSP", "product", "Gi?? s???n ph???m kh??ng h???p l???!");
			return "product/insert";
		}
		if (product.getMoTaSP().trim().length() == 0) {
			errors.rejectValue("moTaSP", "product", "Vui l??ng nh???p v??o m?? t??? s???n ph???m!");
			return "product/insert";
		}
		if (product.getSoLuongSP() == 0) {
			errors.rejectValue("soLuongSP", "product", "Vui l??ng nh???p s??? l?????ng s???n ph???m!");
			return "product/insert";
		}
		if (product.getSoLuongSP() < 0) {
			errors.rejectValue("soLuongSP", "product", "S??? l?????ng s???n ph???m kh??ng h???p l???!");
			return "product/insert";
		}
		if(product.getHangSX().trim().length()==0){
			errors.rejectValue("HangSX","product","Vui l??ng nh???p h??ng s???n xu???t!");
			return "product/insert";
		}

		if(errors.hasErrors()){
			model.addAttribute("message", "Vui l??ng s???a c??c l???i sau ????y!!");
			
		}
		else {
			try {
				String photoPath = context.getRealPath("/files/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				product.setAnhSP("files/" + photo.getOriginalFilename());
				product.setNgayTaoSP(new Date());
				session.save(product);
				t.commit();
				model.addAttribute("message", "Th??m s???n ph???m m???i th??nh c??ng!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", e);
			}
		}

		return "redirect:product/../index.htm";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable int id, ModelMap model) throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Criteria crit = session.createCriteria(Product.class);
		crit.add(Restrictions.eq("MaSP", id));
		Product product = (Product) crit.uniqueResult();
		try{
			
		
		if (product != null) {
			session.delete(product);
			model.addAttribute("message", "X??a s???n ph???m th??nh c??ng!");
			t.commit();
		}
		}catch(Exception e){
			model.addAttribute("message", "X??a s???n ph???m th???t b???i!");
			t.rollback();
		}

		return "redirect:../index.htm";

	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable int id) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(Product.class);
		crit.add(Restrictions.eq("MaSP", id));
		Product product = (Product) crit.uniqueResult();
		if (product != null) {
			try {
				model.addAttribute("product", product);
			} catch (Exception e) {
			}

		}

		return "product/update";

	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String updateproduct(ModelMap model, @PathVariable int id, @RequestParam("photo") MultipartFile photo,
			@Validated @ModelAttribute("product") Product product, BindingResult errors)
					throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (product.getTenSP().trim().length() == 0) {
			errors.rejectValue("tenSP", "product", "Vui l??ng nh???p v??o t??n s???n ph???m!");
			return "product/update";
		}
		if (product.getType().getMaLoaiSP() > 6 || product.getType().getMaLoaiSP() < 1) {
			errors.rejectValue("type.maLoaiSP", "product", "Lo???i s???n ph???m kh??ng ch??nh x??c!");
			return "product/update";
		}
		if (product.getGiaSP() < 0) {
			errors.rejectValue("giaSP", "product", "Gi?? s???n ph???m kh??ng h???p l???!");
			return "product/update";
		}
		if (photo.isEmpty() && product.getAnhSP().trim().length() == 0) {
			errors.rejectValue("anhSP", "product", "???nh s???n ph???m kh??ng ???????c ????? tr???ng!");
			return "product/update";
		}
		if (product.getSoLuongSP() < 0) {
			errors.rejectValue("soLuongSP", "product", "S??? l?????ng s???n ph???m kh??ng h???p l???!");
			return "product/update";
		}
		if (product.getNgayTaoSP() == null) {
			model.addAttribute("message1", "Vui l??ng ??i???n ????ng ?????nh d???ng ng??y:?? yyyy-mm-dd !");
			return "product/update";
		}
		if(product.getMoTaSP().trim().length()== 0){
			errors.rejectValue("moTaSP","product","Vui l??ng nh???p v??o m?? t??? s???n ph???m!");
			return "product/update";
		}
		if(errors.hasErrors()){
			model.addAttribute("message", "Vui l??ng s???a c??c l???i sau ????y!!");
		}
		else {
			try {
				if (!photo.isEmpty()) {
					String photoPath = context.getRealPath("/files/" + photo.getOriginalFilename());
					photo.transferTo(new File(photoPath));
					product.setAnhSP("files/" + photo.getOriginalFilename());
				}
				product.setNgayTaoSP(product.getNgayTaoSP());
				session.update(product);
				t.commit();
				model.addAttribute("message", "S???a s???n ph???m th??nh c??ng!");
			} catch (Exception e) {
				model.addAttribute("message", "S???a s???n ph???m th???t b???i!");
				t.rollback();
			}
		}

		return "redirect:../index.htm";

	}
}