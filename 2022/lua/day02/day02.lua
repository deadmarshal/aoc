#!/usr/bin/env lua
-- https://adventofcode.com/2022/day/2

if #arg ~= 1 then
  io.stderr:write('Usage: ./day02.lua input.txt')
  os.exit(1)
end

local function part1(file)
  local points,score = {["A X"] = 4, ["A Y"] = 8, ["A Z"] = 3,
                        ["B X"] = 1, ["B Y"] = 5, ["B Z"] = 9,
			["C X"] = 7, ["C Y"] = 2, ["C Z"] = 6},0
  for line in io.lines(file) do
    line = line:gsub('\n$','')
    score = score + points[line]
  end
  return score
end

local function part2(file)
  local points,score = {["A X"] = 3, ["A Y"] = 4, ["A Z"] = 8,
                        ["B X"] = 1, ["B Y"] = 5, ["B Z"] = 9,
			["C X"] = 2, ["C Y"] = 6, ["C Z"] = 7},0
  for line in io.lines(file) do
    line = line:gsub('\n$','')
    score = score + points[line]
  end
  return score
end

print(string.format("Part1: %d", part1(arg[1])))
print(string.format("Part2: %d", part2(arg[1])))

