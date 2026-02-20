package com.prem.user.anotations;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class InterestValidator implements ConstraintValidator<IsValidate, String> {
    @Override
    public void initialize(IsValidate constraintAnnotation) {

    }

    @Override
    public boolean isValid(String userInterest, ConstraintValidatorContext context) {
        if (userInterest == null) {
            return false;
        }
        return userInterest.matches("Music|Football|Basketball|Hockey");
    }
}
