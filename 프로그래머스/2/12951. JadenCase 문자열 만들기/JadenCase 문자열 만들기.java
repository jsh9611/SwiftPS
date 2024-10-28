import java.util.*;

class Solution {
    public String solution(String s) {
        String answer = "";
        String[] arr = ("#"+s+"#").split(" ");

        for (int i = 0; i < arr.length; i++){
            if (!arr[i].isEmpty()) {
                answer += arr[i].substring(0, 1).toUpperCase();
                answer += arr[i].substring(1).toLowerCase();
                if(i != arr.length - 1){
                    answer += " ";
                }
            } else {
                answer += arr[i];
                answer += " ";
            }
        }
        answer = answer.replaceAll("#", "");
        String t1 = answer.substring(0, 1).toUpperCase();
        String t2 = answer.substring(1);
        return t1+t2;
    }
}
