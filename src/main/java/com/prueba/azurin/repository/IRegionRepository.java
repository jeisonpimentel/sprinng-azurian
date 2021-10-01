package com.prueba.azurin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.prueba.azurin.entity.Region;


public interface IRegionRepository extends JpaRepository<Region, Long>{

}
