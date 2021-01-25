package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;


public class Categorias {
 
	private String	tableName = "";
	private String	fieldsName = "";
	private String	keyField = "";
	// private String	where = "";
	private DBQuery	dbQuery = new DBQuery(tableName, fieldsName, keyField);
	

	private int	idCategoria;
	private String	categoria;

	public Categorias(){
		this.tableName  = "categorias";
		this.fieldsName = "idCategoria, categoria";
		this.keyField   = "idCategoria";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}

	public Categorias(int idCategoria, String categoria){
		this.tableName  = "categorias";
		this.fieldsName = "idCategoria, categoria";
		this.keyField   = "idCategoria";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
		this.setIdCategoria( idCategoria);
		this.setCategoria( categoria);
	}
	public String toString(){
		return (
			this.getIdCategoria() +", "+
			this.getCategoria() +", "
		);
	 }

	public String[] toArray(){
		return (
			new String[] { 
				""+this.getIdCategoria(),
				""+this.getCategoria()
			}
		);
	 }

	public void save() {
		  if ((this.getIdCategoria() == 0 )){
		       this.dbQuery.insert(this.toArray());
          }else{
		      this.dbQuery.update(this.toArray());
          }
        }
	
    public void delete() {
        if (this.getIdCategoria() > 0 ){
            this.dbQuery.delete( this.toArray() );
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
    
   public String listAll() {
       ResultSet rs =  this.dbQuery.select("");
       String saida = "<br>";
       saida += "<table border=1>";
	
	   try {
	      while (rs.next()) {
		     saida += "<tr>";
		     
			 saida += "<td>" + rs.getString("idCategoria" ) +  "</td>";
			 saida += "<td>" + rs.getString("categoria" ) +  "</td>";
		     saida += "</tr> <br>";
	      }
	   } catch (SQLException e) {
		 e.printStackTrace();
	   }
	   saida += "</table>";
	   return (saida);
   }

	
	public void	setIdCategoria( int idCategoria ){
		this.idCategoria=idCategoria;
	};
	
	public int	 getIdCategoria(){
		return ( this.idCategoria );
	};
	
	public void	setCategoria( String categoria ){
		this.categoria = categoria;
	};
	
	public String	 getCategoria(){
		return ( this.categoria );
	};
	
} 