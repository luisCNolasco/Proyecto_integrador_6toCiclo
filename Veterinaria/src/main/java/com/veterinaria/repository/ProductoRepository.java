package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer> {

	
	@Query("Select p from Producto p where nom_prov like :fil")
	public abstract List<Producto> listaProductoPorNombreLike(@Param("fil") String filtro);

	/*public abstract List<Producto> findByNombre(String nom_pro);
	public abstract List<Producto> findByRucAndCodProductoNot(String ruc_prov, int cod_pro);*/
}
