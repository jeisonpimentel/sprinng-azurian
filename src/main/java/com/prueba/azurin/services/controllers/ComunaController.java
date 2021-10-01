package com.prueba.azurin.services.controllers;

import java.util.ArrayList;
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
import com.prueba.azurin.entity.Comuna;
import com.prueba.azurin.entity.Region;
import com.prueba.azurin.services.IComunaService;
import com.prueba.azurin.services.IRegionService;

@RestController
@CrossOrigin(origins = {"http://localhost:4200"})
@RequestMapping("/azurian")
public class ComunaController {
	
	private final Logger logger = LoggerFactory.getLogger(ClienteController.class);

	@Autowired
	private IComunaService comunaService;
	
	@Autowired
	private IRegionService regionService;
	
	@GetMapping("/listado-comunas")
	public List<Comuna> listadoComunas(){
		logger.info("ComunaController =>>> Generando listado de comunas");
		return comunaService.findAll();
	}
	
	@GetMapping("/comuna/{id}")
	public ResponseEntity<?> findById(@PathVariable Long id){
		
		Comuna comuna = null;
		Map<String, Object> response = new HashMap<>();
		
		try {
			comuna = comunaService.findById(id);
		} catch(DataAccessException ex) {
			logger.info("ComunaController =>>> Comuna no fue encontrado en la base de datos por el ID: " + id);
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(comuna == null) {
			response.put("mensaje", "La comuna con ID: ".concat(id.toString()).concat(" no existe en la base de datos, por favor verificar..."));
			logger.info("ComunaController =>>> ID: " + id + " No fue encontrado en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		} else {
			logger.info("ComunaController =>>> Comuna: " + comuna.getNombre() + " fue encontrado en la base de datos");
		}
		
		return new ResponseEntity<Comuna>(comuna, HttpStatus.OK);
	} 
	
	@GetMapping("/comunas/{idRegion}")
	public ResponseEntity<?> listadoComunasPorRegion(@PathVariable Long idRegion) {
		
		Region region 				 = null; 
		Map<String, Object> response = new HashMap<>();
		List<Comuna> comunas 		 = new ArrayList<>();
		
		try {
			region = regionService.findById(idRegion);
			logger.info("Region obtenida: -> " + region.getNombre());
		}
		catch(DataAccessException ex) {
			response.put("mensaje", "Region Error al realizar la consulta en la base de datos ");
			response.put("error"  , ex.getMessage().concat(": ").concat(ex.getMostSpecificCause().getMessage()));
			logger.info("Error DataAccessException: => " + ex.getMessage().concat(": ").concat(ex.getMostSpecificCause().getMessage()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		try {
			comunas = comunaService.buscar(region.getId());
			logger.info("Comunas obtenida: -> " + comunas);
		}
		catch(DataAccessException ex) {
			response.put("mensaje", "Comuna Error al realizar la consulta en la base de datos");
			logger.info("Error DataAccessException: => " + ex.getMessage().concat(": ").concat(ex.getMostSpecificCause().getMessage()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Comunas de la region: " + region.getNombre());
		response.put("comunas", comunas);
		
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
		
	}

}
