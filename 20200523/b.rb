require 'set'

n = gets.to_i
p_order = gets.split(' ').map{|p| p.to_i} #.each_slice(n).to_a

nums = 1..(n**2)

ps2 = nums.each_slice(n).to_a
p_map = {}

for num in nums
  p_map[num] = {}
end

for i in 0..(n-1)
  for j in 0..(n-1)
    num = ps2[i][j]

    if i-1 >= 0
      p_map[num][ps2[i-1][j]] = 1
    end
    if i+1 < n
      p_map[num][ps2[i+1][j]] = 1
    end
    if j-1 >= 0
      p_map[num][ps2[i][j-1]] = 1
    end
    if j+1 < n
      p_map[num][ps2[i][j+1]] = 1
    end
  end
end

out = -1
emp = 0

goals = [1, n, n**2-(n-1), n**2]
for g in goals
  p_map[g][out] = 0
end

# map arranged
p p_map

bingo = Set.new(nums)
hate_count = 0

def to_cost c
  if c > 0
    1
  else
    0
  end
end

def dijkstra(graph, start)
  h = graph.map {|x| [x[0], x[1].keys]}.to_h

  shortest = Hash.new(Float::INFINITY)    #デフォルトは充分大きな数
  pred = {}
  done = h.keys.map {|node| [node, false]}.to_h

  shortest[start] = 0

  loop do
    #確定していない中でスタート地点から最短のノードを探す（u）
    u = nil
    h.each_key.reject {|node| done[node]}.each do |node|
      u = node if !u or shortest[node] < shortest[u]
    end
    break unless u
    done[u] = true    #探されたuは確定

    #ノードuから行けるノードvまで、スタート地点からuを経由した方が短ければshortest[v]を更新する
    h[u].each do |v|
      if (a = shortest[u] + graph[u][v]) < shortest[v]
        shortest[v] = a
        pred[v] = u
      end
    end
  end

  [shortest, pred]
end

for ord in p_order
  start = ord

  if p_map[start].keys.include?(out)
    next
  end

  for goal in goals
    dij = dijkstra(p_map, start)[1]

    key = goal
    while dij[key] == start
      
      key = dij[key]
    end
  end

end
