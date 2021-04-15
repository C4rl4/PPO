package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.extra.spath.ParseException;

import classbeans.Usuario;
import dao.DaoConta;
import dao.DaoDicionarioPronto;
import dao.DaoUsuario;


@WebServlet(name="Usuario", urlPatterns= {"/usuariocontrole"})
public class UsuarioControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LOGIN ="/Login.html";
	private static String Dicionario="/Dicionario.jsp";
    private DaoUsuario dao = null;
    private DaoConta daoconta =null;
    private DaoDicionarioPronto daodici=null;
    public UsuarioControle() {
        super();
        dao= new DaoUsuario();
        daoconta= new DaoConta();
        daodici=new DaoDicionarioPronto();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward="";
		String action=request.getParameter("action");
		if(action.equals("listdicionario")) {
			forward=Dicionario;
			request.setAttribute("dic", daodici.getallDicionario());
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Random random = new Random();
		int id= random.nextInt(50);
		Usuario usuario = new Usuario();
		usuario.setId(id);
		usuario.setNome(request.getParameter("nome"));
		try {
			Date nascimento=null;
			String teste= request.getParameter("data");
			System.out.println(teste);
			if(request.getParameter("data")!=null) {
				nascimento = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data"));
			}else {
				nascimento=null;
			}
			usuario.setNascimento(nascimento);
		}catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		usuario.setEmail(request.getParameter("email"));
		usuario.setSexo(request.getParameter("sexo"));
		usuario.setTipo(request.getParameter("tipo"));
		usuario.setDocumento(request.getParameter("document"));
		String senha1 = request.getParameter("senhaForca");
		String senha2 = request.getParameter("senhaForca2");
		if(senha1.equals(senha2)) {
			usuario.setSenha(senha1);
		}
		try {
			dao.AdicionarUsuario(usuario);
			daoconta.AdicionarConta(dao.getUsuarioByid(usuario.getId()));
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher view = request.getRequestDispatcher(LOGIN);
		view.forward(request, response);
	}

}
