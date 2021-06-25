package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Incidencias;
import com.veterinaria.repository.IncidenciasRepository;


@Service
public class IncidenciasServiceImp implements IncidenciasService {
	
	@Autowired
	private IncidenciasRepository repository;
	
	@Override
	public List<Incidencias> listaIncidencias() {
		return repository.findAll(); 
		
	}

	@Override
	public Incidencias insertaIncidencias(Incidencias inc) {
		return repository.save(inc);
	}

	@Override
	public void eliminaIncidencias(int cod) {
		repository.deleteById(cod);		
	}

	/*@Override
	public List<Servicios> buscaPorNombre(String filtro) {
		return repository.buscaPorNombre(filtro);
	}*/



}