package com.veterinaria.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Interfaz;
import com.veterinaria.entity.Producto;
import com.veterinaria.entity.TipoUsuario;
import com.veterinaria.entity.Usuario;
import com.veterinaria.service.ProductoService;
import com.veterinaria.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsuarioController {

	@Autowired
	UsuarioService service;
	
	@Autowired
	ProductoService productoService;

	@RequestMapping("iniciarSesion")
	public String iniciarSesion(Usuario usu, HttpSession session, HttpServletRequest request) {
		
		try {
			Usuario bean = service.iniciarSesion(usu);
			if (bean == null) {
				request.setAttribute("mensaje", "¡El usuario no existe!");
				return "login";
			} else {
				List<Interfaz> interfaz = service.traerInterfazDeUsuario(bean.getTipousuario().getCod_tip_usu());
				List<TipoUsuario> tipoUsuario = service.traerTipoDeUsuario(bean.getTipousuario().getCod_tip_usu());
				
				session.setAttribute("objUsuario", bean);
				session.setAttribute("objInterfaz", interfaz);
				session.setAttribute("objTipoUsuario", tipoUsuario);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "redirect:home";	
	}

	@PostMapping(value = "/saveUsuario", consumes = "multipart/form-data")
	@ResponseBody
	public String registraCliente(@RequestParam("cod_usu") int cod_usu, @RequestParam("nom_usu") String nom_usu,
			@RequestParam("ape_usu") String ape_usu, @RequestParam("dni_usu") String dni_usu,
			@RequestParam("pass_usu") String pass_usu, @RequestParam("correo_usu") String correo_usu,
			@RequestParam("distrito") Distrito distrito, @RequestParam("tipousuario") TipoUsuario tipousuario)

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

		return "login";
	}

	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	
	@RequestMapping("/logout")
	public String logout() {
		return "login";
	}	
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}	
	
	@RequestMapping("/galeria")
	public String galeria() {
		return "galeria";
	}
	
	@RequestMapping("/mascota")
	public String mascota() {
		return "mascota";
	}
	
	@RequestMapping("/producto")
	public String producto() {
		return "producto";
	}
	
	@RequestMapping("/servicio")
	public String servicio() {
		return "servicio";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/verCrudProducto")
	public String verCrudProducto() {
		return "productos";
	}

	@RequestMapping("/verCrudServicio")
	public String verCrudServicio() {
		return "servicios";
	}

	@RequestMapping("/verCrudMascota")
	public String verCrudMascota() {
		return "mascotas";
	}

	@RequestMapping("/verCrudUsuario")
	public String verCrudUsuario() {
		return "usuarios";
	}

	@RequestMapping("/verCrudPedido")
	public String verCrudPedido() {
		return "pedidos";
	}

	@RequestMapping("/verCrudIncidencias")
	public String verCrudIncidencias() {
		return "incidencias";
	}
	
	@RequestMapping("/listProducto")
	public String listProducto() {
		return "listProducto";
	}

	@RequestMapping("/cliente/cerrarSesion")
	public String cerrarSesion(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}