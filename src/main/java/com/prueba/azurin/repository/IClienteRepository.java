package com.prueba.azurin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.prueba.azurin.entity.Cliente;
import com.prueba.azurin.entity.Comuna;

public interface IClienteRepository extends JpaRepository<Cliente, Long> {
	
	//Metodo para listar todos los clientes correspondiente a una comuna en especifico
	public List<Cliente> findAllByComuna(Comuna comuna);
	
	public List<Cliente> findByNombreContainingIgnoreCase(String termino);
}
