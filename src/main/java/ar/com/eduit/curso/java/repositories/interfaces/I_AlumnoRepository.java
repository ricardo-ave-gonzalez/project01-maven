package ar.com.eduit.curso.java.repositories.interfaces;
import ar.com.eduit.curso.java.entities.Alumno;
import ar.com.eduit.curso.java.entities.Curso;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
/**
 * 
 * @author Ricardo
 */
public interface I_AlumnoRepository {
    void save(Alumno alumno);
    void remove(Alumno alumno);
    void update(Alumno alumno);
    default Alumno getById(int id){
        return getAll()
                .stream()
                .filter(a->a.getId()==id)
                .findAny()
                .orElse(new Alumno());
    }
    List<Alumno>getAll();
    default List<Alumno>getLikeApellido(String apellido){
        if(apellido==null) return new ArrayList<Alumno>();
        return getAll()
                .stream()
                .filter(a->a.getApellido().toLowerCase().contains(apellido.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Alumno>getByCurso(Curso curso){
        if(curso==null) return new ArrayList<Alumno>();
        return getAll()
                .stream()
                .filter(a->a.getIdCurso()==curso.getId())
                .collect(Collectors.toList());
    }
}
