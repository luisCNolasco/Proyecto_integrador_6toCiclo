package com.veterinaria.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="tb_usuario")
public class Usuario {
	  
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cod_usu")
    private int cod_Usu;
    
    @Column(name="nom_usu")
	private String nom_usu;
    
    @Column(name="ape_usu")
	private String ape_usu;
    
    @Column(name="dni_usu")
	private String dni_usu;
    
    @Column(name="pass_usu")
	private String pass_usu;
    
    @Column(name="correo_usu")
	private String correo_usu;
    
    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    @ManyToOne
	@JoinColumn(name="cod_dis")
	private Distrito distrito;
    
    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    @ManyToOne
	@JoinColumn(name="cod_tip_usu")
	private TipoUsuario tipousuario;
    
    
    @Transient 
	private String nombreCompleto;
	

	public String getNombreCompleto() {
		return nom_usu.concat(" ").concat(ape_usu);
	}
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}
	public int getCod_Usu() {
		return cod_Usu;
	}
	public void setCod_Usu(int cod_Usu) {
		this.cod_Usu = cod_Usu;
	}
	public String getNom_usu() {
		return nom_usu;
	}
	public void setNom_usu(String nom_usu) {
		this.nom_usu = nom_usu;
	}
	public String getApe_usu() {
		return ape_usu;
	}
	public void setApe_usu(String ape_usu) {
		this.ape_usu = ape_usu;
	}
	public String getDni_usu() {
		return dni_usu;
	}
	public void setDni_usu(String dni_usu) {
		this.dni_usu = dni_usu;
	}
	public String getPass_usu() {
		return pass_usu;
	}
	public void setPass_usu(String pass_usu) {
		this.pass_usu = pass_usu;
	}
	public String getCorreo_usu() {
		return correo_usu;
	}
	public void setCorreo_usu(String correo_usu) {
		this.correo_usu = correo_usu;
	}
	public Distrito getDistrito() {
		return distrito;
	}
	public void setDistrito(Distrito distrito) {
		this.distrito = distrito;
	}
	public TipoUsuario getTipousuario() {
		return tipousuario;
	}
	public void setTipousuario(TipoUsuario tipousuario) {
		this.tipousuario = tipousuario;
	}
	
}