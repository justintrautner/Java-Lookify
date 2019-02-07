package com.justin.mvcLookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.justin.mvcLookify.models.Lookify;
import com.justin.mvcLookify.services.LookifyService;

@Controller
public class LookifyController {
	
	private final LookifyService lookService;
	
	public LookifyController(LookifyService lookService) {
		this.lookService=lookService;
	}
	
	@GetMapping("/")
	public String index() {
		return "/songs/index.jsp";
	}
//	SHOW ALL
	@GetMapping("/dashboard")
	public String dash(Model model) {
		List<Lookify> songs = lookService.allSongs();
		model.addAttribute("songs", songs);
		return "/songs/dash.jsp";
	}
//	SHOW TOP TEN
	@GetMapping("/search/topTen")
	public String top(Model model) {
		List<Lookify> topsongs = lookService.topTen();
		model.addAttribute("topsongs", topsongs);
		return "/songs/top.jsp";
	}
//	DELETE SONG
	@DeleteMapping("/songs/{id}")
	public String delete(@PathVariable("id")Long id) {
		lookService.deleteSong(id);
		return "redirect:/dashboard";
	}
//	SHOW ONE SONG
	@GetMapping("/songs/{id}")
	public String showOne(@PathVariable("id")Long id, Model model) {
		Lookify song = lookService.findSong(id);
		model.addAttribute("song", song);
		return "/songs/one.jsp";
	}
//	ADD SONG PAGE
	@GetMapping("/songs/new")
	public String addPage(@Valid @ModelAttribute("newsong") Lookify newsong, BindingResult result) {
		return "/songs/new.jsp";
	}
//	ADD SONG
	@PostMapping("/songs")
	public String create(@Valid @ModelAttribute("newsong") Lookify newsong, BindingResult result) {
		if(result.hasErrors()) {
			return"/songs/new.jsp";
		}else {
			lookService.createSong(newsong);
			return "redirect:/dashboard";
		}
	}
//	SEARCH REDIRECT
	@PostMapping("/search")
	public String search(@RequestParam("name")String name) {
		return "redirect:/search/"+name;
	}
//	SEARCH BY ARTIST
	@GetMapping("/search/{name}")
	public String artist(@PathVariable("name") String name, Model model) {
		List<Lookify> songs = lookService.findByArtist(name);
		model.addAttribute("songs", songs);
		return "/songs/artist.jsp";
	}

	
	
	
}
