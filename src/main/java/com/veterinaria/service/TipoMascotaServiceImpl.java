package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.TipoMascota;
import com.veterinaria.repository.TipoMascotaRespository;
import com.veterinaria.service.TipoMascotaService;

@Service
public class TipoMascotaServiceImpl implements TipoMascotaService{

	@Autowired
	TipoMascotaRespository repository;
	
	@Override
	public List<TipoMascota> listarTipoMascota() {
		return repository.findAll();
	}

	
}
