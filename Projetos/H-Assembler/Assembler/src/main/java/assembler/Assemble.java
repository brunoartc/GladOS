/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;
import java.util.Arrays;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table = new SymbolTable();             // tabela de símbolos (variáveis e marcadores)

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
                                                                 // o arquivo hackfile

    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de Símbolos novos Labels e Endereços ed memórias
     * e atualiza a tabela de símbolos com os endereços.
     *
     * Dependencia : Parser, SymbolTable
     */
    public void fillSymbolTable() throws FileNotFoundException, IOException {
        Parser parse = new Parser(inputFile);
        int linha = 0;
        while (parse.advance()){
        	
            if (parse.commandType(parse.command()) == Parser.CommandType.L_COMMAND){
            	System.out.println(linha);
            	System.out.println(parse.command());
                String label_nova = parse.label(parse.command());
//                System.out.println(label_nova);
                table.addEntry(label_nova, linha);
            }
            else {
            linha ++;
            }
        }
    }

    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parse = new Parser(inputFile);  // abre o arquivo e aponta para o começo

        while (parse.advance()){

            String binario = "";
            String bit_A = "0";
            String ling_maquina = "";
          
            if (parse.commandType(parse.command()) == Parser.CommandType.A_COMMAND){
//               System.out.println(parse.command());
//               System.out.println(parse.symbol(parse.command()));
                if (table.contains(parse.symbol(parse.command()))){
//                	System.out.println(parse.command());
                    binario = Code.toBinary(String.valueOf(table.getAddress(parse.symbol(parse.command()))));
//                  System.out.println(binario);
                    ling_maquina = bit_A + binario;
                    outHACK.write(ling_maquina + "\n");

                }
                else {
                
                String teste =parse.command().replaceAll("leaw","");
                String comando = teste.split(",")[0].substring(1);
//                System.out.println(comando);
                if (comando.contains("R")) {
                	comando = comando.substring(2).replace(" ", "");
                		
                }
                else {
                comando = comando.substring(1).replace(" ", "");
                }
//               System.out.println(comando);
                	
                binario = Code.toBinary(comando);
                ling_maquina = bit_A + binario;
                outHACK.write(ling_maquina + "\n");
                }
                
                }
           
            else if (parse.commandType(parse.command()) == Parser.CommandType.C_COMMAND){
                bit_A = "1";
                if (parse.instruction(parse.command())[0].equals("nop")) {
                	ling_maquina = "1000000000000000";
                }
                else {
                	binario = Code.comp(parse.instruction(parse.command()));
                	String dest = Code.dest(parse.instruction(parse.command()));
                	String jump = Code.jump(parse.instruction(parse.command()));
                	ling_maquina = bit_A + binario + dest + jump;
                }
//                System.out.println(parse.command());
//                System.out.println(ling_maquina);

                outHACK.write(ling_maquina + "\n");
                
            }

        }

    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
//
//
//public static void main(String[] args) throws IOException {
//		Assemble a = new Assemble("add.nasm","teste", true);
//		a.fillSymbolTable();
//		a.generateMachineCode();
//		
//	}}


