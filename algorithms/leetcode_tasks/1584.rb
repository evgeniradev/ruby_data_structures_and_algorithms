# 1584 - Min Cost to Connect All Points

# You are given an array points representing integer coordinates of some points on a 2D-plane, where points[i] = [xi, yi].

# The cost of connecting two points [xi, yi] and [xj, yj] is the manhattan distance between them: |xi - xj| + |yi - yj|, where |val| denotes the absolute value of val.

# Return the minimum cost to make all points connected. All points are connected if there is exactly one simple path between any two points.

# Example:
# Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
# Output: 20

# Solution: Prim's algorithm

def min_cost_connect_points(points)
  total = 0
  visited = [true] + [false] * (points.length - 1)
  min_costs = {}
  current_id = 0

  (points.length - 1).times do
    min = nil
    next_id = nil
    points.each_with_index do |point, index|
      next if visited[index]

      new_min = manhattan_distance(points[current_id], points[index])

      if !min_costs[index] || min_costs[index] > new_min
        min_costs[index] = new_min
      else
        new_min = min_costs[index]
      end

      if !min || new_min < min
        min = min_costs[index] < new_min  ? min_costs[index] : new_min
        next_id = index
      end
    end

    total += min
    visited[next_id] = true
    current_id = next_id
  end

  total
end

def manhattan_distance(point1, point2)
  x1 = point1[0]
  y1 = point1[1]

  x2 = point2[0]
  y2 = point2[1]

  ((x1 - x2).abs + (y1 - y2).abs)
end
