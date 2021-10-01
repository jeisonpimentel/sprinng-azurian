package com.prueba.azurin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.prueba.azurin.entity.Comuna;
import com.prueba.azurin.entity.Region;

public interface IComunaRepository extends JpaRepository<Comuna, Long>{
	
	@Query(value = "select * from comunas where region_id = ?1",nativeQuery = true)
	public List<Comuna> buscar(Long id);

}
