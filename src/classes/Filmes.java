package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;


public class Filmes {
 
	private String tableName  = "filmes";
	private String fieldsName = "idFilme, nome, idCategoria, descricao, ano, atores, diretores, poster";
	private String keyField   = "idFilme";
	// private String	where = "";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, keyField);
	

	private int		idFilme;
	private String	nome;
	private int		idCategoria;
	private String	descricao;
	private int		ano;
	private String	atores;
	private String	diretores;
	private String	poster;

	public Filmes(int idFilme, String nome, int idCategoria, String descricao, int ano, String atores, String diretores, String poster){
		this.tableName  = "filmes";
		this.fieldsName = "idFilme, nome, idCategoria, descricao, ano, atores, diretores, poster";
		this.keyField   = "idFilme";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
		this.setIdFilme( idFilme );
		this.setNome( nome );
		this.setIdCategoria( idCategoria );
		this.setDescricao( descricao );
		this.setAno( ano );
		this.setAtores( atores );
		this.setDiretores( diretores );
		this.setPoster( poster );
	}
	
	public Filmes() {
		this.setIdFilme(0);
	}
	
	public Filmes(int idFilme) {
		this.setIdFilme(idFilme);
	}
	
	public String toString(){
		return (
			this.getIdFilme() +", "+
			this.getNome() +", "+
			this.getIdCategoria() +", "+
			this.getDescricao() +", "+
			this.getAno() +", "+
			this.getAtores() +", "+
			this.getDiretores() +", "+
			this.getPoster() +", "
		);
	 }

	public String[] toArray(){
		return (
			new String[] { 
				""+this.getIdFilme(),
				""+this.getNome(),
				""+this.getIdCategoria(),
				""+this.getDescricao(),
				""+this.getAno(),
				""+this.getAtores(),
				""+this.getDiretores(),
				""+this.getPoster()
			}
		);
	 }

	public void save() {
	  if ((this.getIdFilme() == 0 )){
	       this.dbQuery.insert(this.toArray());
      }else{
	      this.dbQuery.update(this.toArray());
      }
    }

    public void delete() {
        if (this.getIdFilme() > 0 ){
            this.dbQuery.delete( this.toArray() );
        }
    }
    
   public String listAll() {
       ResultSet rs =  this.dbQuery.select("");
	   String saida = "<br>";
	   saida += "<table border=1>";
	
	   try {
	      while (rs.next()) {
		     saida += "<tr>";
		     
			 saida += "<td>" + rs.getString("idFilme" ) +  "</td>";
			 saida += "<td>" + rs.getString("nome" ) +  "</td>";
			 saida += "<td>" + rs.getString("idCategoria" ) +  "</td>";
			 saida += "<td>" + rs.getString("descricao" ) +  "</td>";
			 saida += "<td>" + rs.getString("ano" ) +  "</td>";
			 saida += "<td>" + rs.getString("atores" ) +  "</td>";
			 saida += "<td>" + rs.getString("diretores" ) +  "</td>";
			 saida += "<td>" + rs.getString("poster" ) +  "</td>";
		     saida += "</tr> <br>";
	      }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   }
	   saida += "</table>";
	   return (saida);
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
	
	public void	setIdFilme( int idFilme ){
		this.idFilme = idFilme;
	};
	
	public int	 getIdFilme(){
		return ( this.idFilme );
	};
	
	public void	setNome( String nome ){
		this.nome = nome;
	};
	
	public String getNome(){
		return ( this.nome );
	};
	
	public void	setIdCategoria( int idCategoria ){
		this.idCategoria = idCategoria;
	};
	
	public int	 getIdCategoria(){
		return ( this.idCategoria );
	};
	
	public void	setDescricao( String descricao ){
		this.descricao = descricao;
	};
	
	public String getDescricao(){
		return ( this.descricao );
	};
	
	public void	setAno( int ano ){
		this.ano = ano;
	};
	
	public int	 getAno(){
		return ( this.ano );
	};
	
	public void	setAtores( String atores ){
		this.atores = atores;
	};
	
	public String	 getAtores(){
		return ( this.atores );
	};
	
	public void	setDiretores( String diretores ){
		this.diretores = diretores;
	};
	
	public String	 getDiretores(){
		return ( this.diretores );
	};
	
	public void	setPoster( String poster ){
		this.poster = poster;
	};
	
	public String	 getPoster(){
		return ( this.poster );
	};
	
} 