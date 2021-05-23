package com.veterinaria.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Distrito;
import com.veterinaria.service.DistritoService;

@Controller
public class DistritoController {
	
	@Autowired
	private DistritoService service;
	
	@RequestMapping("/listaDistrito")
	@ResponseBody
	public List<Distrito> listaDistrito() {
		return service.listaDistrito();
	}
}
