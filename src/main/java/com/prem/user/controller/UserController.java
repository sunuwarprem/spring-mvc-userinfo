package com.prem.user.controller;

import com.prem.user.model.User;
import com.prem.user.service.UserServiceImp;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserServiceImp userServiceImp;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        //  webDataBinder.setDisallowedFields(new String[] {"dob"});
        //webDataBinder.setDisallowedFields(new String[] {"address"});
        // webDataBinder.setDisallowedFields(new String[] {"skills"});

    }

    @RequestMapping("add_user")
    public ModelAndView addUserForm() {
        // return new ModelAndView("userRegistrationForm");
        return new ModelAndView("userForm");
    }
    @RequestMapping("user_edit")
    public ModelAndView userEditForm(Model model,@RequestParam("userId") int userId, @RequestParam("addressId") int addressId){
        User user= userServiceImp.getUserById(userId,addressId);
        model.addAttribute("user", user);
        return new ModelAndView("userEdit");
    }

    @RequestMapping(value = "submitForm", method = RequestMethod.POST)
    public ModelAndView saveUsers(@Valid @ModelAttribute User user, BindingResult bindingResult) {

        ModelAndView view = new ModelAndView("userDetails");
        if (bindingResult.hasErrors()) {
            return new ModelAndView("userForm");
        }
        /*if(bindingResult.hasErrors()){
            // IMPORTANT: Pass the user object back so errors can be displayed
            ModelAndView errorView = new ModelAndView("userForm");
            errorView.addObject("user", user);  // Add this line!
            return errorView;
        }*/
        try {
            userServiceImp.save(user);
            view.addObject("saveMsg", "User saved in DB");
            System.out.println("saved in DB");
            List<User> users=userServiceImp.getAllUsers();
            view.addObject("users", users);
        } catch (Exception e) {
            view.addObject("saveMsg", "Failed to save user: " + e.getMessage());
        }
        return view;
    }

    @RequestMapping(value = {"/","user_list"}, method = RequestMethod.GET)
    public String list(Model model) {
        List<User> users = userServiceImp.getAllUsers();
        model.addAttribute("users", users);
        return "userDetails";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateUsers(@Valid @ModelAttribute User user, @RequestParam("id") int userId, BindingResult bindingResult) {
        ModelAndView view = new ModelAndView("userEdit");
        if (bindingResult.hasErrors()) {
            return "userEdit";
        }
        userServiceImp.updateUsersById(userId, user);
        return "redirect:/user_list";
    }
    @RequestMapping(value = {"delete"}, method = RequestMethod.GET)
    public String deleteUser(@ModelAttribute User user , @RequestParam("id") int id){
        ModelAndView view=new ModelAndView("userEdit");
        userServiceImp.deleteUser(id);
        return "redirect:/user_list";
    }








}
