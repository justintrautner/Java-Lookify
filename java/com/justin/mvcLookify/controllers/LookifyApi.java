package com.justin.mvcLookify.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.justin.mvcLookify.models.Lookify;
import com.justin.mvcLookify.services.LookifyService;


@RestController
public class LookifyApi {
	
	private final LookifyService lookService;
	
	public LookifyApi(LookifyService lookService) {
		this.lookService=lookService;
	}
//	GET ALL SONGS
	@GetMapping("/api/songs")
	public List<Lookify> index(){
		return lookService.allSongs();
	}
//	CREATE SONG
	@PostMapping("/api/songs")
	public Lookify create(@RequestParam(value="title")String title, @RequestParam(value="artist")String artist, @RequestParam(value="rating")Integer rating) {
		Lookify song = new Lookify(title, artist, rating);
		return lookService.createSong(song);
	}
//	FIND BY ID
	@GetMapping("/api/songs/{id}")
	public Lookify show(@PathVariable("id")Long id) {
		Lookify song=lookService.findSong(id);
		return song;
	}
//	DELETE
	@DeleteMapping("/api/songs/{id}")
	public void destroy(@PathVariable("id")Long id) {
		lookService.deleteSong(id);
	}
}
