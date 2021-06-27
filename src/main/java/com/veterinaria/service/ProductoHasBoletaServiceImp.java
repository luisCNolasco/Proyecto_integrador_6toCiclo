package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.ProductoHasBoleta;
import com.veterinaria.repository.ProductoHasBoletaRepository;

@Service
public class ProductoHasBoletaServiceImp implements ProductoHasBoletaService {
	
	@Autowired
	private ProductoHasBoletaRepository repository;

	@Override
	public List<ProductoHasBoleta> detalleBoleta(int num_boleta) {
		return repository.detalleBoleta(num_boleta);
	}
	

}