package com.veterinaria.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.veterinaria.entity.Marca;

public interface MarcaRepository extends JpaRepository<Marca, Integer> {

	
}
