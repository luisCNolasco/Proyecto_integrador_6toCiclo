package com.veterinaria.controller;

import java.util.Date;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Servicios;
import com.veterinaria.service.ServicioService;


@Controller
public class ServicioController {

	@Autowired
	private ServicioService servicioService;

	@RequestMapping("/verServicio")
	public String mostrar() {
		return "servicio";
	}
	
	@RequestMapping("/listaServicio")
	@ResponseBody
	public List<Servicios> listaServicio(){
		return servicioService.listaServicio();
	}
	
	@RequestMapping("/consultaCrudServicio")
	public String consulta(String filtro, HttpSession session) {
		List<Servicios> data = servicioService.buscaPorNombre(filtro +"%");
		session.setAttribute("servicio", data);
		return "servicio";
	}
	
	@RequestMapping("/registraServicio")  
	@ResponseBody
	public String insertaServicio(Servicios serv) {	
		serv.setFec_ser(new Date());
		try {
			servicioService.insertaServicio(serv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "servicio";
		
	}
	
	@RequestMapping("/eliminaServicio")
	public String elimina(Integer cod, HttpSession session) {
		servicioService.eliminaServicio(cod);
		return "servicio";
	}
}
