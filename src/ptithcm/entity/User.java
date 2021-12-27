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
@Table(name="KhachHang")
public class User {
	
	@Id
	@GeneratedValue
	@Column(name="MaKH")
	int MaKH;
	
	@OneToMany(mappedBy = "user",fetch = FetchType.EAGER)
	Collection<CTHoaDon> ctHoaDons;
	
	@Column(name="Username")
	String Username;
	@Column(name="Password")
	String Password;
	@Column(name="PhanQuyen")
	String PhanQuyen;
	@Column(name="Ho")
	String Ho;
	@Column(name="Ten")
	String Ten;
	@Column(name="Email")
	String Email;
	@Column(name="SDT")
	String SDT;
	
	
	
	public Collection<CTHoaDon> getCtHoaDons() {
		return ctHoaDons;
	}
	public void setCtHoaDons(Collection<CTHoaDon> ctHoaDons) {
		this.ctHoaDons = ctHoaDons;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getMaKH() {
		return MaKH;
	}
	public void setMaKH(int maKH) {
		MaKH = maKH;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getPhanQuyen() {
		return PhanQuyen;
	}
	public void setPhanQuyen(String phanQuyen) {
		PhanQuyen = phanQuyen;
	}
	public String getHo() {
		return Ho;
	}
	public void setHo(String ho) {
		Ho = ho;
	}
	public String getTen() {
		return Ten;
	}
	public void setTen(String ten) {
		Ten = ten;
	}

		
	
}
