package com.prueba.azurin.iservices;

import java.util.List;
import com.prueba.azurin.entity.Region;

public interface IRegionService {
	
	public List<Region> findAll();
	
	public Region findById(long id);

}
