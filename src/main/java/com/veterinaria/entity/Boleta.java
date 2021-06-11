package com.veterinaria.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tb_boleta")
public class Boleta {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "num_boleta")	
	private int num_boleta;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date fecha = new Date(); 

	@Column(name = "estado")	
	private int estado;
	
	@Column(name = "cod_usu")
	private int usuario;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "boleta")
	private List<ProductoHasBoleta> detallesBoleta;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "boleta")
	private List<ServicioHasBoleta> servicioBoleta;
	
	public int getNum_boleta() {
		return num_boleta;
	}

	public void setNum_boleta(int num_boleta) {
		this.num_boleta = num_boleta;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}	

	public int getUsuario() {
		return usuario;
	}

	public void setUsuario(int usuario) {
		this.usuario = usuario;
	}

	public List<ProductoHasBoleta> getDetallesBoleta() {
		return detallesBoleta;
	}

	public void setDetallesBoleta(List<ProductoHasBoleta> detallesBoleta) {
		this.detallesBoleta = detallesBoleta;
	}

	public List<ServicioHasBoleta> getServicioBoleta() {
		return servicioBoleta;
	}

	public void setServicioBoleta(List<ServicioHasBoleta> servicioBoleta) {
		this.servicioBoleta = servicioBoleta;
	}
	
	
}
