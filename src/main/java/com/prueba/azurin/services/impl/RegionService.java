package com.prueba.azurin.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.prueba.azurin.entity.Region;
import com.prueba.azurin.repository.IRegionRepository;
import com.prueba.azurin.services.IRegionService;

@Service
public class RegionService implements IRegionService {
	
	@Autowired
	private IRegionRepository regionRepository;

	@Override
	@Transactional(readOnly = true)
	public List<Region> findAll() {
		return regionRepository.findAll();
	} 

	@Override
	@Transactional(readOnly = true)
	public Region findById(long id) {
		return regionRepository.findById(id).orElse(null);
	}

}
