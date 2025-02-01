function love.load()
    selectedTile = 1
    love.graphics.setDefaultFilter("nearest", "nearest")
    tilesetHandler = require("tilesetHandler")
    tileset = love.graphics.newImage("tiles.png")
    tileWidth = 10
    tileHeight = 10
    tileArray = tilesetHandler.tilesetToArray(tileset, tileWidth, tileHeight)
end

function love.update(dt)

end

function love.draw()
    love.graphics.draw(tileArray[selectedTile], 200, 200, 0, 10, 10)
    love.graphics.rectangle("line", 200, 200, tileWidth * 10, tileHeight * 10)

    love.graphics.print("Selected tile: " .. selectedTile, 0, 10)
    love.graphics.print("Press left and right to change the selected tile", 0, 20)
    love.graphics.print("Press space to save the tileset", 0, 30)

    love.graphics.draw(tileset,800-300,600-300,0,3,3)
    local i = selectedTile - 1
    local x = 800-300
    local y = 600-300

    x = x + (i % 10) * 30
    y = y + math.floor(i / 10) * 30

    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("line",x,y,30,30)
    love.graphics.setColor(1, 1, 1, 1)

end
function love.keypressed(key)
    if key == "right" then
        selectedTile = selectedTile + 1
        if selectedTile > #tileArray then
            selectedTile = 1
        end
    end
    if key == "left" then
        selectedTile = selectedTile - 1
        if selectedTile < 1 then
            selectedTile = #tileArray
        end
    end
    if key == "up" then
        selectedTile = selectedTile - 10
        if selectedTile < 1 then
            selectedTile = 100 + selectedTile
        end
    end
    if key == "down" then
        selectedTile = selectedTile + 10
        if selectedTile > 100 then
            selectedTile = selectedTile - 100
        end
    end

end