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
@Table(name="tb_tipo_usuario")
public class TipoUsuario {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cod_tip_usu")
    private int cod_tip_usu;

    @Column(name = "nom_tip_usu")
    private String nom_tip_usu;
    
    @JsonIgnore
	@OneToMany(mappedBy = "tipousuario")
	private List<Usuario> usuarios;

	public int getCod_tip_usu() {
		return cod_tip_usu;
	}

	public void setCod_tip_usu(int cod_tip_usu) {
		this.cod_tip_usu = cod_tip_usu;
	}

	public String getNom_tip_usu() {
		return nom_tip_usu;
	}

	public void setNom_tip_usu(String nom_tip_usu) {
		this.nom_tip_usu = nom_tip_usu;
	}

	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
}