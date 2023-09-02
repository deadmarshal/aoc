// https://adventofcode.com/2022/day/1
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class DayOne {
  public static void main(String[] args) {
    if(args.length == 0) {
      System.err.println("No input file provided!");
      System.exit(1);
    }
    if(!Files.exists(Path.of(args[0]))){
      System.err.println("Input file does not exist!");
      System.exit(1);
    }
    List<String> list;
    try {
      list = Files.readAllLines(Path.of(args[0]));
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
    System.out.println("Part1: " + part1(list));
    System.out.println("Part2: " + part2(list));
  }

  private static int part1(List<String> list){
    int sum = 0,total = 0;
    for(String s : list){
      if(s.isEmpty()){
        total = Math.max(sum,total);
        sum = 0;
        continue;
      }
      sum += Integer.parseInt(s);
    }
    return total;
  }

  private static int part2(List<String> list){
    ArrayList<Integer> ret = new ArrayList<>();
    int sum = 0;
    for(String s : list){
      if(s.isEmpty()){
        ret.add(sum);
        sum = 0;
        continue;
      }
      sum += Integer.parseInt(s);
    }
    ret.sort(Comparator.reverseOrder());
    return ret.subList(0,3).stream().mapToInt(i -> i).sum();
  }
}
