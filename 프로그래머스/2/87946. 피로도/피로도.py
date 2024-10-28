from itertools import permutations

def solution(k, dungeons):
    answer = 0
    for case in permutations(dungeons, len(dungeons)):
        cnt = 0
        fatigued = k
        for item in case:
            if fatigued >= item[0]:
                fatigued -= item[1]
                cnt += 1
            else:
                break
        answer = max(answer, cnt)
    return answer