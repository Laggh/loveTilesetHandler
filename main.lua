function love.load()
    --enable fullscreen
    love.window.setMode(800, 600)
    love.window.setFullscreen(false)
    json = require("json")
    selectedTile = 1
    love.graphics.setDefaultFilter("nearest", "nearest")
    tilesetHandler = require("tilesetHandler")
    tileset = love.graphics.newImage("tiles.png")
    tileWidth = 10
    tileHeight = 10
    tileArray = tilesetHandler.tilesetToArray(tileset, tileWidth, tileHeight)



    mapTable = tilesetHandler.tiledToTable("map.tmj")
    local str = json.encode(mapTable)
    str = str:gsub(":", ":\n")
    str = str:gsub("}", "\n}")
    str = str:gsub("]", "]\n")
    print(str)
end

function love.update(dt)

end

function love.draw()
    love.graphics.draw(tileArray[selectedTile], 200, 200, 0, 10, 10)
    love.graphics.rectangle("line", 200, 200, tileWidth * 10, tileHeight * 10)

    love.graphics.print("Selected tile: " .. selectedTile, 0, 10)
    love.graphics.print("Press left and right to change the selected tile", 0, 20)
    love.graphics.print("Press space to save the tileset", 0, 30)


    local i = selectedTile - 1
    local x = 800-300
    local y = 600-600
    love.graphics.draw(tileset,x,y,0,3,3)


    x = x + (i % 10) * 30
    y = y + math.floor(i / 10) * 30

    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("line",x,y,30,30)
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("fill",30,80,360,360)
    local thisLayer = mapTable.layers[1]
    --print(thisLayer.data2[3][12])
    for ix = 1, thisLayer.width do for iy = 1, thisLayer.height do
        local x = 0
        local y = 50
        x = x + (ix*30)
        y = y + (iy*30)
        local tile = thisLayer.data2[iy][ix]
        if tile ~= 0 then
            local img = tileArray[tile]
            love.graphics.draw(img,x,y,0,3,3)
        end
    end end

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