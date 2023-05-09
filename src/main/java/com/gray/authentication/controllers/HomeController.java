package com.gray.authentication.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.gray.authentication.models.LoginUser;
import com.gray.authentication.models.User;
import com.gray.authentication.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("newUser", newUser);
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		//try to create user --returns null if anything fails
		User user = userService.register(newUser, result);
		//if user is null, return back to form
		if(user == null) {
			model.addAttribute("newUser", newUser);
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		} else {
			//login the validated user
			session.setAttribute("id", user.getId());
			return "redirect:/home";
		}
    }
	
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
    	if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			model.addAttribute("newLogin", newLogin);
			return "index.jsp";
		}
    	//try to create user --returns null if anything fails
        User user = userService.login(newLogin, result);
        //if user is null, return back to form
        if (user == null) {
        	model.addAttribute("newLogin", newLogin);
        	model.addAttribute("newUser", new User());
        	return "index.jsp";
        } else {
        	//login the validated user
        	session.setAttribute("loggedIn", true);
        	model.addAttribute("user", user);
        	return "redirect:/home";
        }
    }
    
    @GetMapping("/home")
    public String home(HttpSession session) {
    	try {
    		Optional<Object> thisSession = Optional.of(session.getAttribute("loggedIn"));
    		if (thisSession.isPresent()) {
    			return "home.jsp";    			
    		} else return "redirect:/";
    	} catch (IllegalStateException | NullPointerException e) {
    		System.err.println("No one is logged in! Redirecting. . ." + e);
    		return "redirect:/";
    	}
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	try {
    		session.invalidate();
    	} catch (IllegalStateException e) {
    		System.err.println("No one was logged in" + e);
    		return "redirect:/";
    	}
    	return "redirect:/";
    }
}
