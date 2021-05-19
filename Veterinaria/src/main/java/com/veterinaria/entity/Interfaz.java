package com.veterinaria.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_interfaz")
public class Interfaz {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cod_int")
    private int cod_int;
    
	@Column(name="des_int")
	private String des_int;
		
	@Column(name="url_int")
	private String url_int;
	
	@Column(name="cod_tip_usu")
	private int cod_tip_usu;

	public int getCod_int() {
		return cod_int;
	}

	public void setCod_int(int cod_int) {
		this.cod_int = cod_int;
	}

	public String getDes_int() {
		return des_int;
	}

	public void setDes_int(String des_int) {
		this.des_int = des_int;
	}

	public String getUrl_int() {
		return url_int;
	}

	public void setUrl_int(String url_int) {
		this.url_int = url_int;
	}

	public int getCod_tip_usu() {
		return cod_tip_usu;
	}

	public void setCod_tip_usu(int cod_tip_usu) {
		this.cod_tip_usu = cod_tip_usu;
	}
}	