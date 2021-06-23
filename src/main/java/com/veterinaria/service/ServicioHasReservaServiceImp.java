package com.veterinaria.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.ServicioHasReserva;
import com.veterinaria.repository.ServicioHasReservaRepository;

@Service
public class ServicioHasReservaServiceImp implements ServicioHasReservaService {
	
	@Autowired
	private ServicioHasReservaRepository repository;

	@Override
	public List<ServicioHasReserva> detalleReserva(int num_reserva) {
		return repository.detalleReserva(num_reserva);
	}
	

}