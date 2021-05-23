package com.veterinaria.service;

import com.veterinaria.entity.Usuario;
import com.veterinaria.entity.Interfaz;
import com.veterinaria.repository.UsuarioRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UsuarioServiceImp implements UsuarioService {

    @Autowired
    private UsuarioRepository repository;

    @Override
    public Usuario iniciarSesion(Usuario bean) {
       return repository.iniciarSesion(bean);
    }

    @Override
	public List<Interfaz> traerInterfazDeUsuario(int cod_tip_usu) {
		return repository.traerInterfazDeUsuario(cod_tip_usu);
	}

	@Override
	public void registrarUsuario(Usuario usuario) {
		 repository.save(usuario);
	}

	/*@Override
	public List<TipoUsuario> traerTipoDeUsuario(int cod_Usu) {
		return repository.traerTipoDeUsuario(cod_Usu);
	}*/
    
}