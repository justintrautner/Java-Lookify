package com.justin.mvcLookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.justin.mvcLookify.models.Lookify;
import com.justin.mvcLookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	private final LookifyRepository lookRepo;
	
	public LookifyService(LookifyRepository lookRepo) {
		this.lookRepo=lookRepo;
	}
//	FIND ALL SONGS
	public List<Lookify> allSongs(){
		return lookRepo.findAll();
	}
//	CREATE A SONG
	public Lookify createSong(Lookify song) {
		return lookRepo.save(song);
	}
//	FIND A SONG
	public Lookify findSong(Long id) {
		Optional<Lookify>song=lookRepo.findById(id);
		if(song.isPresent()) {
			return song.get();
		}else {
			return null;
		}
	}
//	DELETE SONG
	public void deleteSong(Long id) {
		lookRepo.deleteById(id);
	}
//	UPDATE SONG
	public Lookify updateSong(Lookify song) {
		return lookRepo.save(song);
	}
//	FIND TOP TEN SONGS
	public List<Lookify> topTen(){
		return lookRepo.findTop10ByOrderByRatingDesc();
	}
//	FIND BY ARTIST
	public List<Lookify> findByArtist(String name) {
		Optional<List<Lookify>> songs=lookRepo.findAllByArtistContaining(name);
		if(songs.isPresent()) {
			return songs.get();
		}else {
			
			return null;
		}
	}

}
