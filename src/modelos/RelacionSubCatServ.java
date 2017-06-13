package modelos;

public class RelacionSubCatServ {
	private int id_relacion;
	private int sub_categoria_id;
	private int servicio_id;
	private String nombre_servicio;
	private String nombre_subCategoria;
	
	public int getId_relacion() {
		return id_relacion;
	}
	public void setId_relacion(int id_relacion) {
		this.id_relacion = id_relacion;
	}
	public int getSub_categoria_id() {
		return sub_categoria_id;
	}
	public void setSub_categoria_id(int sub_categoria_id) {
		this.sub_categoria_id = sub_categoria_id;
	}
	public int getServicio_id() {
		return servicio_id;
	}
	public void setServicio_id(int servicio_id) {
		this.servicio_id = servicio_id;
	}
	public String getNombre_servicio() {
		return nombre_servicio;
	}
	public void setNombre_servicio(String nombre_servicio) {
		this.nombre_servicio = nombre_servicio;
	}
	public String getNombre_subCategoria() {
		return nombre_subCategoria;
	}
	public void setNombre_subCategoria(String nombre_subCategoria) {
		this.nombre_subCategoria = nombre_subCategoria;
	}
}
