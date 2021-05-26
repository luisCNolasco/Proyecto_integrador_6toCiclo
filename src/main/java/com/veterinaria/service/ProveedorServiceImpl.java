package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Proveedor;
import com.veterinaria.repository.ProveedorRepository;

@Service
public class ProveedorServiceImpl implements ProveedorService {
	
	@Autowired
	private ProveedorRepository repository;

	@Override
	public List<Proveedor> listaProveedor() {
		return repository.findAll();
	}

}
