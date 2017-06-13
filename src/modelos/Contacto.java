package modelos;

public class Contacto {
		private int id;
		private String personaContacto;
		private String email;
		private String direccion;
		private String telefono;
		private String 	descripcion;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getPersonaContacto() {
			return personaContacto;
		}
		public void setPersonaContacto(String personaContacto) {
			this.personaContacto = personaContacto;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getDireccion() {
			return direccion;
		}
		public void setDireccion(String direccion) {
			this.direccion = direccion;
		}
		public String getTelefono() {
			return telefono;
		}
		public void setTelefono(String telefono) {
			this.telefono = telefono;
		}
		public String getDescripcion() {
			return descripcion;
		}
		public void setDescripcion(String descripcion) {
			this.descripcion = descripcion;
		}
}
