package com.veterinaria.service;

import java.util.List;

import com.veterinaria.entity.Mascota;


public interface MascotaService {

	public abstract List<Mascota> listaMascota();
	public abstract void insertaMascota(Mascota mas);
	public abstract void eliminaMascota(int cod);
	public List<Mascota> listarMascotasDeUsuario(Integer idUsuario);
	
}
