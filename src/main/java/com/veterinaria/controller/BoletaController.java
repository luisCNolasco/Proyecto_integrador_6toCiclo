package com.veterinaria.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.*;
import com.veterinaria.service.*;
import com.veterinaria.util.Constantes;

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
		
		/*Producto pro = new Producto();  
		Map<String, Object> salida = new HashMap<>();*/
		for (Seleccion x : seleccionados) {
			if (x.getCod_pro() == obj.getCod_pro()) {
				x.setCantidad(x.getCantidad()+obj.getCantidad());
				/*int cant = x.getCantidad();
				pro = productoService.buscaPorCodigo(obj.getCod_pro());
				int stock_actual = Integer.parseInt(pro.getStock_pro());
				System.out.println("50:"+stock_actual);
				if(cant > stock_actual) {
					System.out.println("52:"+cant);
					salida.put("mensaje_stock", Constantes.MENSAJE_REG_ERROR_STOCK);
					break;
				}
				*/
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
		objBoleta.setUsuario(objUsuario);
		objBoleta.setDetallesBoleta(detalles);

		Boleta objIns = boletaService.insertaBoleta(objBoleta);
		String salida = "-1";

		if (objIns != null) {
			salida = "Se generó la boleta con código N° : " + objIns.getNum_boleta() + "<br><br>";
			salida += "Cliente: " + objIns.getUsuario().getNom_usu() + "<br><br>";
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
	
	/*@RequestMapping("/cargaCliente")
	@ResponseBody
	public List<Cliente> listaCliente(String filtro){
		//Los parametros de la paginacion
		int page = 0;
		int size = 5;
		Pageable paginacion = PageRequest.of(page, size);
		return clienteService.listaCliente(filtro+"%",paginacion);
	}*/
	
	/*@RequestMapping("/cargaProducto")
	@ResponseBody
	public List<Producto> listaProducto(String filtro) {
		int page = 0;
		int size = 5;
		Pageable paginacion = PageRequest.of(page, size);
		return productoService.listaproducto(filtro+"%", paginacion);
	}*/
	
	
	
}
