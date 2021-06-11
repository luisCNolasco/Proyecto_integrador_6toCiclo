package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.*;

public interface ServicioHasReservaRepository extends JpaRepository<ServicioHasReserva, Integer> {

	
	@Query("select pb from ServicioHasReserva pb where pb.reserva.num_reserva = :num_reserva")
	public abstract List<ServicioHasReserva> detalleReserva(@Param("num_reserva") int num_reserva);
	
}
