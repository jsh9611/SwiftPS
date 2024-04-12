import java.util.*;

class Solution {
    private static int getDataIndex(String info) {
        return switch (info) {
            case "code" -> 0;
            case "date" -> 1;
            case "maximum" -> 2;
            case "remain" -> 3;
            default -> throw new IllegalArgumentException("Invalid sort_by field: " + info);
        };
    }
    
    public int[][] solution(int[][] data, String ext, int val_ext, String sort_by) {
        List<int[]> dataList = new ArrayList<>();

        int extIndex = getDataIndex(ext);
        int sortIndex = getDataIndex(sort_by);

        for (int i = 0; i < data.length; i++) {
            if (data[i][extIndex] > val_ext) { continue; }
            dataList.add(data[i]);
        }

        dataList.sort(($0, $1) ->
            $0[sortIndex]-$1[sortIndex]
        );


        return dataList.toArray(new int[0][]);
    }
}