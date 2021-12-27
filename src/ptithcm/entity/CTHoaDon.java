package ptithcm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="CTHoaDon")
public class CTHoaDon {
	
	@Id
	@GeneratedValue
	@Column(name="MaCTHD")
	int MaCTHD;

	@ManyToOne
	@JoinColumn(name = "MaSP")
	Product product;
	
	@ManyToOne
	@JoinColumn(name = "MaHD")
	HoaDon hoaDon;
	
	@Column(name="SoLuong")
	int SoLuong;

	@ManyToOne
	@JoinColumn(name = "MaKH")
	User user;
	
	@Column(name="TrangThai")
	String TrangThai;
	@Column(name="SoTien")
	int SoTien;
	@Column(name="Ngay")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date Ngay;
	
	public int getMaCTHD() {
		return MaCTHD;
	}
	public void setMaCTHD(int maCTHD) {
		MaCTHD = maCTHD;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public HoaDon getHoaDon() {
		return hoaDon;
	}
	public void setHoaDon(HoaDon hoaDon) {
		this.hoaDon = hoaDon;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(String trangThai) {
		TrangThai = trangThai;
	}
	public int getSoTien() {
		return SoTien;
	}
	public void setSoTien(int soTien) {
		SoTien = soTien;
	}
	public Date getNgay() {
		return Ngay;
	}
	public void setNgay(Date ngay) {
		Ngay = ngay;
	}
	
	
}
