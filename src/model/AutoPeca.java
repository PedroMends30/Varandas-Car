package model;

public class AutoPeca {
	private int id_peca;
	private int id_veiculo;
	private String nome_peca;
	private Double volume_peca;
	private String cor_peca;
	private String desc_peca;
	private String data_peca;
	
	public String getData_peca() {
		return data_peca;
	}
	public void setData_peca(String data_peca) {
		this.data_peca = data_peca;
	}
	public int getId_peca() {
		return id_peca;
	}
	public void setId_peca(int id_peca) {
		this.id_peca = id_peca;
	}
	public int getId_veiculo() {
		return id_veiculo;
	}
	public void setId_veiculo(int id_veiculo) {
		this.id_veiculo = id_veiculo;
	}
	public String getNome_peca() {
		return nome_peca;
	}
	public void setNome_peca(String nome_peca) {
		this.nome_peca = nome_peca;
	}
	public Double getVolume_peca() {
		return volume_peca;
	}
	public void setVolume_peca(Double volume_peca) {
		this.volume_peca = volume_peca;
	}
	public String getCor_peca() {
		return cor_peca;
	}
	public void setCor_peca(String cor_peca) {
		this.cor_peca = cor_peca;
	}
	public String getDesc_peca() {
		return desc_peca;
	}
	public void setDesc_peca(String desc_peca) {
		this.desc_peca = desc_peca;
	}
	
}
