package com.veterinaria.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="tb_proveedor")
public class Proveedor {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_prov")
	private int cod_prov;
	
	@Column(name="razon_prov")
	private String razon_prov;
		
	@Column(name="ruc_prov")
	private String ruc_prov;
	
	@Column(name="dir_prov")
	private String dir_prov;

	@JsonIgnore
	@OneToMany(mappedBy = "proveedor")
	private List<Producto> productos;

	public int getCod_prov() {
		return cod_prov;
	}

	public void setCod_prov(int cod_prov) {
		this.cod_prov = cod_prov;
	}

	public String getRazon_prov() {
		return razon_prov;
	}

	public void setRazon_prov(String razon_prov) {
		this.razon_prov = razon_prov;
	}

	public String getRuc_prov() {
		return ruc_prov;
	}

	public void setRuc_prov(String ruc_prov) {
		this.ruc_prov = ruc_prov;
	}

	public String getDir_prov() {
		return dir_prov;
	}

	public void setDir_prov(String dir_prov) {
		this.dir_prov = dir_prov;
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}
	
}



