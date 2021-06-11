package com.veterinaria.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Boleta;
import com.veterinaria.entity.Mensaje;
import com.veterinaria.entity.ProductoHasBoleta;
import com.veterinaria.entity.ProductoHasBoletaPK;
import com.veterinaria.entity.Reserva;
import com.veterinaria.entity.Seleccion;
import com.veterinaria.entity.ServicioHasReserva;
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
		/*for (Seleccion x : seleccionados) {
			ProductoHasBoletaPK pk = new ProductoHasBoletaPK();
			
			pk.setCod_pro(x.getCod_pro());
			
			ProductoHasBoleta phb = new ProductoHasBoleta();
			
			phb.setPrecio(x.getPrecio());
			phb.setCantidad(x.getCantidad());
			phb.setProductoHasBoletaPK(pk);//num_boleta y cod_pro
			
			System.out.println("Price: "+phb.getPrecio());
			System.out.println("Cantidad: "+phb.getCantidad());
			System.out.println("Detalle Num: "+phb.getProductoHasBoletaPK().getNum_boleta());
			System.out.println("Detalle Cod_pro: "+phb.getProductoHasBoletaPK().getCod_pro());
			
			
			detalles.add(phb);
			
		}*/
		
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
			salida += "<table class=\"table\"><tr><td>Servicio</td><td>Precio</td><td>Descripción</td><td>Subtotal</td></tr>";
			double monto = 0;
			/*for (Seleccion x : seleccionados) {
				salida += "<tr><td>"  + x.getNombre() + "</td><td>" + x.getPrecio() + "</td><td>" + x.getCantidad()
						+ "</td><td>" + x.getTotalParcial() + "</td></tr>";
				monto += x.getCantidad() * x.getPrecio();
			}*/
			salida += "</table><br>";
			salida += "Monto a pagar : " + monto;

			//seleccionados.clear();
		}

		Mensaje objMensaje = new Mensaje();
		objMensaje.setTexto(salida);

		return objMensaje;
	}
}
