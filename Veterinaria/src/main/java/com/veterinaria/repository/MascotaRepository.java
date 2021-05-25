package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.veterinaria.entity.Mascota;

public interface MascotaRepository extends JpaRepository<Mascota,Integer>{

	@Query("select m from Mascota m where m.codigoUsuario = ?1")
	public abstract List<Mascota> listarMascotasXUsuario(Integer idUsuario);
}
