/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */

package vmtranslator;

import java.util.*;
import java.io.*;
import java.nio.file.*;

/**
 * Traduz da linguagem vm para códigos assembly.
 */
public class Code {

    PrintWriter outputFile = null;  // arquivo .nasm de saída
    String filename = null;         // arquivo .vm de entrada
    int lineCode = 0;               // Linha do codigo vm que gerou as instrucoes
    int lineCodenasm = 0; 			// Linha de codigo nasm
    
    /**
     * Abre o arquivo de saida e prepara para escrever
     * @param filename nome do arquivo NASM que receberá o código traduzido.
     */
    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando aritmético.
     * @param  command comando aritmético a ser analisado.
     */
    
    public void SPinA(List<String> commands) {
    	commands.add("leaw $SP,%A");
        commands.add("movw (%A),%A");
    }
    public void LAinS(List<String> commands) {
    	commands.add("decw %A");
        commands.add("movw (%A),%S");
    }
    public void LAinD(List<String> commands) {
    	commands.add("decw %A");
        commands.add("movw (%A),%D");
    }
    public void lastTwoInAS(List<String> commands) {
    	SPinA(commands); // A = 258
        LAinS(commands); // S = RAM(257)
        LAinD(commands); // D = RAM(256)
        commands.add("movw %D,%A");
    }
    public void saveSinNEWSP(List<String> commands) {
    	commands.add("leaw $SP,%A");
        commands.add("movw (%A),%A");
        commands.add("decw %A"); // A = 257
        commands.add("movw %A,%D"); // D = A = 257
        commands.add("decw %A"); // A = 256
        commands.add("movw %S,(%A)"); // RAM(256) = S
        //Salva S em RAM 256
        commands.add("leaw $SP,%A"); // A = 0
        commands.add("movw %D,(%A)"); // RAM(0) = 257
    }
    
