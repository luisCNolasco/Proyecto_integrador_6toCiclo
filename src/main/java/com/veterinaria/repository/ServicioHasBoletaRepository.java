package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.ServicioHasBoleta;

public interface ServicioHasBoletaRepository extends JpaRepository<ServicioHasBoleta, Integer>{

	@Query("select sb from ServicioHasBoleta sb where sb.boleta.num_boleta = :num_boleta_ser")
	public abstract List<ServicioHasBoleta> detalleBoletaServicio(@Param("num_boleta_ser") int  num_boleta_ser);
}
