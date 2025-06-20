triangles = {}
boxes = {}

function add_triangle(ax, ay, bx, by, cx, cy)
  table.insert(triangles, ax)
  table.insert(triangles, ay)
  table.insert(triangles, bx)
  table.insert(triangles, by)
  table.insert(triangles, cx)
  table.insert(triangles, cy)
end

function bounding_box(ax, ay, bx, by, cx, cy)
  local lx = math.min(ax, bx, cx)
  local ly = math.min(ay, by, cy)

  local rx = math.max(ax, bx, cx)
  local ry = math.max(ay, by, cy)

  return lx, ly, rx, ry
end

function get_area(ax, ay, bx, by, cx, cy)
  local area = 0.5 * ((ax * (by - cy)) + (bx * (cy - ay)) + (cx * (ay - by)))
  return math.abs(area)
end

function in_triangle(x, y, ax, ay, bx, by, cx, cy)
  local dx = x - cx
  local dy = y - cy

  local dx21 = cx - bx
  local dy12 = by - cy

  local d = dy12 * (ax - cx) + dx21 * (ay - cy)
  local s = dy12 * dx + dx21 * dy
  local t = (cy - ay) * dx + (ax - cx) * dy

  if d < 0 then
    return s <= 0 and t <= 0 and s + t >= d
  end

  return s >= 0 and t >= 0 and s + t <= d
end

function random_triangle()
  local random = love.math.random

  ax = random(0, width)
  ay = random(0, height)

  bx = random(0, width)
  by = random(0, height)

  cx = random(0, width)
  cy = random(0, height)

  return ax, ay, bx, by, cx, cy
end

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  last = os.time()
  for i = 1, 50 do
    add_triangle(random_triangle())
  end
end

function love.draw()
  love.graphics.print(love.timer.getFPS())
  local points = {}
  local i = 1

  while triangles[i] ~= nil do
    local lx, ly, rx, ry = bounding_box(
      triangles[i],
      triangles[i + 1],
      triangles[i + 2],
      triangles[i + 3],
      triangles[i + 4],
      triangles[i + 5]
    )

    for lx = lx, rx + 1 do
      for ty = ly, ry + 1 do
      end
    end

    i = i + 6
  end
end

function love.keypressed(key, unicode)
  if key == "escape" then
    love.event.quit()
  end
end
