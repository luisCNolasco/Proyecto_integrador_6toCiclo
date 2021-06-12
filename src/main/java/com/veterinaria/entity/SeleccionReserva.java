package com.veterinaria.entity;

import java.util.Date;

public class SeleccionReserva {
	
	private int cod_ser;
	private String nombre;
	private double precio;
	private String fecha;
	private double totalParcial;
	public int getCod_ser() {
		return cod_ser;
	}
	public void setCod_ser(int cod_ser) {
		this.cod_ser = cod_ser;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
	public double getTotalParcial() {
		return totalParcial;
	}
	public void setTotalParcial(double totalParcial) {
		this.totalParcial = totalParcial;
	}

	
}
