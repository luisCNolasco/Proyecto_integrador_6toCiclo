package com.veterinaria.service;

import com.veterinaria.entity.Usuario;
import com.veterinaria.entity.Interfaz;
import com.veterinaria.entity.TipoUsuario;
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
	public Usuario registrarUsuario(Usuario usuario) {
		 return repository.save(usuario);
	}

    
	/*@Override
	public void registrarUsuario(Usuario usuario) {
		 repository.save(usuario);
	}*/

	@Override
	public void eliminaUsuario(int cod) {
		repository.deleteById(cod);
		
	}

	@Override
	public List<Usuario> buscaUsuarioPorNombre(String filtro) {
		// TODO Auto-generated method stub
		return repository.buscarUsuarioPorNombre(filtro);
	}

	@Override
	public List<Usuario> listaUsuarios() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	/*@Override
	public List<TipoUsuario> traerTipoDeUsuario(int cod_Usu) {
		return repository.traerTipoDeUsuario(cod_Usu);
	}*/
	public List<TipoUsuario> traerTipoDeUsuario(int cod_tip_usu) {
		return repository.traerTipoDeUsuario(cod_tip_usu);
	}

	@Override
	public List<Usuario> buscaXDni_usuAndCod_usuNot(String dni_usu, String pass_usu) {
		return repository.findByDni_usuAndCod_usuNot(dni_usu, pass_usu);
	}

	@Override
	public Usuario buscaXDni_usu(String dni_usu) {
		return repository.findByDni_usu(dni_usu);
	}

    
}