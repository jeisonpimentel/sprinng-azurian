package com.prueba.azurin.services;


import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.prueba.azurin.entity.Cliente;
import com.prueba.azurin.entity.Comuna;

public interface IClienteService {
	
	public List<Cliente> findAll();
	
	public Page<Cliente> findAll(Pageable pageable);
	
	public Cliente findById(Long id);
	
	public Cliente guardarCliente(Cliente cliente);
	
	public void eliminarCliente(Long id);
	
	public List<Cliente> findAllByComuna(Comuna comuna);
	
	public List<Cliente> findByNombre(String termino);

}
