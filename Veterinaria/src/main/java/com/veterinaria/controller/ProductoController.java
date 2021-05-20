package com.veterinaria.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.veterinaria.entity.Marca;
import com.veterinaria.entity.Producto;
import com.veterinaria.entity.Proveedor;
import com.veterinaria.service.MarcaService;
import com.veterinaria.service.ProductoService;
import com.veterinaria.service.ProveedorService;

@Controller
public class ProductoController {

	@Autowired
	private ProductoService productoService;
	
	@Autowired
	private MarcaService marcaService;
	
	@Autowired
	private ProveedorService proveedorService;
	
	@RequestMapping("/verProductos")
	public String mostrar() {
		return "productos";
	}
	
	@RequestMapping("/cargaMarca")
	@ResponseBody
	public List<Marca> listaMarca() {
		return marcaService.listaMarca();
	}
	
	@RequestMapping("/cargaProveedor")
	@ResponseBody
	public List<Proveedor> listaProveedor() {
		return proveedorService.listaProveedor();
	}
	
	@RequestMapping("/cargaProducto")
	@ResponseBody
	public List<Producto> listaProducto() {
		return productoService.listaProducto();
	}
	
	@RequestMapping("/consultaCrudProductos")
	public String consulta(String filtro, HttpSession session) {
		List<Producto> data = productoService.buscaPorNombre(filtro +"%");
		session.setAttribute("productos", data);
		return "productos";
	}
	
	
	@PostMapping(value = "/saveProducto", consumes = "multipart/form-data")
	@ResponseBody
	public String registra(
			@RequestParam("nom_pro")String nom_pro,
			@RequestParam("pre_pro")String pre_pro,
			@RequestParam("stock_pro")String stock_pro,
			@RequestParam("marca")int marca,
			@RequestParam("proveedor")int proveedor,
			@RequestParam("desc_sim_pro")String desc_sim_pro,
			@RequestParam("desc_html_pro")String desc_html_pro,
			@RequestParam("foto1") MultipartFile foto1,
			@RequestParam("foto2") MultipartFile foto2,
			@RequestParam("foto3") MultipartFile foto3)	
	{
		try {
			Producto pro = new Producto();
			Marca mar = new Marca();
			Proveedor prove = new Proveedor();
			
			pro.setNom_pro(nom_pro);
			pro.setNom_pro(pre_pro);
			pro.setNom_pro(stock_pro);
			mar.setCod_mar(marca);
			prove.setCod_prov(proveedor);
			pro.setDesc_sim_pro(desc_sim_pro);
			pro.setDesc_html_pro(desc_html_pro);
			pro.setFoto1(foto1.getBytes());
			pro.setFoto2(foto2.getBytes());
			pro.setFoto3(foto3.getBytes());
			
			productoService.insertaProducto(pro);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "productos";
	}
	
	@RequestMapping("/deleteProducto")
	public String elimina(Integer cod, HttpSession session) {
		productoService.eliminaProducto(cod);
		return "productos";
	}
	
	/*@RequestMapping("/saveProducto")
	public String saveProducto(Producto pro, HttpSession session) {
		try {
			Producto producto = productoService.insertaProducto(pro);
			if (producto != null) {
				session.setAttribute("mensaje", "¡Se registró correctamente!");
			}else {
				session.setAttribute("mensaje", "¡Error al registrar!");
			}
		} catch (Exception e) {
			session.setAttribute("mensaje", "¡Error al registrar!");
			e.printStackTrace();
		}
		return "productos";
	}*/
	
	
	
	
}
