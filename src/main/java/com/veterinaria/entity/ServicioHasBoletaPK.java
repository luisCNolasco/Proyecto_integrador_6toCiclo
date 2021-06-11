package com.veterinaria.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ServicioHasBoletaPK implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "num_boleta", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int num_boleta;

	@Column(name = "cod_ser", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int cod_ser;

	public int getNum_boleta() {
		return num_boleta;
	}

	public void setNum_boleta(int num_boleta) {
		this.num_boleta = num_boleta;
	}

	public int getCod_ser() {
		return cod_ser;
	}

	public void setCod_ser(int cod_ser) {
		this.cod_ser = cod_ser;
	}

	
}
