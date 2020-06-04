package ar.com.eduit.curso.java.repositories.jdbc;
import ar.com.eduit.curso.java.entities.Curso;
import ar.com.eduit.curso.java.enumerados.Semana;
import ar.com.eduit.curso.java.enumerados.Turno;
import ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class CursoRepository implements I_CursoRepository{
    private Connection conn;

    public CursoRepository(Connection conn) {
        this.conn = conn;
    }
    
    @Override
    public void save(Curso curso) {
        if(curso==null) return;
        try(PreparedStatement ps=conn.prepareStatement(
            "insert into cursos (titulo,profesor,dia,turno) values (?,?,?,?)",
            PreparedStatement.RETURN_GENERATED_KEYS
        )){
            ps.setString(1, curso.getTitulo());
            ps.setString(2, curso.getProfesor());
            ps.setString(3, curso.getDia()+"");
            ps.setString(4, curso.getTurno()+"");
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) curso.setId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Curso curso) {
        //delete from cursos where id=curso.getId
        if(curso==null) return;
        try (PreparedStatement ps=conn.prepareStatement("delete from cursos where id=?")) {
            ps.setInt(1, curso.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Curso curso) {
        if(curso==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
            "update cursos set titulo=?, profesor=?, dia=?, turno=? where id=?"
        )) {
            ps.setString(1, curso.getTitulo());
            ps.setString(2, curso.getProfesor());
            ps.setString(3, curso.getDia().toString());
            ps.setString(4, curso.getTurno().toString());
            ps.setInt(5, curso.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Curso> getAll() {
        List<Curso>list=new ArrayList();
        try(ResultSet rs=conn.createStatement().executeQuery("select * from cursos")){
            while(rs.next()){
                list.add(new Curso(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("profesor"),
                        Semana.valueOf(rs.getString("dia")),
                        Turno.valueOf(rs.getString("turno"))
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}