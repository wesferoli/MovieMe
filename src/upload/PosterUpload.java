package upload;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controllers/posterUpload")
public class PosterUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PosterUpload() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String posterUpload = request.getParameter("posterUpload");
			System.out.println(posterUpload);
			
			response.getWriter().write("Imagem pronta!");
		} catch(Exception e) {
			response.getWriter().write("Erro ao realizar upload!");
		}
	}

}
