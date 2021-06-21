local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- LuckyoneUI Private DB

if L1UI.Retail then

	V.L1UI = {

		install_version = nil,

		disabledFrames = {
			BossBanner = false,
			ZoneTextFrame = false,
			AlertFrame = false,
		},

		skins = {},

	}

elseif L1UI.Classic then

	V.L1UI = {

		install_version = nil,

		disabledFrames = {
			ZoneTextFrame = false,
			AlertFrame = false,
		},

		skins = {},

	}

elseif L1UI.TBC then

	V.L1UI = {

		install_version = nil,

		disabledFrames = {
			ZoneTextFrame = false,
			AlertFrame = false,
		},

		skins = {},

	}

end
