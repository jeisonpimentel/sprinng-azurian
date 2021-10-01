package com.prueba.azurin.services.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
 import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.prueba.azurin.entity.Region;
import com.prueba.azurin.services.IRegionService;

@RestController
@CrossOrigin(origins = {"http://localhost:4200"})
@RequestMapping("/azurian")
public class RegionController {
	
	private final Logger logger = LoggerFactory.getLogger(ClienteController.class);

	@Autowired
	private IRegionService regionService;
	
	@GetMapping("/listado-regiones")
	public List<Region> listadoRegiones(){
		logger.info("RegionController =>>> Generando listado de regiones");
		return regionService.findAll();
	}
	
	@GetMapping("/region/{id}")
	public ResponseEntity<?> findById(@PathVariable Long id){
		
		Region region = null;
		Map<String, Object> response = new HashMap<>();
		
		try {
			region = regionService.findById(id);	
		} catch(DataAccessException ex) {
			logger.info("RegionController =>>> Region no fue encontrado en la base de datos por el ID: " + id);
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(region == null) {
			response.put("mensaje", "La region con ID: ".concat(id.toString()).concat(" no existe en la base de datos, por favor verificar..."));
			logger.info("RegionController =>>> ID: " + id + " No fue encontrado en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		} else {
			logger.info("RegionController =>>> Region: " + region.getNombre() + " fue encontrado en la base de datos");
		}
		
		return new ResponseEntity<Region>(region, HttpStatus.OK);
	} 

}
