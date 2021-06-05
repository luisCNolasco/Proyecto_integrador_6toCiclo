package com.veterinaria.entity;

public class Seleccion {

	private int cod_pro;
	private String nombre;
	private double precio;
	private int cantidad;
	private double totalParcial;

	public double getTotalParcial() {
		totalParcial = precio * cantidad;
		return totalParcial;
	}

	public int getCod_pro() {
		return cod_pro;
	}

	public void setCod_pro(int cod_pro) {
		this.cod_pro = cod_pro;
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

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public void setTotalParcial(double totalParcial) {
		this.totalParcial = totalParcial;
	}

}
