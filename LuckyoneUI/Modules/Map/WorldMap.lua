local _, Private = ...

local ceil = math.ceil
local floor = math.floor
local gmatch = string.gmatch
local ipairs = ipairs
local min = math.min
local tonumber = tonumber
local wipe = wipe

local GetExploredMapTextures = C_MapExplorationInfo.GetExploredMapTextures
local GetMapArtID = C_Map.GetMapArtID
local GetMapArtLayers = C_Map.GetMapArtLayers
local hooksecurefunc = hooksecurefunc

local _G = _G
local WorldMapFrame = _G.WorldMapFrame

local pin
local textures = {} -- Reused for every map
local explored = {} -- First tile of every overlay

-- Tile files are the next power of two from 16 up, the last row and column hold the remainder
local function FileSize(pixels)
	local size = 16
	while size < pixels do
		size = size * 2
	end

	return size
end

local function RevealOverlays()
	for _, texture in ipairs(textures) do
		texture:Hide()
	end

	-- A hidden map redraws on show, its zoom levels may not exist before the first one
	if not WorldMapFrame:IsVisible() then return end

	local db = Private.Addon.db.profile.map.worldMap.fog
	local mapID = WorldMapFrame:GetMapID()
	local overlays = db.enable and Private.WorldMapOverlays[GetMapArtID(mapID)]
	local layers = overlays and GetMapArtLayers(mapID)
	local layer = layers and layers[WorldMapFrame:GetCanvasContainer():GetCurrentLayerIndex()]
	if not layer then return end

	wipe(explored)
	for _, info in ipairs(GetExploredMapTextures(mapID) or {}) do
		if info.fileDataIDs[1] then
			explored[info.fileDataIDs[1]] = true
		end
	end

	local r, g, b, alpha = db.color.r, db.color.g, db.color.b, db.alpha
	local tileWidth, tileHeight = layer.tileWidth, layer.tileHeight
	local count = 0

	-- Every line of the art string is one overlay: width, height, offsetX, offsetY and its tile files row by row
	for width, height, offsetX, offsetY, files, firstFile in gmatch(overlays, '(%d+),(%d+),(%d+),(%d+),((%d+)[%d,]*)') do
		if not explored[tonumber(firstFile)] then
			width, height, offsetX, offsetY = tonumber(width), tonumber(height), tonumber(offsetX), tonumber(offsetY)
			local columns, index = ceil(width / tileWidth), 0

			for file in gmatch(files, '%d+') do
				local row, column = floor(index / columns), index % columns
				local pixelWidth = min(tileWidth, width - tileWidth * column)
				local pixelHeight = min(tileHeight, height - tileHeight * row)
				index = index + 1

				count = count + 1
				local texture = textures[count]
				if not texture then
					texture = pin:CreateTexture(nil, 'ARTWORK', nil, -1)
					textures[count] = texture
				end

				texture:SetSize(pixelWidth, pixelHeight)
				texture:SetTexCoord(0, pixelWidth / FileSize(pixelWidth), 0, pixelHeight / FileSize(pixelHeight))
				texture:SetPoint('TOPLEFT', offsetX + tileWidth * column, -(offsetY + tileHeight * row))
				texture:SetTexture(tonumber(file), nil, nil, 'TRILINEAR')
				texture:SetVertexColor(r, g, b, alpha)
				texture:Show()
			end
		end
	end
end

function Private:WorldMap()
	if not pin then
		if not Private.Addon.db.profile.map.worldMap.fog.enable then return end

		for explorationPin in WorldMapFrame:EnumeratePinsByTemplate('MapExplorationPinTemplate') do
			pin = explorationPin
		end

		hooksecurefunc(pin, 'RefreshOverlays', RevealOverlays)
	end

	RevealOverlays()
end
