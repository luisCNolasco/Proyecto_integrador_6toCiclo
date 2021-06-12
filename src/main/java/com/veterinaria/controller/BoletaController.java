package com.veterinaria.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.*;
import com.veterinaria.service.*;

@Controller
public class BoletaController {

	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private ProductoService productoService;
	
	@Autowired
	private BoletaService boletaService;
	
	//Se almacenan los productos seleccionados
	private List<Seleccion> seleccionados = new ArrayList<Seleccion>();
	
	
	@RequestMapping("/carrito")
	public String carrito() {
		return "carrito";
	}

	@RequestMapping("/agregarSeleccion")
	@ResponseBody
	public List<Seleccion> agregar(Seleccion obj) {
		for (Seleccion x : seleccionados) {
			if (x.getCod_pro() == obj.getCod_pro()) {
				x.setCantidad(x.getCantidad()+obj.getCantidad());				
				return seleccionados;
			}
			
		}
			
		seleccionados.add(obj);
		return seleccionados;
	}
		
	@RequestMapping("/listaSeleccion")
	@ResponseBody
	public List<Seleccion> lista(){
		return seleccionados;
	}
	
	@RequestMapping("/eliminaSeleccion")
	@ResponseBody
	public List<Seleccion> eliminar(int cod_pro) {
		for (Seleccion x : seleccionados) {
			if (x.getCod_pro() == cod_pro) {
				seleccionados.remove(x);
				break;
			}
		}
		return seleccionados;
	}
	
	@RequestMapping("/registraBoleta")
	@ResponseBody
	public Mensaje registra(@RequestParam String dni_usu) {
		Usuario objUsuario = usuarioService.buscaXDni_usu(dni_usu);
		int estadoBoleta = 1;

		List<ProductoHasBoleta> detalles = new ArrayList<ProductoHasBoleta>();
		for (Seleccion x : seleccionados) {
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
			
		}
		
		Boleta objBoleta = new Boleta();
		objBoleta.setUsuario(objUsuario.getCod_usu());
		objBoleta.setEstado(estadoBoleta);
		objBoleta.setDetallesBoleta(detalles);

		Boleta objIns = boletaService.insertaBoleta(objBoleta);
		String salida = "-1";

		if (objIns != null) {
			salida = "Se generó la boleta con código N° : " + objIns.getNum_boleta() + "<br><br>";
			salida += "Cliente: " + objUsuario.getNombreCompleto() + "<br><br>";
			salida += "<table class=\"table\"><tr><td>Producto</td><td>Precio</td><td>Cantidad</td><td>Subtotal</td></tr>";
			double monto = 0;
			for (Seleccion x : seleccionados) {
				salida += "<tr><td>"  + x.getNombre() + "</td><td>" + x.getPrecio() + "</td><td>" + x.getCantidad()
						+ "</td><td>" + x.getTotalParcial() + "</td></tr>";
				monto += x.getCantidad() * x.getPrecio();
			}
			salida += "</table><br>";
			salida += "Monto a pagar : " + monto;

			seleccionados.clear();
		}

		Mensaje objMensaje = new Mensaje();
		objMensaje.setTexto(salida);

		return objMensaje;
	}	
	
	@RequestMapping("/cargarPedidosxCodUsuario")
	@ResponseBody
	public List<Boleta> cargarPedidosxCodUsuario(@RequestParam int cod_usu) {
		return boletaService.buscarPorCodUsuario(cod_usu);
	}
	
	@RequestMapping("/listaPedido")
	@ResponseBody
	public List<Boleta> listaPedido() {
		return boletaService.listaPedido();
	}
	
	@RequestMapping("/actualizarEstadoPedido")
	@ResponseBody
	public int actualizarEstadoPedido(@RequestParam int estado, @RequestParam int num_boleta) {
		return boletaService.actualizarEstadoPedido(estado, num_boleta);
	}
	
	
	
	
}
