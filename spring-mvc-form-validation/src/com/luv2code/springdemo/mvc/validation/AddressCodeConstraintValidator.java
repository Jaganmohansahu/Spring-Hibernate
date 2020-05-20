package com.luv2code.springdemo.mvc.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class AddressCodeConstraintValidator implements ConstraintValidator<AddressCode, String> {

	private String[] addressPrefixes;

	@Override
	public void initialize(AddressCode theAddressCode) {
		addressPrefixes = theAddressCode.value();
	}

	// Update the isValid(...) method to loop through the address prefixes. In the
	// loop, check to see if the code matches any of the address prefixes.
	@Override
	public boolean isValid(String theCode, ConstraintValidatorContext theConstraintValidatorContext) {
		boolean result = false;

		if (theCode != null) {
			// loop thru address prefixes
			// check to see if code matches any of the address prefixes
			for (String tempPrefix : addressPrefixes) {
				result = theCode.startsWith(tempPrefix);

				// if we found a match then break out of the loop
				if (result) {
					break;
				}
			}
		} else {
			result = true;
		}

		return result;
	}
}
