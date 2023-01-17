n = int(input())
graph = [list(map(int,input().split())) for _ in range(n)]
INF = int(1e9)
dp = [[0]*(1<<n) for _ in range(n)]

def tsp(x,visited):
    if dp[x][visited]:
        return dp[x][visited]

    if visited == (1<<n)-1:
        if graph[x][0]:
            return graph[x][0]
        else:
            return INF

    dp[x][visited] = INF
    for i in range(1,n):
        if not graph[x][i]:
            continue
        if visited & (1 << i):
            continue

        dp[x][visited] = min(dp[x][visited], tsp(i, visited | (1 << i)) + graph[x][i])
    return dp[x][visited]

print(tsp(0,1))