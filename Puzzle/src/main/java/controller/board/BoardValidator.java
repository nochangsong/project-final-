package controller.board;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import model.BoardCommand;

//validation.properties�� ���� �Է¹޾� ��ȿ��üũ �ϴ� Ŭ����
public class BoardValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz){
		return BoardCommand.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors){
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "WRITER", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "SUBJECT", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "B_CONTENT", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "WRITE_TYPE", "required");
	}
}
