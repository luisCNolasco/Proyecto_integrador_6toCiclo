package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Distrito;
import com.veterinaria.repository.DistritoRepository;

@Service
public class DistritoServiceImpl implements DistritoService{

	@Autowired
	DistritoRepository repo;
	
	@Override
	public List<Distrito> listaDistrito() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

}
