package com.prueba.azurin.iservices;

import java.util.List;
import com.prueba.azurin.entity.Comuna;
import com.prueba.azurin.entity.Region;

public interface IComunaService {
	
	public List<Comuna> findAll();
	
	public Comuna findById(Long id);
	
	public List<Comuna> buscar(Long id);
}
