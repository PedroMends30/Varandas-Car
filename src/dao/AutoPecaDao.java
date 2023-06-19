package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.AutoPeca;
import util.Conexao;

public class AutoPecaDao {
	public boolean inserirPeca(AutoPeca peca) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO `auto_peca` "
					+ "(`id_peca`, `id_veiculo`, `nome_peca`,"
					+ " `volume_peca`, `cor_peca`, `desc_peca`,"
					+ " `data_peca`) VALUES (NULL, '"+peca.getId_veiculo()+"'"
							+ ", '"+peca.getNome_peca()+"', '"+peca.getVolume_peca()+"'"
									+ ", '"+peca.getCor_peca()+"', '"+peca.getDesc_peca()+"', '"+peca.getData_peca()+"');");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public boolean editarPeca(AutoPeca peca) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("UPDATE `auto_peca` SET "
					+ " `nome_peca` = '"+peca.getNome_peca()+"',"
					+ " `volume_peca`="+peca.getVolume_peca()+", "
					+ "`cor_peca`='"+peca.getCor_peca()+"',"
					+ "`desc_peca`='"+peca.getDesc_peca()+"',"
					+ "`data_peca`='"+peca.getData_peca()+"' WHERE `id_peca` = "+peca.getId_peca()+";");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public AutoPeca pecaVeiculo(int id_veiculo){
			Conexao con = null;
			try {
				con = new Conexao();
				ResultSet res = con.executeQuery("SELECT * FROM `auto_peca` WHERE id_veiculo = "+id_veiculo+";");
				AutoPeca nova = new AutoPeca();
				res.next();
				nova.setId_peca(res.getInt(1));
				nova.setId_veiculo(res.getInt(2));
				nova.setNome_peca(res.getString(3));
				nova.setVolume_peca(res.getDouble(4));
				nova.setCor_peca(res.getString(5));
				nova.setDesc_peca(res.getString(6));
				nova.setData_peca(res.getString(7));
				return nova;
			} catch (SQLException e){
				return null;
			} catch (NullPointerException a) {
				return null;
			}
	}
	
	public AutoPeca pecaPorVeiculo(int id_veiculo) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resA = con.executeQuery("SELECT * FROM `auto_peca` WHERE `id_veiculo`="+id_veiculo);
			
			resA.next();
			
			AutoPeca autoPeca = new AutoPeca();
			
			autoPeca.setId_peca(resA.getInt(1));
			autoPeca.setId_veiculo(resA.getInt(2));
			autoPeca.setNome_peca(resA.getString(3));
			autoPeca.setVolume_peca(resA.getDouble(4));
			autoPeca.setCor_peca(resA.getString(5));
			autoPeca.setDesc_peca(resA.getString(6));
			autoPeca.setData_peca(resA.getString(7));
			
			return autoPeca;
			}catch (SQLException e) {
				return null;
			}
	}
	
	public boolean apagarPeca(int id_peca) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM `auto_peca` WHERE id_peca = "+id_peca+";");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
}
