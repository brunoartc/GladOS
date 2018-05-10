package assembler;

import java.util.ArrayList;
import java.util.Arrays;
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
@@ -17,7 48,20 @@
     */
    public static String dest(String[] mnemnonic) {

    	if (mnemnonic[0] == "movw"){
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
@@ -26,6 70,15 @@ public static String dest(String[] mnemnonic) {
     * @return Opcode (String de 8 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	String alu = null,ab = null;
    	boolean a_reg = false;
    	boolean s_reg = false;
    	String[] tmp = new String[2];
    	if (mnemnonic.length > 2) {
    		tmp = Arrays.copyOfRange(mnemnonic, 0, 3);
    	}
    	
    	else {
    		tmp = Arrays.copyOfRange(mnemnonic, 0, 2);
    	}
    	List<String> lista = new ArrayList<String>();
    	lista =Arrays.asList(tmp);
    	
//    	System.out.println(a_reg);
    	
    	if (lista.get(0) != "movw" & lista.get(0) != "incw" & lista.get(0) != "decw" & lista.get(0) != "notw" & lista.get(0) != "negw" & lista.get(0) != "jmp" & lista.get(0) != "jg" & lista.get(0) != "je" & lista.get(0) != "jge" & lista.get(0) != "jl" & lista.get(0) != "jne" & lista.get(0) != "jle" ) {
	    	if ((lista.contains("%A") & lista.contains("$1")) | (lista.contains("%D") & lista.contains("%1")) | (lista.contains("%D") & lista.contains("%A"))){
	    		if (lista.contains("%A") & lista.contains("$1")) {
	    			a_reg = true;
	    		}
	    		
	    		else if (lista.contains("%D") & lista.contains("$1")) {
	    			s_reg = true;
	    		}
	    		
	    		ab = "00";
	    	
	    	}
	    	
	    	
	    	else if ((lista.contains("$S") & lista.contains("%1")) | (lista.contains("%S") & lista.contains("%A") )) {
	    		if (lista.contains("%A") & lista.contains("$1")) {
	    			a_reg = true;
	    		}
	    		
	    		else if (lista.contains("%S") & lista.contains("$1")) {
	    			s_reg = true;
	    		}
	    		
	    		ab = "01";
	    	}
	    	
	    	else if ((lista.contains("(%A)") & lista.contains("$1")) | (lista.contains("%D") & lista.contains("(%A)"))) {
	    		if (lista.contains("(%A)") & lista.contains("$1")) {
	    			a_reg = true;
	    		}
	    		
	    		
	    		ab = "10";
	    	}
	    	
	    	else if ((lista.contains("%S") & lista.contains("(%A)"))) {
	    		ab = "11";
	    	}
	    	
	    	}
    	
    	else {
			if (lista.get(1) == "%A" ) {
				a_reg= true;
				ab = "00";
			}
			
			else if (lista.get(1)== "%D"){
				s_reg = true;
				ab = "00";
			}
			
			else if (lista.get(1)== "%S"){
				s_reg = true;
				ab = "01";
			}
			
			else {
				a_reg = true;
				ab = "10";
			}
    	}

	  
	    	if (lista.contains("addw")) {
	    		alu = "000010";
	    	}
	    	
	    	
	    	else if (lista.contains("movw")) {
	    		if (lista.get(1) == "%A" | lista.get(1) =="(%A)") {
	    			
	    			alu = "110000";
	    		}
	    		
	    		else if (lista.get(1) == "%D" | lista.get(1)=="%S") {
	    			alu = "001100";
	    		}
	    		
	    	
	    		}
    		
    	
    	
    	else if (lista.contains("subw")) {
    		if (lista.contains("$1")) {
    			alu = "110010";
    		}
    		else {
    		alu = "010011";
    		}
    		
    	}
    	
    	else if (lista.contains("rsubw")) {
    		if (lista.contains("$1")) {
    			alu = "110010";
    		}
    		alu = "000111";
    	}
    	
    	else if (lista.contains("incw")) {
    		if (a_reg == true) {
    			alu = "110111";
    		}
    		
    		else if (s_reg == true){
    			alu = "011111";
    		}
    	
    	}
    	
    	else if (lista.contains("decw")) {
    		if (a_reg == true) {
    			alu = "110010";
    		}
    		
    		else if (s_reg == true){
    			alu = "001110";
    		}
    	
    	}
    	else if (lista.contains("notw")){
    		if (a_reg == true) {
    			alu = "110001";
    		}
    		
    		else if (s_reg == true){
    			alu = "001101";
    		}
    	}
    	
    	else if (lista.contains("negw")){
    		if (a_reg == true) {
    			alu = "110011";
    		}
    		
    		else if (s_reg == true){
    			alu = "001111";
    		}
    	}
    	
    	else if (lista.contains("andw")){
    		alu = "000000";
    	}
    	
    	else if (lista.contains("orw")){
    		alu = "010101";
    	}
	    	
	    
    	else {
    		if (a_reg == true) {
    			alu = "110000";
    		}
    		else if (s_reg == true) {
    			alu = "001100";
    		}
    	}
    	
    	return (ab + alu);
        	
    }


    
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
@@ -44,7 118,17 @@ public static String jump(String[] mnemnonic) {
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
