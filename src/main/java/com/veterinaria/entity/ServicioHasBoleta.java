package com.veterinaria.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tb_servicio_has_boleta")
public class ServicioHasBoleta {
	
	@EmbeddedId
	private ServicioHasBoletaPK servicioHasBoletaPK;
	
	@Column(precision = 22)
	private double precio;
	
	@Column(length = 10)
	private int cantidad;
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "num_boleta", nullable = false, insertable = false, updatable = false)
	private Boleta boleta;

	@ManyToOne(optional = false)
	@JoinColumn(name = "cod_ser", nullable = false, insertable = false, updatable = false)
	private Servicios servicio;

	public ServicioHasBoletaPK getServicioHasBoletaPK() {
		return servicioHasBoletaPK;
	}

	public void setServicioHasBoletaPK(ServicioHasBoletaPK servicioHasBoletaPK) {
		this.servicioHasBoletaPK = servicioHasBoletaPK;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public Boleta getBoleta() {
		return boleta;
	}

	public void setBoleta(Boleta boleta) {
		this.boleta = boleta;
	}

	public Servicios getServicio() {
		return servicio;
	}

	public void setServicio(Servicios servicio) {
		this.servicio = servicio;
	}
	
	
}
