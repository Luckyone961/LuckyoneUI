local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- LuckyoneUI Private DB

if E.Retail then

	V.L1UI = {

		install_version = nil,

		disabledFrames = {
			BossBanner = false,
			ZoneTextFrame = false,
			AlertFrame = false,
		},

	}

elseif E.Classic then

	V.L1UI = {

		install_version = nil,

		disabledFrames = {
			ZoneTextFrame = false,
			AlertFrame = false,
		},

	}

elseif E.TBC then

	V.L1UI = {

		install_version = nil,

		disabledFrames = {
			ZoneTextFrame = false,
			AlertFrame = false,
		},

	}

end
