package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="LoaiSanPham")
public class Type {

	@Id
	@GeneratedValue
	@Column(name="MaLoaiSP")
	int MaLoaiSP;
	@OneToMany(mappedBy = "type",fetch = FetchType.EAGER)
	Collection<Product> products;
	
	@Column(name="TenLoaiSP")
	String TenLoaiSP;

	
	public int getMaLoaiSP() {
		return MaLoaiSP;
	}

	public void setMaLoaiSP(int maLoaiSP) {
		MaLoaiSP = maLoaiSP;
	}

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}

	public String getTenLoaiSP() {
		return TenLoaiSP;
	}

	public void setTenLoaiSP(String tenLoaiSP) {
		TenLoaiSP = tenLoaiSP;
	}
	
	
	
}	
	
	

