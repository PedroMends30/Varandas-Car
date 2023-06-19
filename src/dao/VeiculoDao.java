package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Veiculo;
import util.Conexao;

public class VeiculoDao {
	
	public boolean inserirVeiculo(Veiculo v) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO `veiculo` "
					+ "(`id_veiculo`, `id_usuario`,"
					+ " `montadora_veiculo`, `modelo_veiculo`,"
					+ " `ano_veiculo`) VALUES "
					+ "(NULL, '"+v.getId_usuario()+"', '"+v.getMontadora_veiculo()+"'"
							+ ", '"+v.getModelo_veiculo()+"', '"+v.getAno_veiculo()+"');");
			return true;
		} catch (SQLException e){
			return false;
		}
		
	}
	
	public Veiculo VeiculoPorId(int id_veiculo) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resV = con.executeQuery("SELECT * FROM `veiculo` WHERE `id_veiculo`="+id_veiculo);
			
			resV.next();
			
			Veiculo veiculo = new Veiculo();
			
			
			veiculo.setId_usuario(resV.getInt(1));
			veiculo.setId_usuario(resV.getInt(2));
			veiculo.setMontadora_veiculo(resV.getString(3));
			veiculo.setModelo_veiculo(resV.getString(4));
			veiculo.setAno_veiculo(resV.getInt(5));

			return veiculo;
		}catch (SQLException e) {
			return null;
		}
	}
	
	public boolean editarVeiculo(Veiculo v) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("UPDATE `veiculo` SET "
					+ "`id_usuario` = "+v.getId_usuario()+","
					+ " `montadora_veiculo` = '"+v.getMontadora_veiculo()+"',"
					+ " `modelo_veiculo` = '"+v.getModelo_veiculo()+"',"
					+ " `ano_veiculo` = '"+v.getAno_veiculo()+"' "
					+ " WHERE`id_veiculo` = "+v.getId_veiculo()+";");
			return true;
		} catch (SQLException e){
			return false;
		}
		
	}
	
	public ArrayList<Veiculo> veiculosUser(int id_user){
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet res = con.executeQuery("SELECT * FROM `veiculo` WHERE id_usuario = "+id_user+";");
			ArrayList<Veiculo> veiculos = new ArrayList<Veiculo>();
			
			while (res.next()) {
				Veiculo nova = new Veiculo();
				nova.setId_veiculo(res.getInt(1));
				nova.setId_usuario(res.getInt(2));
				nova.setMontadora_veiculo(res.getString(3));
				nova.setModelo_veiculo(res.getString(4));
				nova.setAno_veiculo(res.getInt(5));
				veiculos.add(nova);
			}
			return veiculos;
		} catch (SQLException e){
			return null;
		} catch (NullPointerException a) {
			return null;
		}
	}
	
	public boolean apagarVeiculo(int id_veiculo) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM `veiculo` WHERE id_veiculo ="+id_veiculo+";");
			con.executeUpdate("DELETE FROM `auto_peca` WHERE id_veiculo ="+id_veiculo+";");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public int idVeiculoAutoPeca() {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet res = con.executeQuery("SELECT MAX(id_veiculo) FROM `veiculo`");
			res.next();
			int id = res.getInt(1);
			return id+1;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}
	
}
