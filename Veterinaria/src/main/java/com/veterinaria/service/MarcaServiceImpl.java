package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Marca;
import com.veterinaria.repository.MarcaRepository;

@Service
public class MarcaServiceImpl implements MarcaService {
	
	@Autowired
	private MarcaRepository repository;

	@Override
	public List<Marca> listaMarca() {
		return repository.findAll();
	}
	

}
