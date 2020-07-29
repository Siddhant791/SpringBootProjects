package com.siddhant.demo.dao;
import com.siddhant.demo.model.Alien;

import java.util.*;
import org.springframework.data.repository.CrudRepository;

public interface AlienRepo extends CrudRepository<Alien,Integer>
{
	List<Alien> findByAname(String name);
	List<Alien> findByAidGreaterThan(int aid);
}
