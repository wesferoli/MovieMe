package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;


public class NivelUsuarios {
 
	private String	tableName = "";
	private String	fieldsName = "";
	private String	keyField = "";
	// private String	where = "";
	private DBQuery	dbQuery = new DBQuery(tableName, fieldsName, keyField);
	

	private int	idNivelUsuario;
	private String	nivel;

	public NivelUsuarios(){
		this.tableName  = "nivel_usuarios";
		this.fieldsName = "idNivelUsuario, nivel";
		this.keyField   = "idNivelUsuario";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}

	public NivelUsuarios(int idNivelUsuario, String nivel){
		this.tableName  = "nivel_usuarios";
		this.fieldsName = "idNivelUsuario, nivel";
		this.keyField   = "idNivelUsuario";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
		this.setIdNivelUsuario( idNivelUsuario);
		this.setNivel( nivel);
	}
	public String toString(){
		return (
			this.getIdNivelUsuario() +", "+
			this.getNivel() +", "
		);
	 }

	public String[] toArray(){
		return (
			new String[] { 
				""+this.getIdNivelUsuario(),
				""+this.getNivel()
			}
		);
	 }

	public void save() {
		  if ((this.getIdNivelUsuario() == 0 )){
		       this.dbQuery.insert(this.toArray());
          }else{
		      this.dbQuery.update(this.toArray());
          }
        }
	
        public void delete() {
            if (this.getIdNivelUsuario() > 0 ){
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
			     
				 saida += "<td>" + rs.getString("idNivelUsuario" ) +  "</td>";
				 saida += "<td>" + rs.getString("nivel" ) +  "</td>";
			     saida += "</tr> <br>";
		      }
		   } catch (SQLException e) {
			 e.printStackTrace();
		   }
		   saida += "</table>";
		   return (saida);
	   }

	
	public void	setIdNivelUsuario( int idNivelUsuario ){
		this.idNivelUsuario=idNivelUsuario;
	};
	
	public int	 getIdNivelUsuario(){
		return ( this.idNivelUsuario );
	};
	
	public void	setNivel( String nivel ){
		this.nivel=nivel;
	};
	
	public String	 getNivel(){
		return ( this.nivel );
	};
	
} 