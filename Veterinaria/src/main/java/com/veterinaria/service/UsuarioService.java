package com.veterinaria.service;

import java.util.List;

import com.veterinaria.entity.Interfaz;
import com.veterinaria.entity.Usuario;

public interface UsuarioService {
	
	public abstract Usuario iniciarSesion(Usuario bean);
	
	public abstract List<Interfaz> traerInterfazDeUsuario(int cod_tip_usu);

	public abstract void registrarUsuario(Usuario usuario);
	//public abstract List<TipoUsuario> traerTipoDeUsuario(int cod_Usu);
}