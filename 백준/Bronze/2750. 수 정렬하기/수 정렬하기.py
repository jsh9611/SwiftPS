import heapq

n = int(input())
heap = []

for i in range(0, n):
    heapq.heappush(heap, int(input()))

for i in range(0, n):
    print(heapq.heappop(heap))