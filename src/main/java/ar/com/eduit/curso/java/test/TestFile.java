package ar.com.eduit.curso.java.test;
import ar.com.eduit.curso.java.utils.files.FileText;
import ar.com.eduit.curso.java.utils.files.I_File;
public class TestFile {
    public static void main(String[] args) {
        String file="texto.txt";
        I_File fText=new FileText(file);
        
        fText.setText("Curso de java 2020.\n");
        fText.appendText("Primavera.\n");
        fText.appendText("Verano.\n");
        fText.appendText("Otoño.\n");
        fText.appendText("Invierno.\n");
        fText.addLine("Lunes");
        fText.addLine("Martes");
        fText.addLine("Miércoles");
        fText.addLine("Jueves");
        fText.addLine("Viernes");
        fText.addLine("Sábado");
        fText.addLine("Domingo");
        fText.addLine("Jueves");
        fText.addLine("Viernes");
        fText.addLine("Sábado");
        fText.addLine("Domingo");
        fText.addLine("Lunes");
        fText.addLine("Lunes");
        fText.addLine("Lunes");
        fText.addLine("Lunes");
        //System.out.println(fText.getText());
        //fText.print();
        
        fText.remove("Invierno.");
        
        fText.getLines().forEach(System.out::println);
        //fText.getSortedLines().forEach(System.out::println);
        //fText.getReversedSortedLines().forEach(System.out::println);
        //fText.getLines("lu").forEach(System.out::println);
        //fText.getLinkedHashSet().forEach(System.out::println);
        //fText.getTreeSet().forEach(System.out::println);
        
    }
}
