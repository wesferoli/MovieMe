package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Reviews {
	private int	   	idReview;
	private String 	titulo;
	private String 	review;
	private float   nota;
	private int		idUsuario;
	private int		idFilme;
	
	private String tableName	= "db_movieme.reviews"; 
	private String fieldsName	= "idReview, titulo, review, nota, idUsuario, idFilme";  
	private String fieldKey		= "idReview";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	

	public Reviews( int idReview, String titulo, String review, float nota, int idUsuario, int idFilme) {
		this.setIdReview(idReview);
		this.setTitulo(titulo);
		this.setReview(review);
		this.setNota(nota);
		this.setIdUsuario(idUsuario);
		this.setIdFilme(idFilme);
	}
	
	public Reviews(int idReview) {
		this.setIdReview(idReview);
	}
	
	public Reviews() {
		this.setIdReview(0);
	}
	
	public String toString() {
		return(
				this.getIdReview() + ""+" | "+
				this.getTitulo()+" | "+
				this.getReview() + ""+" | "+
				this.getNota()+" | "+
				this.getIdUsuario()+" | "+
				this.getIdFilme()+" | "
		);
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getIdReview() + "",
				this.getTitulo(),
				this.getReview(),
				this.getNota() + "",
				this.getIdUsuario() + "",
				this.getIdFilme() + "",
		};
		return(temp);
	}
	
	public void save() {
		if( this.getIdReview() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	public void delete() {
		if( this.getIdReview() > 0 ) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return(resultset);
	}
	
	public ResultSet selectBy( String field, String value ) {
		ResultSet resultset = this.dbQuery.select( " "+field+"='"+value+"'");
		return(resultset);
	}
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	public String listAllHtml() {
		ResultSet rs =  this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		try {
			while (rs.next()) {
				saida += "<tr>";
		     
				saida += "<td>" + rs.getString("idReview" ) +  "</td>";
				saida += "<td>" + rs.getString("titulo" ) +  "</td>";
				saida += "<td>" + rs.getString("review" ) +  "</td>";
				saida += "<td>" + rs.getString("nota" ) +  "</td>";
				saida += "<td>" + rs.getString("idUsuario" ) +  "</td>";
				saida += "<td>" + rs.getString("idFilme" ) +  "</td>";
				
				saida += "</tr> <br>";
			}
	   } catch (SQLException e) {
		 e.printStackTrace();
	   }
	   saida += "</table>";
	   return (saida);
	}
	
	public int getIdReview() {
		return idReview;
	}

	public void setIdReview(int idReview) {
		this.idReview = idReview;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public float getNota() {
		return nota;
	}

	public void setNota(float nota) {
		this.nota = nota;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}
	
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = ((idUsuario == "") ? 0 : Integer.parseInt(idUsuario));
	}
	
	public int getIdFilme() {
		return idFilme;
	}
	
	public void setIdFilme(int idFilme) {
		this.idFilme = idFilme;
	}
	
	public void setIdFilme(String idFilme) {
		this.idFilme = ((idFilme == "") ? 0 : Integer.parseInt(idFilme));
	}

}
