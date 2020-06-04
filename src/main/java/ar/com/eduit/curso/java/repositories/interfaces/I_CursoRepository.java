package ar.com.eduit.curso.java.repositories.interfaces;
import ar.com.eduit.curso.java.entities.Curso;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
/**
 * 
 * @author Ricardo
 */
public interface I_CursoRepository {
    void save(Curso curso);
    void remove(Curso curso);
    void update(Curso curso);
    default Curso getById(int id){      
        // select * from cursos where id= id;
        return getAll()
                .stream()
                .filter(c->c.getId()==id)
                .findAny()
                .orElse(new Curso());
    }
    List<Curso>getAll();        // select * from cursos;
    //Stream<Curso>getStream();
    default List<Curso>getLikeTitulo(String titulo){
        //select * from cursos where titulo like '%titulo%'
        if(titulo==null) return new ArrayList<Curso>();
        return getAll()
                .stream()
                .filter(c->c.getTitulo().toLowerCase().contains(titulo.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Curso>getLikeTituloAndProfesor(String titulo,String profesor){
        if(titulo==null || profesor==null) return new ArrayList<Curso>();
        return getAll()
                .stream()
                .filter(c->c.getTitulo().toLowerCase().contains(titulo.toLowerCase())
                        && c.getProfesor().toLowerCase().contains(profesor.toLowerCase()))
                .collect(Collectors.toList());
    }
}
