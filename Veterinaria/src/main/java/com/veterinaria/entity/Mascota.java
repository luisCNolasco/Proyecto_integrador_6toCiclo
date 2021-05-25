package com.veterinaria.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_mascota")
public class Mascota {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_mas")
	private int codigoMascota;
	
	@Column(name = "nom_mas")
	private String nombreMascota;
	
	@ManyToOne
	@JoinColumn(name = "codTipo_masc")
	private TipoMascota tipoMascota;
	
	@Column(name = "cod_usu")
	private int codigoUsuario;
	
	@Lob
	@Column(name = "foto")
	private byte[] foto1;

	public int getCodigoMascota() {
		return codigoMascota;
	}

	public void setCodigoMascota(int codigoMascota) {
		this.codigoMascota = codigoMascota;
	}

	public String getNombreMascota() {
		return nombreMascota;
	}

	public void setNombreMascota(String nombreMascota) {
		this.nombreMascota = nombreMascota;
	}

	
	public TipoMascota getTipoMascota() {
		return tipoMascota;
	}

	public void setTipoMascota(TipoMascota tipoMascota) {
		this.tipoMascota = tipoMascota;
	}

	public byte[] getFoto1() {
		return foto1;
	}

	public void setFoto1(byte[] foto1) {
		this.foto1 = foto1;
	}

	public int getCodigoUsuario() {
		return codigoUsuario;
	}

	public void setCodigoUsuario(int codigoUsuario) {
		this.codigoUsuario = codigoUsuario;
	}
	
	
}
