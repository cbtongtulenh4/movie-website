import com.ocpsoft.pretty.time.PrettyTime;
import com.website.movie.utils.TimeUtil;

import java.time.LocalDateTime;
import java.util.*;

public class test {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 10/04/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    public static void main(String[] args) {
//        List<Integer> t = new ArrayList<>();
//        t.add(5);
//        t.add(1);
//        t.add(2);
//        t.add(3);
//        t.add(4);
//        System.out.println(t.subList(0,4));
        System.out.println(5 / 2);
//        String a= "a, b, vvc,c,f";
//        a = a.replaceAll("\\s+","");
//
//        List<String> arr = new ArrayList<>(
//                Arrays.asList(a.split(","))
//        );
//        System.out.println(arr);


        Set<Integer> abc = new TreeSet<>(Comparator.comparingInt(Integer::intValue));
        List<Integer> intOrder = new ArrayList<>();
        intOrder.add(5);
        intOrder.add(2);
        intOrder.add(7);
        intOrder.add(3);
        intOrder.add(1);
        intOrder.add(4);

        abc.addAll(intOrder);
        System.out.println(Arrays.toString(intOrder.toArray()));
        System.out.println(Arrays.toString(abc.toArray()));



    }

}
