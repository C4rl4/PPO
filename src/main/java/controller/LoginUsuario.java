package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classbeans.Usuario;
import dao.DaoUsuario;

@WebServlet(name="login", urlPatterns= {"/login"})
public class LoginUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LOGIN_OUVINTE ="/principalouvinte.html";
	private static String LOGIN_SURDO ="/principalinterprete.html";
	private static String LOGIN_INTERPRETE ="/principalsurdo.html";
    private DaoUsuario dao = null;
    
    public LoginUsuario() {
        super();
        dao= new DaoUsuario();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		String nome = request.getParameter("nome");
		String senha = request.getParameter("senha");
		usuario=dao.getLogin(nome, senha);
		if(usuario.getNome()!=null && usuario.getSenha()!=null && !usuario.getNome().isEmpty() && !usuario.getSenha().isEmpty()) {
			if(usuario.getTipo().equals("ouvinte")) {
				request.getRequestDispatcher(LOGIN_OUVINTE).forward(request, response);
			}else if(usuario.getTipo().equals("surdo")) {
				request.getRequestDispatcher(LOGIN_SURDO).forward(request, response);
			}else if(usuario.getTipo().equals("interprete")) {
				request.getRequestDispatcher(LOGIN_INTERPRETE).forward(request, response);
			}
		}
	}

}
