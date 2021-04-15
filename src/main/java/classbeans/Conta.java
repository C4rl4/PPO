package classbeans;

public class Conta {
	private int id ;
	private String nome;
	private String documento;
	private int idusuario;
	
	public Conta(Integer id, String nome, String documento, Integer idusuario) {
		this.id=id;
		this.nome=nome;
		this.documento=documento;
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
	public String getDocumento() {
		return documento;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public int getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	
}
