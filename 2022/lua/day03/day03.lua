#!/usr/bin/env lua
-- https://adventofcode.com/2022/day/3

if #arg ~= 1 then
  io.stderr:write('Usage: ./day02.lua input.txt')
  os.exit(1)
end

local function intersection(t1, t2)
  local lookup,common,n = {},{},0
  for k,v in pairs(t1) do lookup[v] = true end
  for k,v in pairs(t2) do 
    if lookup[v] then 
      lookup[v] = false
      n = n + 1
      common[n] = v
    end
  end
  return common
end

local function stot(str)
  local t = {}
  str:gsub(".",function(c) table.insert(t,c) end)
  return t
end

local function part1(file)
  local sum,i,priorities,t = 0,1,{},{}
  for j=97,122 do
    priorities[string.char(j)] = i
    i = i + 1
  end
  for j=65,90 do
    priorities[string.char(j)] = i
    i = i + 1
  end
  for line in io.lines(file) do
    t[#t+1] = {stot(line:sub(1,#line/2)),
	       stot(line:sub(#line/2+1,#line))}
  end
  for i=1, #t do
    sum = sum + priorities[intersection(t[i][1],t[i][2])[1]]
  end
  return sum
end

local function part2(file)
  local sum,i,priorities,t,lines = 0,1,{},{},{}
    for j=97,122 do
    priorities[string.char(j)] = i
    i = i + 1
  end
  for j=65,90 do
    priorities[string.char(j)] = i
    i = i + 1
  end
  for line in io.lines(file) do lines[#lines+1] = line end
  for i=1,#lines,3 do
    local commons = intersection(intersection(stot(lines[i]),
					      stot(lines[i+1])),
				 stot(lines[i+2]))
    sum = sum + priorities[commons[1]]
  end
  return sum
end

print(string.format("Part1: %d\n",part1(arg[1])))
print(string.format("Part2: %d\n",part2(arg[1])))

