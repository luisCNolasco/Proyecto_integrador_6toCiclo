package com.veterinaria.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ServicioHasReservaPK implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "num_reserva", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int num_reserva;

	@Column(name = "cod_ser", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int cod_ser;

	public int getNum_reserva() {
		return num_reserva;
	}

	public void setNum_reserva(int num_reserva) {
		this.num_reserva = num_reserva;
	}

	public int getCod_ser() {
		return cod_ser;
	}

	public void setCod_ser(int cod_ser) {
		this.cod_ser = cod_ser;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	
}
