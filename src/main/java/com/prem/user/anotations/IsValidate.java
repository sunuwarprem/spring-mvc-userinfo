package com.prem.user.anotations;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = InterestValidator.class)
public @interface IsValidate {

    String message () default """
            Please Provide Valid Interest
            Accepted interest are Music|Football|basketball|hockey
            """;
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

}
