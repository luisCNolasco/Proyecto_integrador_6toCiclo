package com.veterinaria.controller;


import java.util.List;


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
	ProductoService productoService;
	
	@Autowired
	MarcaService marcaService;
	
	@Autowired
    ProveedorService proveedorService;
	
	@RequestMapping(value="/listaProducto")
	public String listaProducto(Model modelo) {
		modelo.addAttribute("dataProducto",productoService.listaProducto());
		return "productos";
	}
	
	
	@RequestMapping(value="/listaMarca")
	public String listaMarca(Model modelo) {
		modelo.addAttribute("dataMarca",marcaService.listaMarca());
		return "productos";
	}
	@RequestMapping(value="/listaProveedor")
	public String listaProveedor(Model model) {
		model.addAttribute("dataProveedor",proveedorService.listaProveedor());
		return "productos";
	}
		
	@RequestMapping("/consultaCrudProducto")
	public List<Producto> lista(String filtro) {
		return productoService.listaProductoPorNombreLike(filtro.trim() + "%");
	}
	
	@ResponseBody
	@PostMapping(value = "/saveProducto", consumes = "multipart/form-data")
	public String registra(
							@RequestParam("nom_pro") String nom_pro,
							@RequestParam("pre_pro") String pre_pro,
							@RequestParam("stock_pro") String stock_pro,
							@RequestParam("cod_mar") int marca,
							@RequestParam("cod_prov") int proveedor,
							@RequestParam("desc_sim_pro") String desc_sim_pro,
							@RequestParam("desc_html_pro") String desc_html_pro,
							@RequestParam("foto1") MultipartFile foto1,
							@RequestParam("foto2") MultipartFile foto2,
							@RequestParam("foto3") MultipartFile foto3){
		
		try {
			
			Producto pro = new Producto();
			Marca mar = new Marca();
			Proveedor provee = new Proveedor();
			
			pro.setNom_pro(nom_pro);
			pro.setPre_pro(pre_pro);
			pro.setStock_pro(stock_pro);
			mar.setCod_mar(marca);
			provee.setCod_prov(proveedor);
			pro.setDesc_sim_pro(desc_sim_pro);
			pro.setDesc_html_pro(desc_html_pro);
			pro.setFoto1(foto1.getBytes());
			pro.setFoto2(foto2.getBytes());
			pro.setFoto3(foto3.getBytes());	
			
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return "productos";
	}
	
	@RequestMapping(value="/deleteProducto", method=RequestMethod.POST)
    public String deleteProducto(@RequestParam("cod_pro") int cod_pro){
		productoService.eliminaProducto(cod_pro);
		return "productos";
	}
	
	
}
