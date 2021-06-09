package com.veterinaria.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tb_producto")
public class Producto {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cod_pro")
	private int cod_pro;
	
	@Column(name="nom_pro")
	private String nom_pro;
	
	@Column(name="pre_pro")
	private double pre_pro;
	
	@Column(name="stock_pro")
	private int stock_pro;
	
    @ManyToOne
	@JoinColumn(name="cod_mar")
	private Marca marca;
    
    @ManyToOne
   	@JoinColumn(name="cod_prov")
	private Proveedor proveedor;
    
    @Column(name="desc_sim_pro")
	private String desc_sim_pro;
    
    @Column(name="desc_html_pro")
	private String desc_html_pro;
    
    @Lob
    @Column(name="foto1")
	private byte[] foto1;
    
    @Lob
    @Column(name="foto2")
	private byte[] foto2;
    
    @Lob
    @Column(name="foto3")
	private byte[] foto3;

	public int getCod_pro() {
		return cod_pro;
	}

	public void setCod_pro(int cod_pro) {
		this.cod_pro = cod_pro;
	}

	public String getNom_pro() {
		return nom_pro;
	}

	public void setNom_pro(String nom_pro) {
		this.nom_pro = nom_pro;
	}

	public double getPre_pro() {
		return pre_pro;
	}

	public void setPre_pro(double pre_pro) {
		this.pre_pro = pre_pro;
	}

	public int getStock_pro() {
		return stock_pro;
	}

	public void setStock_pro(int stock_pro) {
		this.stock_pro = stock_pro;
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	public String getDesc_sim_pro() {
		return desc_sim_pro;
	}

	public void setDesc_sim_pro(String desc_sim_pro) {
		this.desc_sim_pro = desc_sim_pro;
	}

	public String getDesc_html_pro() {
		return desc_html_pro;
	}

	public void setDesc_html_pro(String desc_html_pro) {
		this.desc_html_pro = desc_html_pro;
	}

	public byte[] getFoto1() {
		return foto1;
	}

	public void setFoto1(byte[] foto1) {
		this.foto1 = foto1;
	}

	public byte[] getFoto2() {
		return foto2;
	}

	public void setFoto2(byte[] foto2) {
		this.foto2 = foto2;
	}

	public byte[] getFoto3() {
		return foto3;
	}

	public void setFoto3(byte[] foto3) {
		this.foto3 = foto3;
	}
    
}
