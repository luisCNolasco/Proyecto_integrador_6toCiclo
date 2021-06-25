package com.veterinaria.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_incidencia")
public class Incidencias {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_inc")
	private int cod_inc;
	
	@ManyToOne
	@JoinColumn(name = "cod_usu")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name = "cod_mas")
	private Mascota mascota;
	
	@Column(name = "desc_inc")
	private String desc_inc;
	
	@Column(name = "recom_inc")
	private String recom_inc;

	public int getCod_inc() {
		return cod_inc;
	}

	public void setCod_inc(int cod_inc) {
		this.cod_inc = cod_inc;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Mascota getMascota() {
		return mascota;
	}

	public void setMascota(Mascota mascota) {
		this.mascota = mascota;
	}

	public String getDesc_inc() {
		return desc_inc;
	}

	public void setDesc_inc(String desc_inc) {
		this.desc_inc = desc_inc;
	}

	public String getRecom_inc() {
		return recom_inc;
	}

	public void setRecom_inc(String recom_inc) {
		this.recom_inc = recom_inc;
	}
	

	
	
	
}
