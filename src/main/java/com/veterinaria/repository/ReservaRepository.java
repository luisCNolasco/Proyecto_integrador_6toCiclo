package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.*;

public interface ReservaRepository extends JpaRepository<Reserva, Integer>{
	
	@Query("Select b from Reserva b where cod_usu like :cod_usu")
	public abstract List<Reserva> buscarPorCodUsuario(@Param("cod_usu") int cod_usu);
	
}
