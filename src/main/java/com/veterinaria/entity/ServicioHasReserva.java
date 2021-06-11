package com.veterinaria.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "tb_servicio_has_reserva")
public class ServicioHasReserva {

	@EmbeddedId
	private ServicioHasReservaPK servicioHasReservaPK;

	@Column(precision = 22)
	private double precio;

	@Column(length = 10)
	private String fecha;

	@ManyToOne(optional = false)
	@JoinColumn(name = "num_reserva", nullable = false, insertable = false, updatable = false)
	private Reserva reserva;

	@ManyToOne(optional = false)
	@JoinColumn(name = "cod_ser", nullable = false, insertable = false, updatable = false)
	private Servicios servicio;

	public ServicioHasReservaPK getServicioHasReservaPK() {
		return servicioHasReservaPK;
	}

	public void setServicioHasReservaPK(ServicioHasReservaPK servicioHasReservaPK) {
		this.servicioHasReservaPK = servicioHasReservaPK;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Reserva getReserva() {
		return reserva;
	}

	public void setReserva(Reserva reserva) {
		this.reserva = reserva;
	}

	public Servicios getServicio() {
		return servicio;
	}

	public void setServicio(Servicios servicio) {
		this.servicio = servicio;
	}

	
	
	
}
