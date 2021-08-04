package net.scit.std.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.scit.std.dao.StdRepository;

@Service
public class StdService {
	
	@Autowired
	StdRepository repo;
	
	public void example(){
		
	}
	
}
