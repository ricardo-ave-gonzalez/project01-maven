package ar.com.eduit.curso.java.test;

import ar.com.eduit.curso.java.connector.Connector;
import ar.com.eduit.curso.java.entities.Curso;
import ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository;
import ar.com.eduit.curso.java.repositories.jdbc.CursoRepository;
import ar.com.eduit.curso.java.utils.files.FileText;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.List;

public class TestJson {
    public static void main(String[] args) {
        I_CursoRepository cr=new CursoRepository(Connector.getConnection());
        
        Curso curso=cr.getById(5);
        //System.out.println(curso);
        Gson gson=new Gson();
        
        //String json=gson.toJson(curso);
        //System.out.println(json);
        
        String listaJson=gson.toJson(cr.getAll());
        System.out.println(listaJson);
        new FileText("cursos.txt").setText(listaJson);
        System.out.println("*************************************************");
        Type listType = new TypeToken<List<Curso>>(){}.getType();
        List<Curso>list=gson.fromJson(new FileText("cursos.txt").getText(),listType);
        list.forEach(System.out::println);
    }
}