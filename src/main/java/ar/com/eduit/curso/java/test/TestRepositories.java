package ar.com.eduit.curso.java.test;
import ar.com.eduit.curso.java.connector.Connector;
import ar.com.eduit.curso.java.entities.Alumno;
import ar.com.eduit.curso.java.entities.Curso;
import ar.com.eduit.curso.java.enumerados.Semana;
import ar.com.eduit.curso.java.enumerados.Turno;
import ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository;
import ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository;
import ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository;
import ar.com.eduit.curso.java.repositories.jdbc.CursoRepository;
import java.util.List;
public class TestRepositories {
    public static void main(String[] args) throws Exception {
        I_CursoRepository cr=new CursoRepository(Connector.getConnection());
        
        Curso curso=new Curso("PHP","Lozada",Semana.JUEVES,Turno.MAÑANA);
        cr.save(curso);
        //System.out.println(curso);
        //System.out.println("*************************************************");
        //List<Curso>lista=cr.getAll();
        //for(int a=0;a<lista.size();a++) System.out.println(lista.get(a));
        
        cr.remove(cr.getById(3));
        
        curso=cr.getById(5);
        curso.setTitulo("Javascript");
        cr.update(curso);
        
        cr.getAll().forEach(System.out::println);
        //cr.getLikeTitulo("ja").forEach(System.out::println);
        //cr.getLikeTituloAndProfesor("", "go").forEach(System.out::println);
        System.out.println("*************************************************");
        I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection());
        
        Alumno alumno=new Alumno("Matias","Segovia",26,2);
        //ar.save(alumno);
        //System.out.println(alumno);
        
        ar.remove(ar.getById(3));
        
        alumno=ar.getById(5);
        alumno.setIdCurso(4);
        ar.update(alumno);
        
        ar.getAll().forEach(System.out::println);
        //ar.getLikeApellido("sa").forEach(System.out::println);
        //ar.getByCurso(cr.getById(2)).forEach(System.out::println);
        System.out.println("Esperando 10 segundos.");
        Thread.sleep(10000);
    }
}