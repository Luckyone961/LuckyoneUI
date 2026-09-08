local _, Private = ...
local L = Private.Libs.ACL

-- Retail file
if not Private.isRetail then
	return
end

local _G = _G

-- MPlusTimer profile
function Private:Setup_MPlusTimer(installer)
	if not Private.IsAddOnLoaded('MPlusTimer') then Private:Print('MPlusTimer ' .. L["is not installed or enabled."]) return end

	-- Global db
	local dev = Private.Addon.db.global.dev

	-- Profile name
	local name = (dev and 'Luckyone') or 'Luckyone ' .. Private.Version

	-- Profile string
	local importString = [[TNvxZjUnu0)qD7y9PLFCjjSBMsizI92(MNQfeGN1XMAl2K0h6V9kjBWs2yqHUD62o9HWawYxP75CUFiLuqAsA8pjE92IvL6V((IfBkReltktJVJNvmTI)Kin(rroxM9vH(Xj3)WSBMQM7R3VAvTqMopy)7zn4lwd(rr26nQVcyPX)s2s5M05iuqQmnEAz1crD828mzTE5ff8pNlwM(z3LSNjbyLrJ3Wxw(C7JsupuVuZH6pvg(MFBhp)QYC1EQzmGzm1NiZ8W6VlD9H4DluBMA73k44V10Yc9A8Y2k18FM)AN)3StB2BdnuWadXZoYUCW0UFNmpRqXdXZ(0h(H)4xV)tjZUD(nnBK4SFxOMhvpX4f8C9puBOvRYE52fLfNcxF82p8rBGfEoy9aC9oi8uWqRH9ghgJPahbdg15VAxvLOq(WU88j8kB3EI7kmcRMiErURsTc3LvK9eppRw2PrhArBGCY9jj3Fxd5BTswo0ugKsWWOOamIeqiHPREhbR3ctXeiasdybquyuyeupc6W2s9U2MbtIarQ3paIb0OqA7KvMHeWOyadhaPHHqkTDb2BgKJzOreMYgreeLcP4OoZecdP4amiaXu72qwpZGDDQWiIYVaemfgHrwMHaJyicuTgHmgde1ZPinMzAichgGzm1Qrdbuu7Qb17d1EGbcjigaOg9GPTefs38mAMxtIA2XsP6K0Xjdxs2tIknZgpPSAPOQvnP5WN2MlKzLfwS5yBP9APPeweJHGyccO9jIRp3UgEenyNVCqI1j8fFzDv5UILoBndoQPaAuqiXOHcBWXJpcA0rWkAfeqXHraaMayeiRXrgpejElFrwXA972HPj(hImLczHOqgkqrrrOOWozafr0bgbQrWucd3f2OuTriaehGWWGicONq1nSr5mqyGrytXue9GzSWD3qK59ZpSx6pw86rEfDsPnIAPbtUoREBUkjPjlBtfVjU63XKP7Rp3xLouBCjkm3C6FpkV6Wq4jYbF1nZtU5rVQL4zrUal6HqoFz)3VrWx6rHgVllorSjZHiADOlVbHRfC5MRu0RuyIqh9fJ3u(SbYDePkrxSQZQkXKkLor0iHpGxkis3XXr6WOxFbJWGTJQTXrBKymcBiVOnHnnQ)TvpqEtaEOL6qyy7czfsR10zl(sFzRhMTnxa0Se6MWJLvCjxf6QqK04ctB5Z2T4lVwQPVjL11ctREhV(2yzIF79Wt73dFx0j4erNTePhE(feCc8Ox0)feC(WK9hdZZ(1p7XGSYTJDLgDD1EeOZdw6s70xTUpXBOmVXLofg6FS8)Vd8FJcaD137PZ61BH3TsysgyHy)T12W8GFKOxWHzLSEWRo5ENXlwVJVwblVFNSSjlPP1lpKrDmFi5CkMtEBdw6oRWr6FT7BWZlo4sJs9Wx8wX9PTl5sXJQ)mcRpMTuKy6EW0AXdcvEOcPPLKZx(WPrKtsjE4bd7KPs8ex15P6KmF2ISaoxTGh01w10wyCOjVbm3c3Wdyo(kvdB6LxBYHYHXidzZrz5vz1LfnTZnE1LHf9VivFWpY67AFRVLT3QC2ZOfVL068idqZZMhbEPi6)NhrpXpOA5nPSmxMTvZaQoqJFOSotFjnPjovQ1bYo3xDVtH09elGeDGzNR7T(SPIo6vengWFAA)o(lZefRn97tpxBTEaPxkB5hv4Q(K7BLSdp8pfd6CiJDIJZ18L3UPhiOFiHAI)SOQw7YZPnN0R)rG8yTSpP3JcD8FBPqF2e43snr7kAoL6CbsNAnJee0EpEVPYIdjWHvG)wsIYsj34d21JLTNk2CpXjENa8ijaUwSqFhv1g40))fkwa6b(qF4SJKfh4lo6by4nWQVlxHTOO1D9qn2Ko46DfRfLf9ZIEMmb4ZHBVANF)IGGlmDHhoU(AuJv2wkkmKP0CNTZeFvKFIcjd7qat9hfGF)Ls0W)Y00)8p]]

	-- Profile import
	local API = _G.MPTAPI
	API:ImportProfile(importString, name, true)

	local DB = _G.MPTSV
	if DB then
		-- Additional data which is not part of the profile string
		DB.KeySlot = false -- "Automatic Keyslot"
		DB.LowerKey = false -- "Data from Lower Level"
	end

	Private:Print(L["MPlusTimer profile has been set."], installer)
end
