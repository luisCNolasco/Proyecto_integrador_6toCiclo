package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.TipoUsuario;
import com.veterinaria.repository.TipoUsuarioRepository;

@Service
public class TipoUsuarioServiceImpl implements TipoUsuarioService{

	@Autowired 
	private TipoUsuarioRepository repo;
	
	@Override
	public List<TipoUsuario> listaTipoUsuario() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

}
