package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;
import multitool.RandomCode;

public class Usuario {
	private int	   	idUsuario;
	private String 	email;
	private int 	idNivelUsuario;
	private String 	senha;
	private String 	nome;
	private String 	foto;
	private String 	ativo;
	
	private String tableName	= "db_movieme.usuarios"; 
	private String fieldsName	= "idUsuario, email, idNivelUsuario, senha, nome, foto, ativo";  
	private String fieldKey		= "idUsuario";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	

	public Usuario( int idUsuario, String email, int idNivelUsuario, String senha, String nome, String foto, String ativo) {
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setSenha(senha);
		this.setNome(nome);
		this.setFoto(foto);
		this.setAtivo(ativo);
	}
	
	public Usuario( String email, String senha, String nome) {
		this.setIdUsuario(0);
		this.setEmail(email);
		this.setIdNivelUsuario(0);
		this.setSenha(senha);
		this.setNome(nome);
	}
	
	public Usuario( String email) {
		this.setIdUsuario(0);
		this.setEmail(email);
	}
	
	public Usuario() {
		this.setIdUsuario(0);
	}
	
	public String toString() {
		return(
				this.getIdUsuario() + ""+" | "+
				this.getEmail()+" | "+
				this.getIdNivelUsuario() + ""+" | "+
				"********"+" | "+
				this.getNome()+" | "+
				this.getFoto()+" | "+
				this.getAtivo()+" | "
		);
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getIdUsuario() + "",
				this.getEmail(),
				this.getIdNivelUsuario() + "",
				this.getSenha(),
				this.getNome(),
				this.getFoto(),
				this.getAtivo(),
		};
		return(temp);
	}
	
	public void save() {
		if( this.getIdUsuario() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	public void delete() {
		if( this.getIdUsuario() > 0 ) {
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
	
	public String newPassword() {
		
		if (this.getEmail() != "" && this.getEmail()!= null) {
			if ( this.getIdUsuario() > 0 ) {
				try {
					ResultSet resultset = this.select(" email ='"+this.getEmail()+"'");
					boolean existe = resultset.next();
					if ( existe ) {
						this.setSenha(  new RandomCode().generate(32) );
						this.save();
						return( this.getSenha());
					}
					resultset.getInt("idUsuario");
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			} else {
				this.setSenha(  new RandomCode().generate(32));
				return(  this.getSenha() );
			}
		} else {
			// Sem email não deve gerar senha
		}
		return this.getSenha(); 
	}

	public boolean checkLogin() {
		
		int id = 0;
		try {
			ResultSet resultSet = this.select(" email='"+ this.getEmail()+ "' AND senha = '"+this.getSenha()+"'");
			while (resultSet.next()) {
				System.out.println( "\n"+resultSet.getString("nome"));
				id =  resultSet.getInt("idUsuario");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.setIdUsuario(id);
		return(id > 0);	
	}
	
	public String listAllHtml() {
		ResultSet rs =  this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		try {
			while (rs.next()) {
				saida += "<tr>";
		     
				saida += "<td>" + rs.getString("idUsuario" ) +  "</td>";
				saida += "<td>" + rs.getString("email" ) +  "</td>";
				saida += "<td>" + rs.getString("senha" ) +  "</td>";
				saida += "<td>" + rs.getString("idNivelUsuario" ) +  "</td>";
				saida += "<td>" + rs.getString("nome" ) +  "</td>";
				saida += "<td>" + rs.getString("cpf" ) +  "</td>";
				saida += "<td>" + rs.getString("endereco" ) +  "</td>";
				saida += "<td>" + rs.getString("bairro" ) +  "</td>";
				saida += "<td>" + rs.getString("cidade" ) +  "</td>";
				saida += "<td>" + rs.getString("uf" ) +  "</td>";
				saida += "<td>" + rs.getString("cep" ) +  "</td>";
				saida += "<td>" + rs.getString("telefone" ) +  "</td>";
				saida += "<td>" + rs.getString("foto" ) +  "</td>";
				saida += "<td>" + rs.getString("ativo" ) +  "</td>";
				saida += "</tr> <br>";
			}
	   } catch (SQLException e) {
		 e.printStackTrace();
	   }
	   saida += "</table>";
	   return (saida);
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}

	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}
	
	public void setIdNivelUsuario(String idNivelUsuario) {
		this.idNivelUsuario = ((idNivelUsuario == "") ? 0 : Integer.parseInt(idNivelUsuario));
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getAtivo() {
		return ativo;
	}

	public void setAtivo(String ativo) {
		this.ativo = ativo;
	}
	

}
