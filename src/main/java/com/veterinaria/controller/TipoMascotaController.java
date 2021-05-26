package com.veterinaria.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.veterinaria.entity.TipoMascota;
import com.veterinaria.service.TipoMascotaService;

@Controller
public class TipoMascotaController {

	@Autowired
	TipoMascotaService service;
	
	@RequestMapping("/listarTipoMascota")
	@ResponseBody
	public List<TipoMascota> listar(){
		return service.listarTipoMascota();
	}
}
