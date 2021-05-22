package classbeans;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Date;

public class Usuario {

	
	private int id ;
	private String nome;  
	private Date nascimento ;
	private String sexo ;
	private String tipo ;
	private InputStream documento;
	private String documentorecebe;/* ajeitar para file e converter a imagem do servlet para file[]*/
	private String email;
	private String senha;
	
	
	
	public Usuario(Integer id, String nome, Date nascimento, String sexo, String tipo,InputStream documento, String email,
			String senha, String documentorecebe) {
		super();
		this.id = id;
		this.nome = nome;
		this.nascimento = nascimento;
		this.sexo = sexo;
		this.tipo = tipo;
		this.documento = documento;
		this.email = email;
		this.senha = senha;
		this.documentorecebe= documentorecebe;
	}
	public Usuario() {}
	public String getDocumentorecebe() {
		return documentorecebe;
	}
	public void setDocumentorecebe(String string) {
		this.documentorecebe = string;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Date getNascimento() {
		return nascimento;
	}
	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public InputStream getDocumento() {
		return documento;
	}
	public void setDocumento(InputStream string) {
		this.documento = string;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
	
	


}
