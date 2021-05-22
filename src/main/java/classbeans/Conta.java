package classbeans;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class Conta {
	private int id ;
	private String nome;
	private InputStream documento;
	private File receber;
	private int idusuario;
	
	public Conta(Integer id, String nome, InputStream documento,File receber, Integer idusuario) {
		this.id=id;
		this.nome=nome;
		this.documento=documento;
		this.receber=receber;
		this.idusuario=idusuario;
	}
	public Conta() {
		
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
	public InputStream getDocumento() {
		return documento;
	}
	public void setDocumento(InputStream documento) {
		this.documento = documento;
	}
	
	public File getReceber() {
		return receber;
	}
	public void setReceber(File inputStream) {
		this.receber = inputStream;
	}
	public int getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	
}
