/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {
	
	public static String funcao(String[] mnemnonic){
		
		String[] vetor = new String[4];
		vetor[0] = "0";
		vetor[1] = "0";
		vetor[2] = "0";
		vetor[3] = "0";
		
		for (int i = 0; i <= mnemnonic.length ;i++){
			if (mnemnonic[i] == "%A"){
				vetor[0] = "1";
			}
			else if (mnemnonic[i] == "%S"){
				vetor[1] = "1";
			}
			else if (mnemnonic[i] == "%D"){
				vetor[2] = "1";
			}
			else if (mnemnonic[i] == "(%A)"){
				vetor[3] = "1";
			}
		}
		return vetor.toString();
	}

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
    	
    	if (mnemnonic[0] == "movew"){
    		return funcao(Arrays.copyOfRange(mnemnonic, 2, mnemnonic.length));
    	}
    	else{
    		if (mnemnonic.length == 1){
    			return "0000";
    		}
    		else if (mnemnonic.length == 2){
    			return funcao(Arrays.copyOfRange(mnemnonic, 1, mnemnonic.length));
    		}
    		else{
    			return funcao(Arrays.copyOfRange(mnemnonic, 3, mnemnonic.length));
    		}
    	}
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 8 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    		
    	String[] tmp = new String[2];
    	tmp = Arrays.copyOfRange(mnemnonic, 1, 3);
    	List<String> lista = new ArrayList<String>();
    	lista =Arrays.asList(tmp);
    	
    	//if ((lista.contains("%A")){
    		
    	//}
    	return null;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
    	if (mnemnonic[0] == "jmp"){
    		return "111";
    	}
    	if (mnemnonic[0] == "je"){
    		return "010";
    	}
    	if (mnemnonic[0] == "jne"){
    		return "101";
    	}
    	if (mnemnonic[0] == "jg"){
    		return "001";
    	}
    	if (mnemnonic[0] == "jge"){
    		return "011";
    	}
    	if (mnemnonic[0] == "jl"){
    		return "100";
    	}
    	if (mnemnonic[0] == "jle"){
    		return "110";
    	}
    	return "000";
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
    	String binary = "";
    	Integer n = Integer.valueOf(symbol);
    	for(int i = 0; i < 15; ++i, n/=2) {
    		switch (n % 2) {
	    		case 0:
	    		binary = "0" + binary;
	    	    break;
	    	    case 1:binary = "1" + binary;
	    	    break;
    		}
    	}
    	return binary;
    }
}