    public void writeArithmetic(String command) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command.equals("add")) {
//            commands.add(String.format("; %d - ADD", lineCode++));
            lastTwoInAS(commands); // A = stack[-2], S = stack[-1]
            commands.add("addw %A, %S, %S"); // S = A + S = D + S = RAM(256) + RAM(257)
            //Somou e guarda em S
            saveSinNEWSP(commands);
            
            
        } else if (command.equals("sub")) {
//        	commands.add(String.format("; %d - SUB", lineCode++));
        	lastTwoInAS(commands); // A = stack[-2], S = stack[-1]
            commands.add("subw %A, %S, %S"); // S = A + S = D + S = RAM(256) + RAM(257)
            //Somou e guarda em S
            saveSinNEWSP(commands);
            
        } else if (command.equals("neg")) {
//            commands.add(String.format("; %d - NEG", lineCode++));
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%A");
            commands.add("decw %A");
            commands.add("movw (%A),%D");
            commands.add("negw %D");
            commands.add("movw %D,(%A)");

        } else if (command.equals("eq")) {
//            commands.add(String.format("; %d - EQ", lineCode++));
            lastTwoInAS(commands);
            commands.add("subw %A, %S, %D");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %S");
            commands.add("leaw $" + Integer.toString(this.lineCodenasm + commands.size() + 4) + ", %A");
            commands.add("jne %D");
            commands.add("nop");
            commands.add("decw %S");
            commands.add("nop");
            saveSinNEWSP(commands);
        } else if (command.equals("gt")) {
//            commands.add(String.format("; %d - GT", lineCode++));
            lastTwoInAS(commands);
            commands.add("subw %A, %S, %D");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %S");
            commands.add("leaw $" + Integer.toString(this.lineCodenasm + commands.size() + 4) + ", %A");
            commands.add("jle");
            commands.add("nop");
            commands.add("decw %S");
            saveSinNEWSP(commands);
            
        } else if (command.equals("lt")) {
//            commands.add(String.format("; %d - LTy pral leaw de nani stk pointer", lineCode++));
            lastTwoInAS(commands);
            commands.add("subw %A, %S, %D");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %S");
            commands.add("leaw $" + Integer.toString(this.lineCodenasm + commands.size() + 4) + ", %A");
            commands.add("jge");
            commands.add("nop");
            commands.add("decw %S");
            saveSinNEWSP(commands);

        } else if (command.equals("and")) {
//            commands.add(String.format("; %d - AND", lineCode++));
            lastTwoInAS(commands);
            commands.add("andw %A, %S, %S");
            saveSinNEWSP(commands);

        } else if (command.equals("or")) {
//            commands.add(String.format("; %d - OR", lineCode++));commands.add("leaw $SP, %A");
            lastTwoInAS(commands);
            commands.add("orw %A, %S, %S");
            saveSinNEWSP(commands);

        } else if (command.equals("not")) {
//            commands.add(String.format("; %d - NOT", lineCode++));
            lastTwoInAS(commands);
            commands.add("notw %S");
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw %S, (%A)"); 
        }

        
        this.lineCodenasm += commands.size();
        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }
    
    public void subSP(List<String> commands) {
    	commands.add("leaw $SP,%A");
        commands.add("movw (%A),%A");
        commands.add("decw %A"); // A = 257
        commands.add("movw %A,%D"); // D = A = 257
        commands.add("leaw $SP,%A"); // A = 0
        commands.add("movw %D,(%A)"); // RAM(0) = 257
    }
    
    public void incSP(List<String> commands) {
    	commands.add("leaw $SP,%A");
        commands.add("movw (%A),%A");
        commands.add("incw %A"); // A = 257
        commands.add("movw %A,%D"); // D = A = 257
        commands.add("leaw $SP,%A"); // A = 0
        commands.add("movw %D,(%A)"); // RAM(0) = 257
    }

    public void popper(List<String> commands, String memory, Integer idx) {
    	SPinA(commands);
    	LAinS(commands);
    	commands.add("leaw $" + memory + ",%A");
    	commands.add("movw (%A),%A");
    	commands.add("movw %A,%D");
    	commands.add("leaw $" + idx.toString() + ",%A");
    	commands.add("addw %A,%D,%A");
    	commands.add("movw %S,(%A)");
    	subSP(commands);
    }
    
    public void pusher(List<String> commands, String memory, Integer idx) {
    	commands.add("leaw $" + memory + ",%A");
    	if (memory != "R5") {
    		commands.add("movw (%A),%A");
    	}
    	commands.add("movw %A,%D");
    	commands.add("leaw $" + idx.toString() + ",%A");
    	commands.add("addw %A,%D,%A");
    	commands.add("movw (%A),%D");
    	commands.add("leaw $SP,%A");
    	commands.add("movw (%A),%A");
    	commands.add("movw %D,(%A)");
    	commands.add("leaw $SP,%A");
    	commands.add("movw (%A),%A");
    	commands.add("incw %A");
    	commands.add("movw %A,%S");
    	commands.add("leaw $SP,%A");
    	commands.add("movw %S,(%A)");
    }
    
    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando de Push ou Pop.
     * @param  command comando de push ou pop a ser analisado.
     * @param  segment segmento de memória a ser usado pelo comando.
     * @param  index índice do segkento de memória a ser usado pelo comando.
     */
    public void writePushPop(Parser.CommandType command, String segment, Integer index) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();
        
        if(command == Parser.CommandType.C_POP) {
//            commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                Error.error("Não faz sentido POP com constant");
            } else if (segment.equals("local")) {
            	popper(commands,"LCL",index);
            } else if (segment.equals("argument")) {
            	popper(commands,"ARG",index);
            } else if (segment.equals("this")) {
            	popper(commands,"THIS",index);
            } else if (segment.equals("that")) {
            	popper(commands,"THAT",index);
            } else if (segment.equals("static")) {
            	popper(commands,"STATIC",index);
            } else if (segment.equals("temp")) {
            	SPinA(commands);
            	LAinS(commands);
            	commands.add("leaw $5,%A");
            	commands.add("movw %A,%D");
            	commands.add("leaw $" + index.toString() + ",%A");
            	commands.add("addw %A,%D,%A");
            	commands.add("movw %S,(%A)");
            	subSP(commands);
            } else if (segment.equals("pointer")) {
                if(index==0) {
                	SPinA(commands);
                	LAinS(commands);
                	commands.add("leaw $THIS,%A");
                	commands.add("movw %S,(%A)");
                	subSP(commands);
                } else {
                	SPinA(commands);
                	LAinS(commands);
                	commands.add("leaw $THAT,%A");
                	commands.add("movw %S,(%A)");
                	subSP(commands);

                }
            }
        } else if (command == Parser.CommandType.C_PUSH) {
//            commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
//            	incSP(commands);
                commands.add("leaw $" + index.toString() + ",%A");
            	commands.add("movw %A,%D");
            	SPinA(commands);
            	commands.add("movw %D,(%A)");
            	commands.add("incw %A");
            	commands.add("movw %A,%D");
            	commands.add("leaw %SP,%A");
            	commands.add("movw %D,(%A)");
//            	incSP(commands);
            } else if (segment.equals("local")) {
            	pusher(commands, "LCL", index);
            } else if (segment.equals("argument")) {
            	pusher(commands, "ARG", index);
            } else if (segment.equals("this")) {
            	pusher(commands, "THIS", index);
            } else if (segment.equals("that")) {
            	pusher(commands, "THAT", index);
            } else if (segment.equals("static")) {
            	pusher(commands, "STATIC", index);
            } else if (segment.equals("temp")) {
            	pusher(commands, "R5", index);
            } else if (segment.equals("pointer")) {
                if(index==0) {
                	commands.add("leaw $THIS,%A");
                	commands.add("movw (%A),%A");
                	commands.add("movw %A,%D");
                	commands.add("leaw $SP,%A");
                	commands.add("movw (%A),%A");
                	commands.add("movw %D,(%A)");
                	commands.add("leaw $SP,%A");
                	commands.add("movw (%A),%A");
                	commands.add("incw %A");
                	commands.add("movw %A,%S");
                	commands.add("leaw $SP,%A");
                	commands.add("movw %S,(%A)");
                } else {
                	commands.add("leaw $THAT,%A");
                	commands.add("movw (%A),%A");
                	commands.add("movw %A,%D");
                	commands.add("leaw $SP,%A");
                	commands.add("movw (%A),%A");
                	commands.add("movw %D,(%A)");
                	commands.add("leaw $SP,%A");
                	commands.add("movw (%A),%A");
                	commands.add("incw %A");
                	commands.add("movw %A,%S");
                	commands.add("leaw $SP,%A");
                	commands.add("movw %S,(%A)");
                }
            }
        }
        this.lineCodenasm += commands.size();
        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para inicializar o processo da VM (bootstrap).
     * Também prepara a chamada para a função Sys.init
     * O código deve ser colocado no início do arquivo de saída.
     */
    public void writeInit(boolean bootstrap, boolean isDir) {

        List<String> commands = new ArrayList<String>();

        if(bootstrap || isDir)
            commands.add( "; Inicialização para VM" );

        if(bootstrap) {
            commands.add("leaw $256,%A");
            commands.add("movw %A,%D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D,(%A)");
        }

        if(isDir){
            commands.add("leaw $Main.main, %A");
            commands.add("jmp");
            commands.add("nop");
        }

        if(bootstrap || isDir) {
            String[] stringArray = new String[commands.size()];
            commands.toArray(stringArray);
            write(stringArray);
        }
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar o labels (marcadores de jump).
     * @param  label define nome do label (marcador) a ser escrito.
     */
    public void writeLabel(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add( "; Label (marcador)" );

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto (jumps).
     * Realiza um jump incondicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeGoto(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Incondicional", lineCode++));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto condicional (jumps condicionais).
     * Realiza um jump condicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeIf(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Condicional", lineCode++));

     }

    /**
     * Grava no arquivo de saida as instruções em Assembly para uma chamada de função (Call).
     * @param  functionName nome da função a ser "chamada" pelo call.
     * @param  numArgs número de argumentos a serem passados na função call.
     */
    public void writeCall(String functionName, Integer numArgs) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - chamada de funcao %s", lineCode++, functionName));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para o retorno de uma sub rotina.
     */
    public void writeReturn() {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Retorno de função", lineCode++));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para a declaração de uma função.
     * @param  functionName nome da função a ser criada.
     * @param  numLocals número de argumentos a serem passados na função call.
     */
    public void writeFunction(String functionName, Integer numLocals) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Declarando função %s", lineCode++, functionName));

    }

    /**
     * Armazena o nome do arquivo vm de origem.
     * Usado para definir os dados estáticos do código (por arquivo).
     * @param file nome do arquivo sendo tratado.
     */
    public void vmfile(String file) {

        int i = file.lastIndexOf(File.separator);
        int j = file.lastIndexOf('.');
        this.filename = file.substring(i+1,j);

    }

    // grava as instruções em Assembly no arquivo de saída
    public void write(String[] stringArray) {
        // gravando comandos no arquivos
        for (String s: stringArray) {
            this.outputFile.println(s);
        }
    }

    // fecha o arquivo de escrita
    public void close() throws IOException {
        this.outputFile.close();
    }

}
