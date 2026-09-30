local _, Private = ...

local ceil = math.ceil
local ipairs = ipairs
local min = math.min
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

	local color, tileWidth, tileHeight = db.color, layer.tileWidth, layer.tileHeight
	local count = 0

	for _, overlay in ipairs(overlays) do
		if not explored[overlay[5]] then
			local width, height, offsetX, offsetY = overlay[1], overlay[2], overlay[3], overlay[4]
			local columns = ceil(width / tileWidth)

			for row = 1, ceil(height / tileHeight) do
				local pixelHeight = min(tileHeight, height - tileHeight * (row - 1))

				for column = 1, columns do
					local pixelWidth = min(tileWidth, width - tileWidth * (column - 1))

					count = count + 1
					local texture = textures[count]
					if not texture then
						texture = pin:CreateTexture(nil, 'ARTWORK', nil, -1)
						textures[count] = texture
					end

					texture:SetSize(pixelWidth, pixelHeight)
					texture:SetTexCoord(0, pixelWidth / FileSize(pixelWidth), 0, pixelHeight / FileSize(pixelHeight))
					texture:SetPoint('TOPLEFT', offsetX + tileWidth * (column - 1), -(offsetY + tileHeight * (row - 1)))
					texture:SetTexture(overlay[4 + (row - 1) * columns + column], nil, nil, 'TRILINEAR')
					texture:SetVertexColor(color.r, color.g, color.b, db.alpha)
					texture:Show()
				end
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
