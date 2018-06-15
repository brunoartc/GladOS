/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 *
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */
package vmtranslator;

import java.io.*;
import java.util.Scanner;

//import assembler.Parser.CommandType;

/**
 * Encapsula o cÃ³digo de leitura. Carrega as instruÃ§Ãµes na linguagem de mÃ¡quina virtual a pilha,
 * analisa, e oferece acesso aos comandos.
 * AlÃ©m disso, remove todos os espaÃ§os em branco e comentÃ¡rios.
 */
public class Parser {

    public String currentCommand = "";  // comando atual
    private Scanner fileReader;  // leitor de arquivo

    /** Enumerator para os tipos de comandos de Linguagem de MÃ¡quina Virtua a Pilha. */
    public static enum CommandType {
        C_ARITHMETIC,      // comandos aritmÃ©ticos
        C_PUSH,            // comandos de push
        C_POP,             // comandos de pop
        C_LABEL,           // label
        C_GOTO,            // comando goto
        C_IF,              // comando if-goto
        C_FUNCTION,        // declaracao de funcao
        C_RETURN,          // retorno de funcao
        C_CALL             // chamada de funcao
    }

    /**
     * Abre o arquivo de entrada VM e se prepara para analisÃ¡-lo.
     * @param file arquivo VM que serÃ¡ feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
//        this.fileReader = new BufferedReader(new FileReader(file));
    	try {
			fileReader = new Scanner(new File(file));
		} catch (FileNotFoundException e) {
			System.out.println("File: {" + file +  "} not found");
			e.printStackTrace();
		}
    }

    /**
     * Carrega um comando e avanÃ§a seu apontador interno para o prÃ³xima
     * linha do arquivo de entrada. Caso nÃ£o haja mais linhas no arquivo de
     * entrada o mÃ©todo retorna "Falso", senÃ£o retorna "Verdadeiro".
     * @return Verdadeiro se ainda hÃ¡ instruÃ§Ãµes, Falso se as instruÃ§Ãµes terminaram.
     */
    public Boolean advance() throws IOException {
    	
    	Boolean hasline = fileReader.hasNextLine();
    	
    	if (hasline) {
    		currentCommand = fileReader.nextLine().trim();
    	}
    	
    	while ((currentCommand.length() == 0 || (currentCommand.charAt(0) == '/' && currentCommand.charAt(1) == '/'))) {
    		hasline = fileReader.hasNextLine();
    		if (hasline) {
    			currentCommand = fileReader.nextLine().trim();
    		} 
    		else break;
    	}
    	
    	return hasline;
    }

    /**
     * Retorna o comando "intruÃ§Ã£o" atual (sem o avanÃ§o)
     * @return a instruÃ§Ã£o atual para ser analilisada
     */
    public String command() {
      return currentCommand;
    }

    /**
     * Retorna o tipo da instruÃ§Ã£o passada no argumento:
     *  C_PUSH para push, por exemplo push constant 1
     *  C_POP para pop, por exemplo pop constant 2
     * @param  command instruÃ§Ã£o a ser analisada.
     * @return o tipo da instruÃ§Ã£o.
     */
    public CommandType commandType(String command) {
    	if(command.contains("push")) {
    		return CommandType.C_PUSH;
    	} else if (command.contains("pop")) {
    		return CommandType.C_POP;
    	} else if (command.contains("add") || command.contains("neg") || command.contains("sub") || command.contains("eq") || command.contains("gt") || command.contains("lt") || command.contains("and") || command.contains("or")) {
    		return CommandType.C_ARITHMETIC;
    	} else if (command.contains("label")) {
    		return CommandType.C_LABEL;
    	} else if (command.contains("if-goto")) {
    		return CommandType.C_IF;
    	} else if (command.contains("goto")) {
    		return CommandType.C_GOTO;
    	} else if (command.contains("function")) {
    		return CommandType.C_FUNCTION;
    	} else if (command.contains("return")) {
    		return CommandType.C_RETURN;
    	} else {
    		return CommandType.C_CALL;
    	}
    	
//        C_ARITHMETIC,      // comandos aritmÃ©ticos
//        C_PUSH,            // comandos de push
//        C_POP,             // comandos de pop
//        C_LABEL,           // label
//        C_GOTO,            // comando goto
//        C_IF,              // comando if-goto
//        C_FUNCTION,        // declaracao de funcao
//        C_RETURN,          // retorno de funcao
//        C_CALL 
    }


    /**
     * Retorna o primeiro argumento de um comando push ou pop passada no argumento.
     * Se for um comando aritmÃ©tico, retorna o prÃ³prio texto do comando
     * Deve ser chamado somente quando commandType() Ã© diferente de C_RETURN.
     * @param  command instruÃ§Ã£o a ser analisada.
     * @return somente o sÃ­mbolo ou o valor nÃºmero da instruÃ§Ã£o.
     */
    public String arg1(String command) {
    	String[] resul = command.split(" ");
    	if (resul.length > 1) {
    		return resul[1];
    	} else {
    		return command;
    	}
    }

    /**
     * Retorna o segundo argumento de um comando push ou pop passada no argumento.
     * Deve ser chamado somente quando commandType() Ã© C_PUSH, C_POP, C_FUNCTION, ou C_CALL.
     * @param  command instruÃ§Ã£o a ser analisada.
     * @return o sÃ­mbolo da instruÃ§Ã£o (sem os dois pontos).
     */
    public Integer arg2(String command) {
    	String[] resul = command.split(" ");
//    	System.out.println(resul.length);
    	if (resul.length > 1) {
    		return Integer.parseInt(resul[2]);
    	} else {
    		return null;
    	}
    }

    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }

}
