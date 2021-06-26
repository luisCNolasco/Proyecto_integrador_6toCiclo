package com.veterinaria.controller;

import java.util.Date;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Incidencias;
import com.veterinaria.entity.Mascota;
import com.veterinaria.entity.Servicios;
import com.veterinaria.entity.TipoMascota;
import com.veterinaria.entity.Usuario;
import com.veterinaria.service.IncidenciasService;
import com.veterinaria.service.MascotaService;
import com.veterinaria.service.UsuarioService;


@Controller
public class IncidenciasController {

	@Autowired
	private IncidenciasService incidenciasService;
	
	@Autowired
	private MascotaService mascotaService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@RequestMapping("/listaUsuariosIncidencias")
	@ResponseBody
	public List<Usuario> listaUsuariosInc(){
		return usuarioService.listaUsuarios();
	}
	
	@RequestMapping("/listaMascotaUsuarioIncidencias")
	@ResponseBody
	public List<Mascota> listaMascotaUsuarioInc(@RequestParam("codigoUsuario") int codUsu){
		return mascotaService.listaMxU(codUsu);
	}
	
	
	@RequestMapping("/listaIncidencias")
	@ResponseBody
	public List<Incidencias> listaIncidencias(){
		return incidenciasService.listaIncidencias();
	}
	
	
	/*@PostMapping(value = "/registraIncidencias")//, consumes = "multipart/form-data")
	@ResponseBody
	public String registra(
			@RequestParam("cod_inc")int cod_inc,
			@RequestParam("usuario")Usuario cod_usu,
			@RequestParam("mascota")Mascota cod_mas,
			@RequestParam("desc_inc")String desc_inc,
			@RequestParam("recom_inc")String recom_inc
			)	
	{
		try {
			Incidencias inc = new Incidencias();
			
			inc.setCod_inc(cod_inc);
			inc.setUsuario(cod_usu);
			inc.setMascota(cod_mas);
			inc.setDesc_inc(desc_inc);
			inc.setRecom_inc(recom_inc);
			
			
			incidenciasService.insertaIncidencias(inc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "incidencias";
	}*/
	
	@RequestMapping("/registraIncidencias")  
	@ResponseBody
	public String inserta(Incidencias inc) {	
		//serv.setFec_ser(new Date());
		try {
			incidenciasService.insertaIncidencias(inc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "incidencias";
		 
	}
	
	@RequestMapping("/eliminaIncidencias")
	public String elimina(Integer cod, HttpSession session) {
		incidenciasService.eliminaIncidencias(cod);
		return "incidencias";
	}
}
