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
@Table(name="Brands")
public class Brand {

	@Id
	@GeneratedValue
	@Column(name="idBrand")
	int idbrand;
	@OneToMany(mappedBy = "brand",fetch = FetchType.EAGER)
	Collection<Product> products;
	
	@Column(name="tenBrand")
	String TenBrand;

	
	public int getIdBrand() {
		return idbrand;
	}

	public void setIdBrand(int idbrand) {
		this.idbrand = idbrand;
	}

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}

	public String getTenBrand() {
		return TenBrand;
	}

	public void setTenBrand(String tenBrand) {
		TenBrand = tenBrand;
	}
	
	
	
}	
	
	

