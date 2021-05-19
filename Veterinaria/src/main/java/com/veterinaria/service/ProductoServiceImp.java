package com.veterinaria.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Producto;
import com.veterinaria.repository.ProductoRepository;


@Service
public class ProductoServiceImp implements ProductoService {

    @Autowired
    private ProductoRepository repository;

	@Override
	public List<Producto> listaProducto() {
		return repository.findAll();
	}

	@Override
	public Producto insertaActualizaProducto(Producto pro) {
		return repository.save(pro);
	}

	@Override
	public Optional<Producto> obtienePorId(int cod_pro) {
		return repository.findById(cod_pro);
	}

	@Override
	public void eliminaProducto(int cod_pro) {
		repository.deleteById(cod_pro);
	}
	
	
	@Override
	public List<Producto> listaProductoPorNombreLike(String filtro) {
		return repository.listaProductoPorNombreLike(filtro);
	}

	/*@Override
	public List<Producto> listaPorNombre(String nom_prov) {
		return repository.findByNombre(nom_prov);
	}
	
	@Override
	public List<Producto> listaPorRuc(String ruc_prov, int cod_pro) {
		return repository.findByRucAndCodProductoNot(ruc_prov, cod_pro);
	}*/

}