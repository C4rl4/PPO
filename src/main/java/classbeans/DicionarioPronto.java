package classbeans;

import java.io.File;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.InputStream;

public class DicionarioPronto {

	private int id;
	private String nome;
	private String categoria;
	private InputStream img;
	private File receber;
	private int idconta;
	
	public DicionarioPronto() {
		
	}
	public DicionarioPronto(Integer id,File receber, String nome,String categoria, InputStream img, Integer idconta) {
		this.id=id;
		this.nome=nome;
		this.categoria=categoria;
		this.img=img;
		this.idconta=idconta;
		this.receber=receber;
	}
	
	public File getReceber() {
		return receber;
	}
	public void setReceber(File string) {
		this.receber = string;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public InputStream getImg() {
		return img;
	}
	public void setImg(InputStream bs) {
		this.img = bs;
	}
	public int getIdconta() {
		return idconta;
	}
	public void setIdconta(int idconta) {
		this.idconta = idconta;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	@Override
	public String toString() {
		return "DicionarioPronto [id=" + id + ", nome=" + nome + ", categoria=" + categoria + ", img=" + img
				+ ", idconta=" + idconta + "]";
	}
	
	
	
}
