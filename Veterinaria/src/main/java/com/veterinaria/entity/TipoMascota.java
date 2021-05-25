package com.veterinaria.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_tipo_mascota")
public class TipoMascota {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "codTipo_masc")
	private int tipoMascota;
	
	@Column(name = "nomTipo_masc")
	private String nombreMascota;

	public int getTipoMascota() {
		return tipoMascota;
	}

	public void setTipoMascota(int tipoMascota) {
		this.tipoMascota = tipoMascota;
	}

	public String getNombreMascota() {
		return nombreMascota;
	}

	public void setNombreMascota(String nombreMascota) {
		this.nombreMascota = nombreMascota;
	}
	
	
}
