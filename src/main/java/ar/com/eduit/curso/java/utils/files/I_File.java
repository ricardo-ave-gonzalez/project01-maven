package ar.com.eduit.curso.java.utils.files;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;
public interface I_File {
    default void print(){ System.out.println(getText()); }
    String getText();
    void setText(String text);
    void appendText(String text);
    default void clear() { setText(""); }
    default void addLine(String line){ appendText(line+"\n"); }
    default void addLines(List<String> lines){ lines.forEach(this::addLine); }
    default List<String>getLines(){ return getStream().collect(Collectors.toList()); }
    default List<String>getLines(String filter){
        if(filter==null) return new ArrayList<String>();
        return getStream()
                .filter(l->l.toLowerCase().contains(filter.toLowerCase()))
                .collect(Collectors.toList());
    }
    Stream<String>getStream();
    default List<String>getSortedLines(){ 
        return getStream().sorted().collect(Collectors.toList()); 
    };
    default List<String>getReversedSortedLines(){
        return getStream().sorted(Comparator.reverseOrder()).collect(Collectors.toList()); 
    }
    default LinkedHashSet<String>getLinkedHashSet(){
        LinkedHashSet<String>set=new LinkedHashSet();
        set.addAll(getLines());
        return set;
    }
    default TreeSet<String>getTreeSet(){
        TreeSet<String>set=new TreeSet();
        set.addAll(getLines());
        return set;
    }
    default void remove(String line){
        List<String>lines=getLines();
        lines.remove(line);
        clear();
        addLines(lines);
    }
}