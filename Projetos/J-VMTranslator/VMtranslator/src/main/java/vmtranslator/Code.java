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
 * Traduz da linguagem vm para cÃ³digos assembly.
 */
public class Code {

    PrintWriter outputFile = null;  // arquivo .nasm de saÃ­da
    String filename = null;         // arquivo .vm de entrada
    int lineCode = 0;               // Linha do codigo vm que gerou as instrucoes

    /**
     * Abre o arquivo de saida e prepara para escrever
     * @param filename nome do arquivo NASM que receberÃ¡ o cÃ³digo traduzido.
     */
    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para executar o comando aritmÃ©tico.
     * @param  command comando aritmÃ©tico a ser analisado.
     */
    public void writeArithmetic(String command) {

        if ( command.equals("")) {
            Error.error("InstruÃ§Ã£o invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command.equals("add")) {
            commands.add(String.format("; %d - ADD", lineCode++));
            commands.add("leaw $SP,%A");
            commands.add("decw %A");
            commands.add("movw (%A),%S");
            commands.add("decw %A");
            commands.add("movw (%A),%D");
            commands.add("addw $D,%S,%S");
            commands.add("leaw $SP,%A");
            commands.add("leaw $S,(%A)");
            
        } else if (command.equals("sub")) {
            commands.add(String.format("; %d - SUB", lineCode++));
            commands.add("leaw $SP,%A");
            commands.add("decw %A");
            commands.add("movw (%A),%S");
            commands.add("decw %A");
            commands.add("movw (%A),%D");
            commands.add("subw $D,%S,%S");
            commands.add("leaw $SP,%A");
            commands.add("leaw $S,(%A)");
        } else if (command.equals("neg")) {
            commands.add(String.format("; %d - NEG", lineCode++));
            commands.add("leaw $SP,%A");
            commands.add("decw %A");
            commands.add("movw (%A),%S");
            commands.add("negw %S");
            commands.add("leaw $S,(%A)");

        } else if (command.equals("eq")) {
            commands.add(String.format("; %d - EQ", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("subw %D, %S, %D");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %S");
            commands.add("leaw $12, %A");
            commands.add("jne");
            commands.add("nop");
            commands.add("decw %S");
            commands.add("leaw $SP,%A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw %S,(%A)");
        } else if (command.equals("gt")) {
            commands.add(String.format("; %d - GT", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("subw %D, %S, %D");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %S");
            commands.add("leaw $12, %A");
            commands.add("jle");
            commands.add("nop");
            commands.add("decw %S");
            commands.add("leaw $SP,%A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw %S,(%A)");
            
        } else if (command.equals("lt")) {
            commands.add(String.format("; %d - LTy pral leaw de nani stk pointer", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("subw %D, %S, %D");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %S");
            commands.add("leaw $12, %A");
            commands.add("jge");
            commands.add("nop");
            commands.add("decw %S");
            commands.add("leaw $SP,%A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw %S,(%A)");

        } else if (command.equals("and")) {
            commands.add(String.format("; %d - AND", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("andw $D, %S, %D");
            commands.add("movw %D,(%S)");

        } else if (command.equals("or")) {
            commands.add(String.format("; %d - OR", lineCode++));commands.add("leaw $SP, %A");
            commands.add("leaw $SP, %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("orw $D, %S, %D");
            commands.add("movw %D,(%S)");

        } else if (command.equals("not")) {
            commands.add(String.format("; %d - NOT", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("notw %S");
            commands.add("movw %S,(%A)");
            
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para executar o comando de Push ou Pop.
     * @param  command comando de push ou pop a ser analisado.
     * @param  segment segmento de memÃ³ria a ser usado pelo comando.
     * @param  index Ã­ndice do segkento de memÃ³ria a ser usado pelo comando.
     */
    public void writePushPop(Parser.CommandType command, String segment, Integer index) {

        if ( command.equals("")) {
            Error.error("InstruÃ§Ã£o invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command == Parser.CommandType.C_POP) {
            commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                Error.error("NÃ£o faz sentido POP com constant");
            } else if (segment.equals("local")) {
            	
            } else if (segment.equals("argument")) {

            } else if (segment.equals("this")) {

            } else if (segment.equals("that")) {

            } else if (segment.equals("static")) {

            } else if (segment.equals("temp")) {

            } else if (segment.equals("pointer")) {
                if(index==0) {

                } else {

                }
            }
        } else if (command == Parser.CommandType.C_PUSH) {
            commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {

            } else if (segment.equals("local")) {

            } else if (segment.equals("argument")) {

            } else if (segment.equals("this")) {

            } else if (segment.equals("that")) {

            } else if (segment.equals("static")) {

            } else if (segment.equals("temp")) {

            } else if (segment.equals("pointer")) {
                if(index==0) {

                } else {

                }
            }
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para inicializar o processo da VM (bootstrap).
     * TambÃ©m prepara a chamada para a funÃ§Ã£o Sys.init
     * O cÃ³digo deve ser colocado no inÃ­cio do arquivo de saÃ­da.
     */
    public void writeInit(boolean bootstrap, boolean isDir) {

        List<String> commands = new ArrayList<String>();

        if(bootstrap || isDir)
            commands.add( "; InicializaÃ§Ã£o para VM" );

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
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para gerar o labels (marcadores de jump).
     * @param  label define nome do label (marcador) a ser escrito.
     */
    public void writeLabel(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add( "; Label (marcador)" );

    }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para gerar as instruÃ§Ãµes de goto (jumps).
     * Realiza um jump incondicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeGoto(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Incondicional", lineCode++));

    }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para gerar as instruÃ§Ãµes de goto condicional (jumps condicionais).
     * Realiza um jump condicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeIf(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Condicional", lineCode++));

     }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para uma chamada de funÃ§Ã£o (Call).
     * @param  functionName nome da funÃ§Ã£o a ser "chamada" pelo call.
     * @param  numArgs nÃºmero de argumentos a serem passados na funÃ§Ã£o call.
     */
    public void writeCall(String functionName, Integer numArgs) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - chamada de funcao %s", lineCode++, functionName));

    }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para o retorno de uma sub rotina.
     */
    public void writeReturn() {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Retorno de funÃ§Ã£o", lineCode++));

    }

    /**
     * Grava no arquivo de saida as instruÃ§Ãµes em Assembly para a declaraÃ§Ã£o de uma funÃ§Ã£o.
     * @param  functionName nome da funÃ§Ã£o a ser criada.
     * @param  numLocals nÃºmero de argumentos a serem passados na funÃ§Ã£o call.
     */
    public void writeFunction(String functionName, Integer numLocals) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Declarando funÃ§Ã£o %s", lineCode++, functionName));

    }

    /**
     * Armazena o nome do arquivo vm de origem.
     * Usado para definir os dados estÃ¡ticos do cÃ³digo (por arquivo).
     * @param file nome do arquivo sendo tratado.
     */
    public void vmfile(String file) {

        int i = file.lastIndexOf(File.separator);
        int j = file.lastIndexOf('.');
        this.filename = file.substring(i+1,j);

    }

    // grava as instruÃ§Ãµes em Assembly no arquivo de saÃ­da
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
