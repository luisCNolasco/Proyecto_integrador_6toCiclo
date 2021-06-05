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

	@ManyToOne(optional = false)
	@JoinColumn(name = "cod_usu", nullable = false)
	private Usuario usuario;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "boleta")
	private List<ProductoHasBoleta> detallesBoleta;

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

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<ProductoHasBoleta> getDetallesBoleta() {
		return detallesBoleta;
	}

	public void setDetallesBoleta(List<ProductoHasBoleta> detallesBoleta) {
		this.detallesBoleta = detallesBoleta;
	}

}
