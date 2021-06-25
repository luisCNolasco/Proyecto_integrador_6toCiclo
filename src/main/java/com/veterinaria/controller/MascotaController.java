package com.veterinaria.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.veterinaria.entity.Mascota;
import com.veterinaria.entity.Producto;
import com.veterinaria.entity.TipoMascota;
import com.veterinaria.service.MascotaService;

@Controller
public class MascotaController {

	@Autowired
	MascotaService service;	
	
	@RequestMapping("/cargarMascotasxUsuario")
	@ResponseBody
	public List<Mascota> listarMascotaXUsuario(@RequestParam("codigoUsuario") int codiUsuario){
		return service.listarMascotasDeUsuario(codiUsuario);
	}
	
	@RequestMapping("/cargarMascotas")
	@ResponseBody
	public List<Mascota> listarMascota(){
		return service.listaMascota();
	}
	
	@PostMapping(value = "/saveMascota", consumes = "multipart/form-data")
	@ResponseBody
	public String registra(
			@RequestParam("codigo")int cod_mas,
			@RequestParam("nombre")String nom_mas,
			@RequestParam("tipo")TipoMascota mascota,
			@RequestParam("usuario")String codiUsuario,
			@RequestParam("foto") MultipartFile foto)	
	{
		try {
			int codigoUsuario = Integer.parseInt(codiUsuario);
			Mascota mas = new Mascota();
			
			mas.setCodigoMascota(cod_mas);
			mas.setNombreMascota(nom_mas); 
			mas.setTipoMascota(mascota);
			mas.setCodigoUsuario(codigoUsuario);
			mas.setFoto1(foto.getBytes());
			
			
			service.insertaMascota(mas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "mascotas";
	}
	
	@RequestMapping("/deleteMascota")
	public String elimina(Integer cod, HttpSession session) {
		service.eliminaMascota(cod);
		return "mascotas";
	}
}
