package classbeans;

public class DicionarioPronto {

	private int id;
	private String nome;
	private String img;
	private int idconta;
	
	public DicionarioPronto() {
		
	}
	public DicionarioPronto(Integer id, String nome, String img, Integer idconta) {
		this.id=id;
		this.nome=nome;
		this.img=img;
		this.idconta=idconta;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getIdconta() {
		return idconta;
	}
	public void setIdconta(int idconta) {
		this.idconta = idconta;
	}
	
	
}
