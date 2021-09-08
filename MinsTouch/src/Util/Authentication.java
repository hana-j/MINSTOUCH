package Util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Authentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public Authentication() {
		passAuth = new PasswordAuthentication("aswjdgksk@gmail.com","gkwfkldkjcokpbqq");
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
