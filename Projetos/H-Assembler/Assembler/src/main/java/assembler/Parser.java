/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {
	private static final Object[] String = null;
	public Scanner nasmFile; //Instância Scanner que guarda as linhas do nasm
	public String instruction; //String que representa a linha atual sendo lida

	
    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     */
    public Parser(String file) {
    	//Abre o arquivo e salva em nasmFile
    	try {
			nasmFile = new Scanner(new File(file));
		} catch (FileNotFoundException e) {
			System.out.println("File: {" + file +  "} not found");
			e.printStackTrace();
		}
    }

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() {
    	//Pula as linhas vazias e comentários
    	while(nasmFile.hasNextLine()) {
    		instruction = nasmFile.nextLine().trim();
    		if(instruction.length() == 0 || instruction.charAt(0) == ';') {
    			instruction = nasmFile.nextLine();
    		}
    		else break;
    	}
    	return nasmFile.hasNextLine();
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
    	Integer commentIndex = instruction.indexOf(";");
    	if(commentIndex != -1) {
    		instruction = instruction.substring(0, commentIndex - 1).trim();
    	}
    	else instruction = instruction.trim();
    	
    	return instruction;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {    	
    	//TODO: Entender como usar enumerators
    	if(instruction.contains("leaw")) {
    		return CommandType.A_COMMAND;
    	}
    	else if(instruction.contains(":")) {
    		return CommandType.L_COMMAND;
    	}
    	else {
    		return CommandType.C_COMMAND;
    	}
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command) {
    	int C_index = command.indexOf("$");
    	String symbol = "";
    	C_index++;
    	while(command.charAt(C_index) != ',') {
    		symbol += command.charAt(C_index);
    		C_index++;
    	}
    	
    	return symbol;
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
    	int C_index = 0;
    	String symbol = "";
    	while(command.charAt(C_index) != ':') {
    		symbol += command.charAt(C_index);
    		C_index++;
    	}
    	
    	return symbol;
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contendo os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
    	String cmd;
    	String[] resul = new String[10];
    	cmd = command.replace(","," ");
    	
    	resul = cmd.split(" ");
    	return resul;
    }

}
