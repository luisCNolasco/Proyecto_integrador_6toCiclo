package com.veterinaria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.veterinaria.entity.Proveedor;

public interface ProveedorRepository extends JpaRepository<Proveedor, Integer> {

}
