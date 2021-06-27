package com.veterinaria.service;

import java.util.List;

import com.veterinaria.entity.Incidencias;

public interface IncidenciasService {
	
	public abstract List<Incidencias> listaIncidencias();
	public abstract Incidencias insertaIncidencias(Incidencias inc);
	public abstract void eliminaIncidencias(int cod);
	//public abstract List<Incidencias> buscaPorNombre(String filtro);
	
}