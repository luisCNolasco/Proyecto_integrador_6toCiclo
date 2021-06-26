package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Mascota;
import com.veterinaria.repository.MascotaRepository;

@Service
public class MascotaServiceImpl  implements MascotaService{

	@Autowired
	MascotaRepository repository;
	
	@Override
	public List<Mascota> listaMascota() {
		return repository.findAll();
	}

	@Override
	public void insertaMascota(Mascota mas) {
		repository.save(mas);
		
	}

	@Override
	public void eliminaMascota(int cod) {
		repository.deleteById(cod);
		
	}

	@Override
	public List<Mascota> listarMascotasDeUsuario(Integer idUsuario) {
		return repository.listarMascotasXUsuario(idUsuario);
	}

	@Override
	public List<Mascota> listaMxU(Integer codUsu) {
		return repository.listaMxU(codUsu);
	}

}
