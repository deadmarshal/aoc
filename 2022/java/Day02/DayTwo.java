// https://adventofcode.com/2022/day/2
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.List;

public class DayTwo {
  public static void main(String[] args) {
    if(args.length == 0){
      System.err.println("No input file provided!");
      System.exit(1);
    }
    if(!Files.exists(Path.of(args[0]))){
      System.err.println("Input file does not exist!");
      System.exit(1);
    }
    List<String> list;
    try{
      list = Files.readAllLines(Path.of(args[0]));
    }catch (IOException e){
      throw new RuntimeException(e);
    }
    System.out.println("Part1: " + part1(list));
    System.out.println("Part2: " + part2(list));
  }

  private static int part1(List<String> list){
    HashMap<String,Integer> points = new HashMap<>(){{
      put("A X",4); put("A Y",8); put("A Z",3);
      put("B X",1); put("B Y",5); put("B Z",9);
      put("C X",7); put("C Y",2); put("C Z",6);}};
    int score = 0;
    for(String s : list) score += points.get(s);
    return score;
  }

  private static int part2(List<String> list){
    HashMap<String,Integer> points = new HashMap<>(){{
      put("A X",3); put("A Y",4); put("A Z",8);
      put("B X",1); put("B Y",5); put("B Z",9);
      put("C X",2); put("C Y",6); put("C Z",7);}};
    int score = 0;
    for(String s : list) score += points.get(s);
    return score;
  }
}
