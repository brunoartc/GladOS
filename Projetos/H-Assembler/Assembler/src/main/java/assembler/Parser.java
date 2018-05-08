/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 * Encapsula o c�digo de leitura. Carrega as instru��es na linguagem assembly,
 * analisa, e oferece acesso as partes da instru��o  (campos e s�mbolos).
 * Al�m disso, remove todos os espa�os em branco e coment�rios.
 */
public class Parser {
	private static final Object[] String = null;
	public Scanner nasmFile; //Inst�ncia Scanner que guarda as linhas do nasm
	public String instruction; //String que representa a linha atual sendo lida

	
    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (s�mbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analis�-lo.
     * @param file arquivo NASM que ser� feito o parser.
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
     * Carrega uma instru��o e avan�a seu apontador interno para o pr�xima
     * linha do arquivo de entrada. Caso n�o haja mais linhas no arquivo de
     * entrada o m�todo retorna "Falso", sen�o retorna "Verdadeiro".
     * @return Verdadeiro se ainda h� instru��es, Falso se as instru��es terminaram.
     */
    public Boolean advance() {
    	//Pula as linhas vazias e coment�rios
    	Boolean next = nasmFile.hasNextLine();
    	while(nasmFile.hasNextLine()) {
    		instruction = nasmFile.nextLine().trim();
    		if(instruction.length() == 0 || instruction.charAt(0) == ';'){
    			instruction = nasmFile.nextLine();
    			if(instruction.length() != 0 && instruction.charAt(0) != ';'){
    				break;
    			}    			
    		}
    		else break;
    	}
    	return next;
    }

    /**
     * Retorna o comando "intru��o" atual (sem o avan�o)
     * @return a instru��o atual para ser analilisada
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
     * Retorna o tipo da instru��o passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz � um s�mbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instru��o a ser analisada.
     * @return o tipo da instru��o.
     */
    public CommandType commandType(String command) {    	
    	//TODO: Entender como usar enumerators
    	if(command.contains("leaw")) {
    		return CommandType.A_COMMAND;
    	}
    	else if(command.contains(":")) {
    		return CommandType.L_COMMAND;
    	}
    	else {
    		return CommandType.C_COMMAND;
    	}
    }

    /**
     * Retorna o s�mbolo ou valor num�rico da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � A_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return somente o s�mbolo ou o valor n�mero da instru��o.
     */
    public String symbol(String command) {
    	int C_index = command.indexOf("$");
    	//TODO:Atualizar para "leaw %D,%A" 
    	String symbol = "";
    	C_index++;
    	while(command.charAt(C_index) != ',') {
    		symbol += command.charAt(C_index);
    		C_index++;
    	}
    	
    	return symbol;
    }

    /**
     * Retorna o s�mbolo da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � L_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return o s�mbolo da instru��o (sem os dois pontos).
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
     * Separa os mnem�nicos da instru��o fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () � C_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return um vetor de string contendo os tokens da instru��o (as partes do comando).
     */
    public String[] instruction(String command) {
    	String cmd;
    	String[] resul = new String[10];
    	cmd = command.replace(","," ");
    	
    	resul = cmd.split(" ");
    	return resul;
    }

}
