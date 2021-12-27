package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SanPham")
public class Product {
	@Id
	@GeneratedValue
	@Column(name="MaSP")
	int MaSP;
	@Column(name="TenSP")
	String TenSP;
	@Column(name="MoTaSP")
	String MoTaSP;
	@Column(name="GiaSP")
	int GiaSP;
	@Column(name="AnhSP")
	String AnhSP;
	
	@Column(name="NgayTaoSP")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date NgayTaoSP;
	
	@Column(name="SoLuongSP")
	int SoLuongSP;
	
	@ManyToOne
	@JoinColumn(name = "MaLoaiSP")
	Type type;
	
	@ManyToOne
	@JoinColumn(name = "idBrand")
	Brand brand;
	
	@Column(name="HangSX")
	String HangSX;
	
	@OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
	Collection<CTHoaDon> ctHoaDons;

	
	public Collection<CTHoaDon> getCtHoaDons() {
		return ctHoaDons;
	}

	public void setCtHoaDons(Collection<CTHoaDon> ctHoaDons) {
		this.ctHoaDons = ctHoaDons;
	}

	public int getMaSP() {
		return MaSP;
	}

	public void setMaSP(int maSP) {
		MaSP = maSP;
	}

	public String getTenSP() {
		return TenSP;
	}

	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}

	public String getMoTaSP() {
		return MoTaSP;
	}

	public void setMoTaSP(String moTaSP) {
		MoTaSP = moTaSP;
	}

	public int getGiaSP() {
		return GiaSP;
	}

	public void setGiaSP(int giaSP) {
		GiaSP = giaSP;
	}

	public String getAnhSP() {
		return AnhSP;
	}

	public void setAnhSP(String anhSP) {
		AnhSP = anhSP;
	}

	public Date getNgayTaoSP() {
		return NgayTaoSP;
	}

	public void setNgayTaoSP(Date ngayTaoSP) {
		NgayTaoSP = ngayTaoSP;
	}

	public int getSoLuongSP() {
		return SoLuongSP;
	}

	public void setSoLuongSP(int soLuongSP) {
		SoLuongSP = soLuongSP;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getHangSX() {
		return HangSX;
	}

	public void setHangSX(String hangSX) {
		HangSX = hangSX;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}	
	
	
}
