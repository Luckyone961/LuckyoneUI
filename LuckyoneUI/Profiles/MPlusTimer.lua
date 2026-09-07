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
	local importString = [[TNvxZnQnu0)qD7G(eXJRtI3ntDCYeyBFJPATLTzwm4cYBI7d93ELeyJamgf3Tt32Ppep2iXv6EoN7hsjgehfh(tId3NTkx)13NTytEHyzuEC4d8KSPf8TI4WNfPCzYxf6hh94tZUBQAUhEC1QsHmEU3X3ZAWxTg8JIK1BuFfWId)LKLYnXZriVyzC408IfIYWDPjYs9YlY4FovSm(ZTxYoMeGvgnCdFz(l1pks9q9snhQ)uz47(T980BYtv7PQXaMXuFImZdR)USTpeUFHAZuA)wEN)TMMNPxJx3vOM)l8dn(F1oTAV13qE9mep5m7YEt7X9Y0Kmfpeo7tF4h(JF9Xpfn7(53vTrct(DHAEu9edxWt1)qTHwTk517xKNDjC957)WhTbw4yW6j46Dq4LGHAd7mometbodgmOZFZ(IcrM8P9PPt4f2U9K2RWaSAK4v5(c1k8qswYwEAsPSrJ23I2a5KhJIE8HkY3ALSCOPmiLGHbbEyeXJq8Jx9ocwVfMIjqaK6X8Gi)a)aOEe0PTL6DTndMeacuVVhedOb(06jRmdXJrXag2ds99HuA9cC0mOwMHgqykBeqqukKIdAmJp0NI9WapetTB9zDmdUTt5hqu(fGGPWamYYmeyadrGQ1WNXyGGoofPYmt9ryFpmJPwnQpGIQxnOEFO2dmGpbXaa1ONmTLOq2opJM51KOMDSuQTs60kdxuYwrHMzdNKxSuuuRM0C42DPczsEMfBo0w6OwAkHfWyiiMGaAFI02NRxdhIgSZx2lX6e(IVSUiFF2YwBndoQPaAGNpXOH8RWXZpcAWrWkAf4rX(baaMayeiRYrgoejChFrs2A972GPrUhImLcz(iFgYtrrbOa)gzafr0bgEQrWucd3e2OuTbiae7HWqVacOJqTDyJYzGqpJWMIPi6jZyH7TdrM3n)WrP)qXRN5v0jL2ikLgm52KYDPQKKMSSvv8M0w)oKm9y95UQ0(AJRrH1oN(3JYRgmeEHCW3C38O7E2PAjowKZZIEi0Xl7)(nc(shk04CzXjInjTiIAh66Bq4wbxU5gf9kfMi0bFXWn5VyG8wIuT0v1zvHysHsNiQKWNWlsCOUJJZ0HrN(cgGbRhvBJZ2iXqewFErBcBAu)BREGCMaCql1GWW6fYkKwRPtw8LUYwhmBDUaOzj0nHhkl4sUk0vHiXHzM2YNTFXxoKRPVj5LLctRENV(2qzIF79Wt72dFt0j4crN1ePdE(veCcCOx0)feC(0KJhdZX(1h9yqw52XTLgnD1EgOZbw6A70xTUB5vuMZ4sJcd9pw()3bW)NOaqt99o6So9w4CReMKbwi2FBTnm37hj6fSFwjRhCOvU3z8S175RvWY73lZRYsAA9YbzudZ7tgtXCXBBWs3zfos)RDFdoEXbxBuQd(IZkUpTBjxkEw9Nry9XKLIit3dMwlEsOYdLjnTKmE5d7m(xMsCWd63jtHylx15P6KmF2ISaTUAbhORDQPTW4qtEdyUfUH7XC8vQg20lV2K9LddrgYQJYYlskZZQANB4Ql9l6FvQEVFK111(wFlBVv5SJrlolP15r6HMJMhbETi6)NhrpXpOA5nkppvMStZaQoqdFkVmrFjnXrTQuRdKBDF1DofsZtSas0jMDUU36rtfD2RiAiG)Y0(d8xNjYwB63NowBToaPxlB5gv0w9jp2kzdE4Ekg0yiJDIJXA(Yz30be0nKqnXFwuuQD550Qt619iqoSw2N07zHo(VUuOlBc8BPMODfTwL6AdKTQ1mqqq9949Mkl2Na7xb(BjjkZLCJpyxpwwFQyZ9eh5CcWZKa4wXc9DuvAGt3L0wa6j(qF4SZKfh4ko6ay4mWQVlxHTOO2DDqnczAdC7(S1I8SUzrhjtaEmC7GD(9RccUY0fo446RrnuzBPiZqMsZD2ot8vr6fkK0VdHX))AEOv3eFNLs0W)Y44)8d]]

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
