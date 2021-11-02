local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- LuckyoneUI Private DB

V.L1UI = {

	install_version = nil,

	disabledFrames = {
		BossBanner = E.Retail and false or nil,
		ZoneTextFrame = false,
		AlertFrame = false,
	},
}
