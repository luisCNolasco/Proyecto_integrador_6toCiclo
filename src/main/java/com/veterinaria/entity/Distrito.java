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
@Table(name="tb_distrito")
public class Distrito {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_dis")
	private int cod_dis;
	
	@Column(name = "nom_dis")
	private String nom_dis;
	
	@JsonIgnore
	@OneToMany(mappedBy = "distrito")
	private List<Usuario> usuarios;

	public int getCod_dis() {
		return cod_dis;
	}

	public void setCod_dis(int cod_dis) {
		this.cod_dis = cod_dis;
	}

	public String getNom_dis() {
		return nom_dis;
	}

	public void setNom_dis(String nom_dis) {
		this.nom_dis = nom_dis;
	}

	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
}
