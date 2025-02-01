local API = {}

function API.tilesetToArray(tileset, tileWidth, tileHeight)
    local tileArray = {}

    local tilesetWidth = tileset:getWidth()
    local tilesetHeight = tileset:getHeight()
    
    local tilesetWidth = tilesetWidth / tileWidth
    local tilesetHeight = tilesetHeight / tileHeight

    local tileCount = 1
    for y = 0, tilesetHeight - 1 do
        for x = 0, tilesetWidth - 1 do
            local newCanvas = love.graphics.newCanvas(tileWidth, tileHeight)
            love.graphics.setCanvas(newCanvas)
            love.graphics.draw(tileset, -x * tileWidth, -y * tileHeight)
            love.graphics.setCanvas()
            tileArray[tileCount] = newCanvas
            tileCount = tileCount + 1
        end
    end
    return tileArray
end

function API.ArrayToTileset(tileArray, tileWidth, tileHeight)
    local tileset = love.graphics.newCanvas(tileWidth * #tileArray, tileHeight)
    love.graphics.setCanvas(tileset)
    for i = 1, #tileArray do
        love.graphics.draw(tileArray[i], (i - 1) * tileWidth, 0)
    end
    love.graphics.setCanvas()
    return tileset
end

return API