package com.justin.mvcLookify.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.justin.mvcLookify.models.Lookify;

@Repository
public interface LookifyRepository  extends CrudRepository<Lookify, Long>{

	List<Lookify>findAll();
	
	List<Lookify> findTop10ByOrderByRatingDesc();
	
	Optional<List<Lookify>> findAllByArtistContaining(String search);
}
