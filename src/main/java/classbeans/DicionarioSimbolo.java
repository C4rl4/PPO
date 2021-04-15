package classbeans;

public class DicionarioSimbolo {
	private int id;
	private String nome;
	private String img;
	private int iddicpronto;
	
	public DicionarioSimbolo() {
		
	}
	public DicionarioSimbolo(Integer id, String nome, String img, Integer iddicpronto) {
		this.id=id;
		this.nome=nome;
		this.img=img;
		this.iddicpronto=iddicpronto;
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
	public int getIddicpronto() {
		return iddicpronto;
	}
	public void setIddicpronto(int iddicpronto) {
		this.iddicpronto = iddicpronto;
	}
	
}
