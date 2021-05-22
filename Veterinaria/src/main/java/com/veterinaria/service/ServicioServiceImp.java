package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Servicios;
import com.veterinaria.repository.ServicioRepository;


@Service
public class ServicioServiceImp implements ServicioService {
	
	@Autowired
	private ServicioRepository repository;
	
	@Override
	public List<Servicios> listaServicio() {
		return repository.findAll(); 
		
	}

	@Override
	public Servicios insertaServicio(Servicios serv) {
		return repository.save(serv);
	}

	@Override
	public void eliminaServicio(int cod) {
		repository.deleteById(cod);		
	}

	@Override
	public List<Servicios> buscaPorNombre(String filtro) {
		return repository.buscaPorNombre(filtro);
	}



}