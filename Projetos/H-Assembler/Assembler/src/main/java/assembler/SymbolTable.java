/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;

import java.util.HashMap;
import java.util.Map;

/**
 * Mantém uma tabela com a correspondência entre os rótulos simbólicos e endereços numéricos de memória.
 */
public class SymbolTable<K, V> {
	
	Map<String, Integer> dicio = new HashMap();
	
    /**
     * Cria a tabela de símbolos.
     */
    public SymbolTable() {
    	    	
		for (int i=0; i<16; i++){
    		dicio.put("R"+Integer.toString(i), new Integer(i));
    	}
    	dicio.put("SP", 0);
    	dicio.put("SP", new Integer(0));
    	dicio.put("LCL", new Integer(1));
    	dicio.put("ARG", new Integer(2));
    	dicio.put("THIS", new Integer(3));
    	dicio.put("THAT", new Integer(4));
    	dicio.put("SCREEN", new Integer(16384));
    	dicio.put("LED", new Integer(21184));
    	dicio.put("SW", new Integer(21185));
    }

    /**
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {
    	dicio.put(symbol, address);
    }

    /**
     * Confere se o símbolo informado já foi inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return Verdadeiro se símbolo está na tabela de símbolos, Falso se não está na tabela de símbolos.
     */
    public Boolean contains(String symbol) {
    	return dicio.containsKey(symbol);
    }

    /**
     * Retorna o valor númerico associado a um símbolo já inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return valor numérico associado ao símbolo procurado.
     */
    public Integer getAddress(String symbol) {    		
    	return dicio.get(symbol);
    }

}
