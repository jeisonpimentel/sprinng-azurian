package com.prueba.azurin.services.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.prueba.azurin.entity.Cliente;
import com.prueba.azurin.entity.Comuna;
import com.prueba.azurin.repository.IClienteRepository;
import com.prueba.azurin.services.IClienteService;

@Service
public class ClienteService implements IClienteService {
	
	@Autowired
	private IClienteRepository clienteRepository;

	@Override
	@Transactional(readOnly = true)
	public List<Cliente> findAll() {
		return clienteRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Page<Cliente> findAll(Pageable pageable) {
		return clienteRepository.findAll(pageable);
	}

	@Override
	@Transactional(readOnly = true)
	public Cliente findById(Long id) {
		return clienteRepository.findById(id).orElse(null);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Cliente> findAllByComuna(Comuna comuna) {
		return clienteRepository.findAllByComuna(comuna);
	}

	@Override
	@Transactional()
	public Cliente guardarCliente(Cliente cliente) {
		return clienteRepository.save(cliente);
	}

	@Override
	@Transactional()
	public void eliminarCliente(Long id) {
		clienteRepository.deleteById(id);
		
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Cliente> findByNombre(String termino) {
		return clienteRepository.findByNombreContainingIgnoreCase(termino);
	}



}
