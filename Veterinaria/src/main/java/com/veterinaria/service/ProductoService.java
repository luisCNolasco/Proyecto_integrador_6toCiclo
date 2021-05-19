package com.veterinaria.service;

import java.util.List;
import java.util.Optional;

import com.veterinaria.entity.Producto;

public interface ProductoService {
	
	public abstract List<Producto> listaProducto();
	public abstract Producto insertaActualizaProducto(Producto pro);
	public abstract Optional<Producto> obtienePorId(int cod_pro);
	public abstract void eliminaProducto(int cod_pro);
	
	
	public abstract List<Producto> listaProductoPorNombreLike(String filtro);
	/*public abstract List<Producto> listaPorNombre(String nom_pro);
	public abstract List<Producto> listaPorRuc(String ruc_prov, int cod_pro);*/
}