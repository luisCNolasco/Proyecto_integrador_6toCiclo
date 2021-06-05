package com.veterinaria.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ProductoHasBoletaPK implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "num_boleta", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int num_boleta;

	@Column(name = "cod_pro", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int cod_pro;

	public int getNum_boleta() {
		return num_boleta;
	}

	public void setNum_boleta(int num_boleta) {
		this.num_boleta = num_boleta;
	}

	public int getCod_pro() {
		return cod_pro;
	}

	public void setCod_pro(int cod_pro) {
		this.cod_pro = cod_pro;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
