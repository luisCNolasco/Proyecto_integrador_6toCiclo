package com.veterinaria.service;

import java.util.List;

import com.veterinaria.entity.*;

public interface ReservaService {
	
	public List<Reserva> buscarPorCodUsuario(int cod_usu);
	public Reserva insertaReserva(Reserva obj);
	

}
