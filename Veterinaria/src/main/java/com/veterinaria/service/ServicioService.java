package com.veterinaria.service;

import java.util.List;

import com.veterinaria.entity.Servicios;

public interface ServicioService {
	
	public abstract List<Servicios> listaServicio();
	public abstract Servicios insertaServicio(Servicios serv);
	public abstract void eliminaServicio(int cod);
	public abstract List<Servicios> buscaPorNombre(String filtro);
	
}