package com.veterinaria.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.ProductoHasBoleta;
import com.veterinaria.service.ProductoHasBoletaService;

@Controller
public class DetalleBoletaController {
	
	@Autowired	
	private ProductoHasBoletaService productohasboletaService;
	
	@RequestMapping("/detalleBoleta")
	@ResponseBody
	public List<ProductoHasBoleta> detalleBoleta(@RequestParam int num_boleta) {
		return productohasboletaService.detalleBoleta(num_boleta);	
	}
}
