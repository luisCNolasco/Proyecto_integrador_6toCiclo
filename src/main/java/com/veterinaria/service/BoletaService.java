package com.veterinaria.service;

import java.util.List;

import com.veterinaria.entity.*;

public interface BoletaService {
	
	public List<Boleta> buscarPorCodUsuario(int cod_usu);
	public Boleta insertaBoleta(Boleta obj);
}
