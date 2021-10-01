package com.prueba.azurin.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.prueba.azurin.entity.Comuna;
import com.prueba.azurin.entity.Region;
import com.prueba.azurin.repository.IComunaRepository;
import com.prueba.azurin.services.IComunaService;

@Service
public class ComunaService implements IComunaService {
	
	@Autowired
	private IComunaRepository comunaRepository;

	@Override
	@Transactional(readOnly = true)
	public List<Comuna> findAll() {
		return comunaRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Comuna findById(Long id) {
		return comunaRepository.findById(id).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Comuna> buscar(Long id) {
		return comunaRepository.buscar(id);
	}

}
