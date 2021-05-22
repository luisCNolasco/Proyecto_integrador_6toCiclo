package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Interfaz;
import com.veterinaria.entity.Marca;
import com.veterinaria.entity.Producto;
import com.veterinaria.entity.Proveedor;
import com.veterinaria.entity.TipoUsuario;
import com.veterinaria.entity.Usuario;
import com.veterinaria.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class UsuarioController {

    @Autowired
    UsuarioService service;

  

    @RequestMapping("/login")
    public String iniciarSesion(Usuario usu, HttpSession session, HttpServletRequest request) {

    	Usuario bean = service.iniciarSesion(usu);
		if(bean == null) {
			request.setAttribute("mensaje", "¡El usuario no existe!");
			return "login";
		}else {			
			List<Interfaz> interfaz = service.traerInterfazDeUsuario(bean.getTipousuario().getCod_tip_usu());
			
			session.setAttribute("objUsuario", bean);
			session.setAttribute("objInterfaz", interfaz);
			for (Interfaz i : interfaz) {
				System.out.println(i.getCod_int());	
				System.out.println(i.getUrl_int());	
			}
			
			return "redirect:home";
		}
    }
    
    @PostMapping("/registrarUsuario")
    @ResponseBody
    public String registraCliente(@RequestBody Usuario bean) {
		service.registrarUsuario(bean);
		return "redirect:login";
	}

    @RequestMapping("/home")
    public String home() {
         return "home";
    }
    
    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/verCrudProducto")
    public String verCrudProducto() { return "productos";  }
    
    @RequestMapping("/verCrudServicio")
    public String verCrudServicio() { return "servicios";  }
    
    @RequestMapping("/VerCrudMascota")
    public String VerCrudMascota() {  return "mascotas";   }
    
    @RequestMapping("/verCrudUsuario")
    public String verCrudUsuario() {  return "usuarios";   }
    
    @RequestMapping("/verCrudPedido")
    public String verCrudPedido() {   return "pedidos";    }
    
    @RequestMapping("/verCrudIncidencias")
    public String verCrudIncidencias() {  return "incidencias"; }
    
    @RequestMapping("/cliente/cerrarSesion")
    public String cerrarSesion(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}