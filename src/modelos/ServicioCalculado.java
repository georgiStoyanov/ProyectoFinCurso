package modelos;

public class ServicioCalculado {
	private int servicio_id;
	private String servicio_nombre;
	private double precio_mercancia;
	private String tipo_medida;
	private double cuanto_medida;
	private double total_precio_servicio;
	private int presupuesto_id;
	
	public int getServicio_id() {
		return servicio_id;
	}
	public void setServicio_id(int servicio_id) {
		this.servicio_id = servicio_id;
	}
	public String getServicio_nombre() {
		return servicio_nombre;
	}
	public void setServicio_nombre(String servicio_nombre) {
		this.servicio_nombre = servicio_nombre;
	}
	public double getPrecio_mercancia() {
		return precio_mercancia;
	}
	public void setPrecio_mercancia(double precio_mercancia) {
		this.precio_mercancia = precio_mercancia;
	}
	public double getCuanto_medida() {
		return cuanto_medida;
	}
	public void setCuanto_medida(double cuanto_medida) {
		this.cuanto_medida = cuanto_medida;
	}
	public String getTipo_medida() {
		return tipo_medida;
	}
	public void setTipo_medida(String tipo_medida) {
		this.tipo_medida = tipo_medida;
	}
	public double getTotal_precio() {
		return this.total_precio_servicio;
	}
	public void setTotal_precio(double total_precio_servicio) {
		this.total_precio_servicio = total_precio_servicio;
	}
	public int getPresupuesto_id() {
		return presupuesto_id;
	}
	public void setPresupuesto_id(int presupuesto_id) {
		this.presupuesto_id = presupuesto_id;
	}
}
