package com.prueba.azurin.services.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import com.prueba.azurin.entity.Cliente;
import com.prueba.azurin.entity.Comuna;
import com.prueba.azurin.services.IClienteService;
import com.prueba.azurin.services.IComunaService;

@RestController
@CrossOrigin(origins = {"http://localhost:4200"})
@RequestMapping("/azurian")
public class ClienteController {

	private final Logger logger = LoggerFactory.getLogger(ClienteController.class);
	
	@Autowired
	private IClienteService clienteService;
	
	@Autowired
	private IComunaService comunaService;
	
	@GetMapping("/listado-clientes/page/{page}")
	public Page<Cliente> listaCliente(@PathVariable Integer page){
		Pageable pageable = PageRequest.of(page, 4);
		logger.info("ClienteControles =>>> Generado listado de clientes con paginacion");
		return clienteService.findAll(pageable);
	}
	
	@GetMapping("/listado-clientes")
	public List<Cliente> listadoClientes(){
		logger.info("ClienteControles =>>> Generando listado de clientes");
		return clienteService.findAll();
	}
	
	@GetMapping("/cliente/{id}")
	public ResponseEntity<?> findById(@PathVariable Long id){
		
		Cliente cliente = null;
		Map<String, Object> response = new HashMap<>();
		
		try {
			cliente = clienteService.findById(id);
		} catch(DataAccessException ex) {
			logger.info("ClienteControler =>>> Cliente no fue encontrado en la base de datos por el ID: " + id);
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(cliente == null) {
			response.put("mensaje", "El cliente con ID: ".concat(id.toString()).concat(" no existe en la base de datos, por favor verificar..."));
			logger.info("ClienteControler =>>> ID: " + id + " No fue encontrado en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		} else {
			logger.info("ClienteControler =>>> Cliente: " + cliente.getNombre() + " fue encontrado en la base de datos");
		}
		
		return new ResponseEntity<Cliente>(cliente, HttpStatus.OK);
	} 
	
	@GetMapping("/cliente-por-comuna/{id}")
	public ResponseEntity<?> findAllByComuna(@PathVariable Long id){
		List<Cliente> clientes 		 = null;
		Comuna comuna 				 = null;
		Map<String, Object> response = new HashMap<>();
		
		if(id > 0) {
			comuna = comunaService.findById(id);
		} else {
			response.put("mensaje", "La comuna con ID: ".concat(id.toString()).concat(" no existe en la base de datos, por favor verificar..."));
			logger.info("ClienteControler =>>> ID: " + id + " No fue encontrado en la base de datos");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		try {
			clientes = clienteService.findAllByComuna(comuna);
		} catch(DataAccessException ex) {
			response.put("mensaje", "No se encontro ningun registro de clientes con la comuna: " + comuna.getNombre());
			logger.info("ClienteControler =>>> No se encontro ningun registro de clientes con la comuna: " + comuna.getNombre());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("clientes", clientes);
		
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
	
	@PostMapping("/crear-cliente")
	public ResponseEntity<?> crearCliente(@RequestBody Cliente cliente){
		
		Map<String, Object> response = new HashMap<>();
		Cliente clienteInsertado 	 = null;
		
		try {
			clienteInsertado = clienteService.guardarCliente(cliente);
		} catch(DataAccessException ex) {
			response.put("mensaje", "No se pudo insertar registro en la base de datos, por favor verificar...");
			logger.info("ClienteControler =>>> Cliente no pudo ser insertado en la base de datos.");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "Fue generado nuevo cliente con el ID: ".
				concat(clienteInsertado.getId().toString()).
				concat(" satisfactoriamente"));
		
		response.put("cliente", clienteInsertado);
		
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
		
	}
	
	@PutMapping("/crear-cliente/{id}")
	public ResponseEntity<?> update(@RequestBody Cliente cliente, @PathVariable Long id) {
		
		Map<String, Object> response 	 = new HashMap<>();
		Cliente clienteActual 			 =	clienteService.findById(id);;
		Cliente clienteActualizado 	     = 	null;
				
		if( clienteActual == null ) {
			response.put("mensaje", "El cliente con ID: ".concat(id.toString()).concat(" no existe en la base de datos"));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}
		
		try {
			clienteActual.setNombre(cliente.getNombre());
			clienteActual.setApellidoPaterno(cliente.getApellidoPaterno());
			clienteActual.setApellidoMaterno(cliente.getApellidoMaterno());
			clienteActual.setEmail(cliente.getEmail());
			clienteActual.setFechaNacimiento(cliente.getFechaNacimiento());
			clienteActual.setComuna(cliente.getComuna());
			
			clienteActualizado = clienteService.guardarCliente(clienteActual);
			
		} catch(DataAccessException ex) {
			response.put("mensaje", "El cliente no pudo ser actualizado en la base de datos");
			logger.info("ClienteControler =>>> Cliente no pudo ser actualizado en la base de datos.");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
				
		response.put("mensaje", "Cliente con ID: ".concat(clienteActualizado.getId().toString())
				.concat(" fue actualizado satisfactoriamente!"));
		response.put("cliente_actualizado", clienteActualizado);
		
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}
	
	@DeleteMapping("/eliminar/cliente/{id}")
	public ResponseEntity<?> deleteById(@PathVariable Long id) {
		
		Map<String, Object> response 	 = new HashMap<>();
		
		if( id < 0) {
			response.put("error", "El ID no puede ser menor a cero.");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.BAD_REQUEST);
		}
		
		try {
			Cliente cliente 		  = clienteService.findById(id);
			clienteService.eliminarCliente(id);
			logger.info("ClienteControler =>>> Cliente eliminado de la base de datos.");
		} catch(DataAccessException ex) {
			response.put("mensaje", "El cliente no pudo ser eliminado en la base de datos");
			logger.info("ClienteControler =>>> Cliente no pudo ser eliminado de la base de datos.");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("cliente_eliminado", "Cliente con ID: ".concat(id.toString())
				.concat(" fue eliminado satisfactoriamente!"));
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
	
	@GetMapping("/clientes/filtrar/{term}")
	@ResponseStatus(HttpStatus.OK)
	public List<Cliente> filtrarProductos(@PathVariable String term){
		return clienteService.findByNombre(term);
	}
} 
