package guest.service;

public class InvalidMessagePassowrdException extends Exception {

	private static final long serialVersionUID = 1L;
	
	public InvalidMessagePassowrdException() {
		
	}
	
	public InvalidMessagePassowrdException(String message) {
		super(message);
	}
	

}