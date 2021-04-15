package classbeans;

import java.io.File;
import java.sql.Blob;
import java.util.Date;

public class Usuario {

	
	private int id ;
	private String nome;  
	private Date nascimento ;
	private String sexo ;
	private String tipo ;
	private String documento;
	private String email;
	private String senha;
	
	
	
	public Usuario(Integer id, String nome, Date nascimento, String sexo, String tipo,String documento, String email,
			String senha) {
		super();
		this.id = id;
		this.nome = nome;
		this.nascimento = nascimento;
		this.sexo = sexo;
		this.tipo = tipo;
		this.documento = documento;
		this.email = email;
		this.senha = senha;
	}
	public Usuario() {}
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
	public String getDocumento() {
		return documento;
	}
	public void setDocumento(String string) {
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
