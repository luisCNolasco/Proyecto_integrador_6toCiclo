package com.veterinaria.service; 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.veterinaria.entity.*;
import com.veterinaria.repository.*;

@Service
public class ReservaServiceImpl implements ReservaService{

	@Autowired
	private ReservaRepository ReservaRepository;
	
	@Autowired
	private ServicioHasReservaRepository detalleRepository;
	
	
    @Override
	@Transactional
	public Reserva insertaReserva(Reserva obj) {
		Reserva cabecera = ReservaRepository.save(obj);
		for (ServicioHasReserva d : cabecera.getDetallesReserva()) {
			d.getServicioHasReservaPK().setNum_reserva(cabecera.getNum_reserva());			
			detalleRepository.save(d);
		}
		return cabecera;
	}
	

	@Override
	public List<Reserva> buscarPorCodUsuario(int cod_usu) {
		return ReservaRepository.buscarPorCodUsuario(cod_usu);
	}

}
