package com.veterinaria.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.*;

public interface BoletaRepository extends JpaRepository<Boleta, Integer>{
	
	@Query("Select b from Boleta b where cod_usu like :cod_usu")
	public abstract List<Boleta> buscarPorCodUsuario(@Param("cod_usu") int cod_usu);
	
	
	@Transactional
	@Modifying
	@Query("update Boleta m set m.estado = ?1 where m.num_boleta = ?2")
	public abstract int actualizarEstadoPedido(Integer estado,Integer num_boleta);
}
