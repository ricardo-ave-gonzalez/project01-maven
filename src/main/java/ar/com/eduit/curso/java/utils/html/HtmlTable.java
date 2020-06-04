package ar.com.eduit.curso.java.utils.html;

import java.lang.reflect.Field;
import java.util.List;
public class HtmlTable<E>{
    public String getTable(List<E> list){
        if(list==null || list.isEmpty()) return "<table></table>";
        String table="<table>";
        E e=list.get(0);
        Field[] campos=e.getClass().getDeclaredFields();
        table+="<tr>";
        for(Field f:campos) table+="<th>"+f.getName()+"</th>";
        table+="</tr>";
        for(E ee:list){
            table+="<tr>";
            for(Field f:campos){
                table+="<td>";
                String metodo="get"
                        +f.getName().substring(0,1).toUpperCase()
                        +f.getName().substring(1);
                //System.out.println(metodo);
                try{
                    table+=e.getClass().getMethod(metodo, null).invoke(ee, null);
                }catch(Exception ex){
                    ex.printStackTrace();
                }
                table+="</td>";
            }
            table+="</tr>";
        }
        table+="</table>";
        return table;
    }
    public String getTable(List<E> list,String linkRemove,String linkUpdate){
        if(list==null || list.isEmpty()) return "<table></table>";
        String table="<table>";
        E e=list.get(0);
        Field[] campos=e.getClass().getDeclaredFields();
        table+="<tr>";
        for(Field f:campos) table+="<th>"+f.getName()+"</th>";
        table+="<th> Remove </th>";
        table+="<th> Update </th>";
        table+="</tr>";
        for(E ee:list){
            table+="<tr>";
            for(Field f:campos){
                table+="<td>";
                String metodo="get"
                        +f.getName().substring(0,1).toUpperCase()
                        +f.getName().substring(1);
                //System.out.println(metodo);
                try{
                    table+=e.getClass().getMethod(metodo, null).invoke(ee, null);
                }catch(Exception ex){
                    ex.printStackTrace();
                }
                table+="</td>";
            }
            try{
                Object id=e.getClass().getMethod("getId", null).invoke(ee, null);
                System.out.println(id);
                table+="<td> <a href='"+linkRemove+"?id="+id+"'> remove </a> </td>";
                table+="<td> <a href='"+linkUpdate+"?id="+id+"'> update </a> </td>";
            }catch(Exception ex){
                ex.printStackTrace();
            }
            table+="</tr>";
        }
        table+="</table>";
        return table;
    }
}
