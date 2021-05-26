package com.veterinaria.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="tb_servicio")
public class Servicios {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_ser")
	private int cod_ser;
	
	@Column(name = "nom_ser")
	private String nom_ser;

	@Column(name = "pre_ser")
	private String pre_ser;
	
	@Column(name = "desc_ser")
	private String desc_ser;
	
	@Column(name = "horio_ser")
	private String horio_ser;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "fec_ser")
	private Date fec_ser;

	
	
	
	public int getCod_ser() {
		return cod_ser;
	}

	public void setCod_ser(int cod_ser) {
		this.cod_ser = cod_ser;
	}

	public String getNom_ser() {
		return nom_ser;
	}

	public void setNom_ser(String nom_ser) {
		this.nom_ser = nom_ser;
	}

	public String getPre_ser() {
		return pre_ser;
	}

	public void setPre_ser(String pre_ser) {
		this.pre_ser = pre_ser;
	}

	public String getDesc_ser() {
		return desc_ser;
	}

	public void setDesc_ser(String desc_ser) {
		this.desc_ser = desc_ser;
	}

	public String getHorio_ser() {
		return horio_ser;
	}

	public void setHorio_ser(String horio_ser) {
		this.horio_ser = horio_ser;
	}

	public Date getFec_ser() {
		return fec_ser;
	}

	public void setFec_ser(Date fec_ser) {
		this.fec_ser = fec_ser;
	}
	
	
	
	
	
}
