local io = require "io"

function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local file = 'exemplary_input.txt'
local lines = lines_from(file)

local score = 0

for index,game in pairs(lines) do
  print('game: ', game)
  if (game == 'A X' or game == 'B Y' or game == 'C Z') then
    print('draw')
    score = score + 3
  end
  if (game == 'A Y' or game == 'B Z' or game == 'C Y') then
    print('win')
    score = score + 6
  end
  if (string.match(game, 'X')) then
    score = score +1
  end
  if (string.match(game, 'Y')) then
    score = score + 2
  end
  if (string.match(game, 'Z')) then
    score = score + 3
  end
end

print('score: ', score)
