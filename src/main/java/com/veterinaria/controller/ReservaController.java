package com.veterinaria.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Mensaje;
import com.veterinaria.entity.Reserva;
import com.veterinaria.entity.Seleccion;
import com.veterinaria.entity.SeleccionReserva;
import com.veterinaria.entity.ServicioHasReserva;
import com.veterinaria.entity.ServicioHasReservaPK;
import com.veterinaria.entity.Usuario;
import com.veterinaria.service.ReservaService;
import com.veterinaria.service.ServicioService;
import com.veterinaria.service.UsuarioService;

@Controller
public class ReservaController {

	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private ServicioService servicioService;
	
	@Autowired
	private ReservaService reservaService;

	private List<SeleccionReserva> seleccionadosR = new ArrayList<SeleccionReserva>();	
	
	@RequestMapping("/reser")
	public String reser() {
		return "reser";
	}
	
	@RequestMapping("/agregarSeleccionReserva")
	@ResponseBody
	public List<SeleccionReserva> agregarReserva(SeleccionReserva obj) {
		for (SeleccionReserva x : seleccionadosR) {
			if (x.getCod_ser() == obj.getCod_ser()) {
				return seleccionadosR;
			}
			
		}
			
		seleccionadosR.add(obj);
		return seleccionadosR;
	}
	
	@RequestMapping("/listaSeleccionReserva")
	@ResponseBody
	public List<SeleccionReserva> lista(){
		return seleccionadosR;
	}
	
	@RequestMapping("/eliminaSeleccionReserva")
	@ResponseBody
	public List<SeleccionReserva> eliminar(int cod_ser) {
		for (SeleccionReserva x : seleccionadosR) {
			if (x.getCod_ser() == cod_ser) {
				seleccionadosR.remove(x);
				break;
			}
		}
		return seleccionadosR;
	}
	
	@RequestMapping("/cargarReservaxCodUsuario")
	@ResponseBody
	public List<Reserva> cargarReservaxCodUsuario(@RequestParam int cod_usu) {
		return reservaService.buscarPorCodUsuario(cod_usu);
	}
	
	@RequestMapping("/registraReserva")
	@ResponseBody
	public Mensaje registra(@RequestParam String dni_usu) {
		Usuario objUsuario = usuarioService.buscaXDni_usu(dni_usu);
		int estadoReserva = 1;

		List<ServicioHasReserva> detalles = new ArrayList<ServicioHasReserva>();
		for (SeleccionReserva x : seleccionadosR) {
			ServicioHasReservaPK pk = new ServicioHasReservaPK();
			
			pk.setCod_ser(x.getCod_ser());
			
			ServicioHasReserva shr = new ServicioHasReserva();
			
			shr.setPrecio(x.getPrecio());
			shr.setFecha(x.getFecha());
			shr.setServicioHasReservaPK(pk);
			
			detalles.add(shr);
		}
		
		Reserva obj = new Reserva();
		obj.setUsuario(objUsuario.getCod_usu());
		obj.setFecha(obj.getFecha());
		obj.setEstado(estadoReserva);
		obj.setDetallesReserva(detalles);

		Reserva objIns = reservaService.insertaReserva(obj);
		String salida = "-1";

		if (objIns != null) {
			salida = "Se generó la reserva con código N° : " + objIns.getNum_reserva() + "<br><br>";
			salida += "Cliente: " + objUsuario.getNombreCompleto() + "<br><br>";
			salida += "<table class=\"table\"><tr><td>Servicio</td><td>Precio</td><td>Descripción</td></tr>";
			double monto = 0;
			for (SeleccionReserva x : seleccionadosR) {
				salida += "<tr><td>"  + x.getNombre() + "</td><td>" + x.getPrecio() + "</td><td>" + x.getFecha()
						+ "</td></tr>";
				monto += x.getPrecio();
			}
			salida += "</table><br>";
			salida += "Monto a pagar : " + monto;

			seleccionadosR.clear();
		}

		Mensaje objMensaje = new Mensaje();
		objMensaje.setTexto(salida);

		return objMensaje;
	}
	
	@RequestMapping("/listaReserva")
	@ResponseBody
	public List<Reserva> listaReserva() {
		return reservaService.listaReserva();
	}
	
	@RequestMapping("/actualizarEstadoReserva")
	@ResponseBody
	public int actualizarEstadoReserva(@RequestParam int estado, @RequestParam int num_reserva) {
		return reservaService.actualizarEstadoReserva(estado, num_reserva);
	}
	
}
