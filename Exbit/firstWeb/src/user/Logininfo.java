package user;

public class Logininfo {
	private String USERID;
	private String USERNAME;
	private String USERFILE;
	
	public Logininfo() {
		
	}
	
	public Logininfo(String uSERID, String uSERNAME, String uSERFILE) {
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERFILE = uSERFILE;
	}

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getUSERFILE() {
		return USERFILE;
	}

	public void setUSERFILE(String uSERFILE) {
		USERFILE = uSERFILE;
	}
	
	
	
}
