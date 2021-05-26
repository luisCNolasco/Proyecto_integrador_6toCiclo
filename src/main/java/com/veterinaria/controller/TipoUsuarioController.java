package com.veterinaria.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.TipoUsuario;
import com.veterinaria.service.TipoUsuarioService;

@Controller
public class TipoUsuarioController {

	@Autowired
	private TipoUsuarioService service;
	
	@RequestMapping("/listaTipoUsuario")
	@ResponseBody
	public List<TipoUsuario> listaTipoUsuario() {
		return service.listaTipoUsuario();
	}
}
