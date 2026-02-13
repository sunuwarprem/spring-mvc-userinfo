package com.prem.user.controller;

import com.prem.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class userController {

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder){
      //  webDataBinder.setDisallowedFields(new String[] {"dob"});
     //webDataBinder.setDisallowedFields(new String[] {"address"});
       // webDataBinder.setDisallowedFields(new String[] {"skills"});

    }
    @RequestMapping("/")
    public ModelAndView openForm(){
       // return new ModelAndView("userRegistrationForm");
        return new ModelAndView("userForm");
    }

    @RequestMapping(value ="submitForm", method = RequestMethod.POST)
    public ModelAndView submitForm(@ModelAttribute User user, BindingResult bindingResult){

        ModelAndView view=new ModelAndView("userDetails");
        if(bindingResult.hasErrors()){
            return new ModelAndView("userRegistrationForm");
        }
        view.addObject("firstName", user.getFirstName());
        view.addObject("lastName", user.getLastName());
        view.addObject("mobileNum", user.getMobileNum());
        view.addObject("dateOfBirth", user.getDob());
        view.addObject("streetName", user.getAddress().getStreetName());
        view.addObject("cityName", user.getAddress().getCityName());
        view.addObject("countryName", user.getAddress().getCountryName());
        return view;
    }
}
