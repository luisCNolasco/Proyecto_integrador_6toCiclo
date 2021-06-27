package com.veterinaria.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.ServicioHasReserva;
import com.veterinaria.service.ServicioHasReservaService;

@Controller
public class DetalleReservaController {
	
	@Autowired	
	private ServicioHasReservaService serviciohasreservaService;
	
	@RequestMapping("/detalleReserva")
	@ResponseBody
	public List<ServicioHasReserva> detalleReserva(@RequestParam int num_reserva) {
		return serviciohasreservaService.detalleReserva(num_reserva);	
	}
}
