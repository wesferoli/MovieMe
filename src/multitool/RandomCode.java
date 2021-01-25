package multitool;

import java.util.Random;

public class RandomCode {
	
	
	private String gerarDicionario() {
		// dic : @#$%0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
		String dic = "@#$%";
		for(int i = 48; i <= 57; i++) { dic += (( char ) i ); }
		for(int i = 65; i <= 90; i++) { dic += (( char ) i ); }
		for(int i = 97; i <= 122; i++){ dic += (( char ) i ); }
		return ( dic );
	}
	
	public String generate(int size) {
		Random random = new Random();
		String dictionary = this.gerarDicionario();
		String code = "";
		for (int i = 0; i < size; i++ ) {
			code += ((char) dictionary.charAt(random.nextInt( dictionary.length()))) ;
		}
		return ( code );
	}
	
}
