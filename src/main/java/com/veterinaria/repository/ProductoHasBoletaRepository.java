package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.*;

public interface ProductoHasBoletaRepository extends JpaRepository<ProductoHasBoleta, Integer> {

	@Modifying
	@Query("update Producto x set x.stock_pro = x.stock_pro - :can where x.cod_pro = :pro")
	public abstract void actualizaStock(@Param("can")int cantidad, @Param("pro") int cod_pro);
	
	@Query("select pb from ProductoHasBoleta pb where pb.boleta.num_boleta = :num_boleta")
	public abstract List<ProductoHasBoleta> detalleBoleta(@Param("num_boleta") int num_boleta);
	
}
