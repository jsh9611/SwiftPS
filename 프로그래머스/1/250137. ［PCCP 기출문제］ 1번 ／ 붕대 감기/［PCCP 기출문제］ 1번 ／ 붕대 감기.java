class Solution {
    public int solution(int[] bandage, int health, int[][] attacks) {
        int nowHP = health;
        int time = 0;

        for (int i = 0; i < attacks.length; i++) {
            int diff = attacks[i][0] - time - 1;
            time = attacks[i][0];
            
            nowHP += (diff*bandage[1] + diff/bandage[0]*bandage[2]);
            nowHP = Math.min(nowHP, health);
            nowHP -= attacks[i][1];
            
            if (nowHP <= 0) return -1;
                
        }
        
        return nowHP;
    }
}