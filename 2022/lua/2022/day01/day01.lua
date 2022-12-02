#!/usr/bin/env lua
-- https://adventofcode.com/2022/day/1

if #arg ~= 1 then
  io.stderr:write('Usage: ./day02.lua input.txt')
  os.exit(1)
end

local function part1(file)
  local max = function(t)
    local mx = t[1]
    for i=2,#t do
      if mx < t[i] then mx = t[i] end
    end
    return mx
  end
  local sum,ret = 0,{}
  for line in io.lines(file) do
    if not line:match('^$') then
      sum = sum + tonumber(line)
    else
      ret[#ret+1] = sum
      sum = 0
    end
  end
  return max(ret)
end

local function part2(file)
  local sum,ret = 0,{}
  for line in io.lines(file) do
    if not line:match('^$') then
      sum = sum + tonumber(line)
    else
      ret[#ret+1] = sum
      sum = 0
    end
  end
  table.sort(ret,function(a,b) return a > b end)
  return ret[1] + ret[2] + ret[3]
end

print(string.format("Part1: %d", part1(arg[1])))
print(string.format("Part2: %d", part2(arg[1])))

