package com.veterinaria.service;

import java.util.List;

import com.veterinaria.entity.Producto;

public interface ProductoService {
	
	public abstract List<Producto> listaProducto();
	public abstract void insertaProducto(Producto pro);
	public abstract void eliminaProducto(int cod);
	public abstract List<Producto> buscaPorNombre(String filtro);
	public abstract Producto buscaPorCodigo(int cod);
	
}