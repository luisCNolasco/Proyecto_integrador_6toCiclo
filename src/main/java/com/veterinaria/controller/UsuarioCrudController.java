package com.veterinaria.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.TipoUsuario;
import com.veterinaria.entity.Usuario;
import com.veterinaria.service.UsuarioService;

@Controller
public class UsuarioCrudController {

    @Autowired
    UsuarioService service;
    
    @RequestMapping("/eliminaUsuario")
	public String elimina(int cod, HttpSession session) {
    	
		service.eliminaUsuario(cod);
		return "usuarios";
	}
    
    @RequestMapping("/verUsuario")
	public String mostrar() { 
		return "usuarios";
	}
    
    
    @RequestMapping("/listaUsuario")
	@ResponseBody
	public List<Usuario> listaUsuario() {
		return service.listaUsuarios();
	}
	
	@RequestMapping("/consultaCrudUsuarios")
	public String consulta(String filtro, HttpSession session) {
		List<Usuario> data = service.buscaUsuarioPorNombre(filtro +"%");
		session.setAttribute("usuario", data);
		return "usuarios";
	}
	
    @RequestMapping("/actualizaUsuario")  
	@ResponseBody
	public String actualizaUsuario(Usuario u) {	
		try {
			service.registrarUsuario(u);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "usuarios";
		
		
	}
    
	@PostMapping(value = "/guardarUsuario",  consumes = "multipart/form-data")
	@ResponseBody
    public String registraUsuario(
    		@RequestParam("cod_usu") int cod_usu,
			@RequestParam("nom_usu") String nom_usu,
			@RequestParam("ape_usu") String ape_usu,
			@RequestParam("dni_usu") String dni_usu,
			@RequestParam("pass_usu") String pass_usu,
			@RequestParam("correo_usu") String correo_usu,
			@RequestParam("distrito") Distrito distrito,
			@RequestParam("tipousuario") TipoUsuario tipousuario)	
    
	{
    	try {
    	 Usuario usuario = new Usuario();
    	  
    	 usuario.setCod_usu(cod_usu);
    	 usuario.setNom_usu(nom_usu);
    	 usuario.setApe_usu(ape_usu);
    	 usuario.setDni_usu(dni_usu);
    	 usuario.setPass_usu(pass_usu);
    	 usuario.setCorreo_usu(correo_usu);
    	 usuario.setDistrito(distrito);
    	 usuario.setTipousuario(tipousuario);
    	 
    	 service.registrarUsuario(usuario);
			
		} catch (Exception e) {
		   e.printStackTrace();
		}
    	
		return "usuarios";
	}
}
