package com.veterinaria.service; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.veterinaria.entity.*;
import com.veterinaria.repository.*;

@Service
public class BoletaServiceImpl implements BoletaService{

	@Autowired
	private BoletaRepository boletaRepository;
	
	@Autowired
	private ProductoHasBoletaRepository detalleRepository;
	
    @Override
	@Transactional
	public Boleta insertaBoleta(Boleta obj) {
		Boleta cabecera = boletaRepository.save(obj);
		for (ProductoHasBoleta d : cabecera.getDetallesBoleta()) {
			d.getProductoHasBoletaPK().setNum_boleta(cabecera.getNum_boleta());
			detalleRepository.actualizaStock(d.getCantidad(), d.getProductoHasBoletaPK().getCod_pro());
			detalleRepository.save(d);
		}
		return cabecera;
	}

}
