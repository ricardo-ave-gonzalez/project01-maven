package ar.com.eduit.curso.java.utils.files;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.stream.Stream;
public class FileText implements I_File{
    private File file;

    public FileText(File file) {
        this.file = file;
    }
    
    public FileText(String file) {
        this.file = new File(file);
    }
    
    @Override
    public String getText() {
        StringBuilder sb=new StringBuilder();
        int car;
        try (FileReader in=new FileReader(file);){
            while((car=in.read())!=-1){
                sb.append((char)car);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return sb.toString();
    }

    @Override
    public void setText(String text) {
        try (FileWriter out=new FileWriter(file)){
            out.write(text);
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void appendText(String text) {
        try (FileWriter out=new FileWriter(file,true)){
            out.write(text);
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public Stream<String> getStream() {
        try {
            return new BufferedReader(
                    new InputStreamReader(
                            new FileInputStream(file)))
                    .lines();
        } catch (Exception e) { 
            e.printStackTrace(); 
            return new ArrayList<String>().stream();
        }
    }
    
}