package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="HoaDon")
public class HoaDon {
	
	@Id
	@GeneratedValue
	@Column(name="MaHD")
	int MaHD;
	
	@OneToMany(mappedBy = "hoaDon",fetch = FetchType.EAGER)
	Collection<CTHoaDon> ctHoaDons;
	
	@Column(name="Ngay")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date Ngay;
	@Column(name="TrangThai")
	String TrangThai;
	@Column(name="SoTien")
	int SoTien;
	@Column(name="MaKH")
	int MaKH;
	
	public int getMaHD() {
		return MaHD;
	}
	public void setMaHD(int maHD) {
		MaHD = maHD;
	}
	public Collection<CTHoaDon> getCtHoaDons() {
		return ctHoaDons;
	}
	public void setCtHoaDons(Collection<CTHoaDon> ctHoaDons) {
		this.ctHoaDons = ctHoaDons;
	}
	public Date getNgay() {
		return Ngay;
	}
	public void setNgay(Date ngay) {
		Ngay = ngay;
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
	public int getMaKH() {
		return MaKH;
	}
	public void setMaKH(int maKH) {
		MaKH = maKH;
	}
	
	

}
