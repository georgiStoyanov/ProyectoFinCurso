package modelos;

public class Usuario {
	private int id;
	private String email;
	private String pass;
	private String derechos;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getDerechos() {
		return derechos;
	}
	public void setDerechos(String derechos) {
		this.derechos = derechos;
	}
}
