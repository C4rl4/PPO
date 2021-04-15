package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classbeans.Usuario;
import dao.DaoUsuario;

@WebServlet(name="paginaini", urlPatterns= {"/paginainicial"})
public class PaginainicialUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private DaoUsuario dao = null;
   
    public PaginainicialUsuario() {
        super();
        dao=new DaoUsuario();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario= new Usuario();
		String buscar=request.getParameter("pesquise");
		
		
	}

}
