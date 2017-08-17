package Nillouise.validator;

import Nillouise.model.Task;
import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by win7x64 on 2017/8/18.
 */

@Repository("taskValidator")
public class TaskValidator implements Validator
{
    public boolean supports(Class<?> clazz)
    {
        return Task.class.isAssignableFrom(clazz);
    }

    public void validate(Object o, Errors errors)
    {
        ValidationUtils.rejectIfEmpty(errors,"title",null,"title 不能为空");
        ValidationUtils.rejectIfEmpty(errors,"content",null,"content不能为空");

    }
}
