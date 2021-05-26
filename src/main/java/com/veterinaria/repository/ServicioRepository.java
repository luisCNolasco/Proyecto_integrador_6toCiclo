package com.veterinaria.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Servicios;

public interface ServicioRepository extends JpaRepository<Servicios, Integer> {

	@Query("Select a from Servicios a where nombre like :fil")
	public abstract List<Servicios> buscaPorNombre(@Param("fil") String filtro);

	
}
