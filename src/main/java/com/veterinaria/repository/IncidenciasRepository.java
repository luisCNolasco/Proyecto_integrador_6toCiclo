package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Boleta;
import com.veterinaria.entity.Incidencias;
import com.veterinaria.entity.Mascota;

public interface IncidenciasRepository extends JpaRepository<Incidencias,Integer>{

	@Query("select m from Mascota m where m.codigoUsuario = ?1")
	public abstract List<Mascota> listarMascotasXUsuario(Integer idUsuario);
	
	@Query("Select b from Boleta b where cod_usu like :cod_usu")
	public abstract List<Boleta> buscarPorCodUsuario(@Param("cod_usu") int cod_usu);
	
	/*@Query("select m from Mascota m where (:param_usuario is -1 or m.usuario.cod_usu= :param_usuario)"
			+ " and (:param_mascota is '' or m.cod_mas= :param_mascota)")
	public List<Cliente> listaPorNombreUbigeo
										(@Param("param_ubigeo") int idUbigeo,
												@Param("param_nombre") String nombres);*/
}
