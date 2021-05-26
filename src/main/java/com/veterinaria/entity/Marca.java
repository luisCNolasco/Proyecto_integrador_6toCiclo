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
@Table(name="tb_marca")
public class Marca{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_mar")
	private int cod_mar;
	
	@Column(name = "nom_mar")
	private String nom_mar;
	
	@JsonIgnore
	@OneToMany(mappedBy = "marca")
	private List<Producto> productos;

	public int getCod_mar() {
		return cod_mar;
	}

	public void setCod_mar(int cod_mar) {
		this.cod_mar = cod_mar;
	}

	public String getNom_mar() {
		return nom_mar;
	}

	public void setNom_mar(String nom_mar) {
		this.nom_mar = nom_mar;
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

}



