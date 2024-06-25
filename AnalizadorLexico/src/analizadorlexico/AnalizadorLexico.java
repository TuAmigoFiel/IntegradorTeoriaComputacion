package analizadorlexico;

import java_cup.runtime.*;

public class Main {
    public static void main(String[] args) {
        try {
            if (args.length == 0) {
                System.out.println("Por favor, proporciona el nombre del archivo de entrada.");
                return;
            }
            Lexer lexer = new Lexer(new java.io.FileReader(args[0]));
            parser parser = new parser(lexer);
            parser.parse();
            System.out.println("Análisis completado sin errores.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
