package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelos.Precio;
import modelos.Servicio;

public class PreciosService {
	private Connection con;

	private String getPreciosSQL = "select * from elmartillo.precios;";
	private String bajaPrecioSQL = "delete from elmartillo.precios where servicio_id=?;";
	private String altaPrecioSQL ="Insert into elmartillo.precios(precio_servicio,servicio_id) values(?,?);"; 
	
	private PreparedStatement getPreciosStatement;
	private PreparedStatement bajaPrecioStatement;
	private PreparedStatement altaPrecioStatement;

	public List<Precio> getPrecios() {
		List<Precio> listaPrecios = new ArrayList<Precio>();
		try {
			this.con = new Conectar().getConeccion();
			this.getPreciosStatement = con.prepareStatement(getPreciosSQL);
			ResultSet preciosSet = this.getPreciosStatement.executeQuery();
			while (preciosSet.next()) {
				Precio precio = new Precio();
				precio.setId(preciosSet.getInt("id"));
				precio.setPrecio_servicio(preciosSet.getDouble("precio_servicio"));
				precio.setPrecio_mercancia_de(preciosSet.getDouble("precio_mercancia_de"));
				precio.setPrecio_mercancia_a(preciosSet.getDouble("precio_mercancia_a"));
				precio.setServicio_id(preciosSet.getInt("servicio_id"));
				listaPrecios.add(precio);
			}
			return listaPrecios;
		} catch (SQLException e) {
			System.out.println(
					"---------------------------------------------------------SQL Exception en preciosService getPrecios------------------------------------------------------------");
			e.printStackTrace();
		} catch (NullPointerException e) {
			System.out.println(
					"---------------------------------------------------------Algun valor esta en null en preciosService getPrecios------------------------------------------------------------");
			e.printStackTrace();
		} finally {
			try {
				this.con.close();
			} catch (Exception e2) {
				System.out.println(
						"------------------------------------------------------Fallo el cierre de la coneccion en preciosService getPrecios----------------------------------------------");
			}
		}
		return listaPrecios;
	}

	public void bajaPrecio(String servicio_id) {
		try {
			this.con = new Conectar().getConeccion();
			this.bajaPrecioStatement = con.prepareStatement(bajaPrecioSQL);
			this.bajaPrecioStatement.setString(1, servicio_id);
			this.bajaPrecioStatement.executeUpdate();

		} catch (Exception e) {
			System.out.println(
					"---------------------------------------------------------Excepcion sql en preciosService bajaPrecio------------------------------------------------------------");
			e.printStackTrace();
		} finally {
			try {
				this.con.close();
			} catch (Exception e2) {
				System.out.println(
						"------------------------------------------------------Fallo el cierre de la coneccion en preciosService bajaPrecio----------------------------------------------");
			}
		}
	}
	
	public int altaPrecio(double d,int id_grabado) {
		try {
			this.con = new Conectar().getConeccion();
			this.altaPrecioStatement = con.prepareStatement(altaPrecioSQL);
			this.altaPrecioStatement.setDouble(1, d);
			this.altaPrecioStatement.setInt(2, id_grabado);
			System.out.println(altaPrecioStatement);
			return this.altaPrecioStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(
					"---------------------------------------------------------Excepcion sql en preciosService bajaPrecio------------------------------------------------------------");
			e.printStackTrace();
		} finally {
			try {
				this.con.close();
			} catch (Exception e2) {
				System.out.println(
						"------------------------------------------------------Fallo el cierre de la coneccion en preciosService bajaPrecio----------------------------------------------");
			}
		}
		return 0;
	}
}
