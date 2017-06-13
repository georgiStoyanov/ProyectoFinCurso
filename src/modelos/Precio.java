package modelos;

public class Precio {
	private int id;
	private double precio_servicio;
	private double precio_mercancia_de;
	private double precio_mercancia_a;
	private int servicio_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getPrecio_servicio() {
		return precio_servicio;
	}
	public void setPrecio_servicio(double precio_servicio) {
		this.precio_servicio = precio_servicio;
	}
	public double getPrecio_mercancia_de() {
		return precio_mercancia_de;
	}
	public void setPrecio_mercancia_de(double precio_mercancia_de) {
		this.precio_mercancia_de = precio_mercancia_de;
	}
	public double getPrecio_mercancia_a() {
		return precio_mercancia_a;
	}
	public void setPrecio_mercancia_a(double precio_mercancia_a) {
		this.precio_mercancia_a = precio_mercancia_a;
	}
	public int getServicio_id() {
		return servicio_id;
	}
	public void setServicio_id(int servicio_id) {
		this.servicio_id = servicio_id;
	}
}
