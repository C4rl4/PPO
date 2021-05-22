package classbeans;

import java.io.File;
import java.io.InputStream;

public class DicionarioSimbolo {
	private int id;
	private String nome;
	private InputStream img;
	private File imgrecebe;
	private int iddicisimbolo;
	private Integer iddicsimbolo;
	
	public DicionarioSimbolo() {
		
	}
	public DicionarioSimbolo(Integer id, String nome, InputStream img, File imgrecebe ,Integer iddicpronto) {
		this.id=id;
		this.nome=nome;
		this.img=img;
		this.imgrecebe=imgrecebe;
		this.iddicsimbolo=iddicpronto;
		
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
	public void setImg(InputStream img) {
		this.img = img;
	}
	
	public File getImgrecebe() {
		return imgrecebe;
	}
	public void setImgrecebe(File imgrecebe) {
		this.imgrecebe = imgrecebe;
	}
	public int getIddicsimb() {
		return iddicsimbolo;
	}
	public void setIddicsimb(int iddicpronto) {
		this.iddicsimbolo = iddicpronto;
	}
	
}
