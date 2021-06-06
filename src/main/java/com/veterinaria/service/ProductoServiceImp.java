package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Producto;
import com.veterinaria.repository.ProductoRepository;


@Service
public class ProductoServiceImp implements ProductoService {
	
	@Autowired
	private ProductoRepository repository;
	
	@Override
	public List<Producto> listaProducto() {
		return repository.findAll(); 
		
	}

	@Override
	public void insertaProducto(Producto pro) {
			  repository.save(pro);
	}

	@Override
	public void eliminaProducto(int cod) {
			  repository.deleteById(cod);		
	}

	@Override
	public List<Producto> buscaPorNombre(String filtro) {
		return repository.buscarPorNombre(filtro);
	}

	@Override
	public Producto buscaPorCodigo(int cod) {
		return repository.findById(cod).get();
	}



}