-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- Runs after successful profile import
local function CallbackFunction(accepted)
	if not accepted then return end

	-- Handle Minimap icon
	local LDBI = LibStub('LibDBIcon-1.0')
	BigWigsIconDB.hide = true
	LDBI:Hide('BigWigs')
end

-- BigWigs profiles
function Private:Setup_BigWigs(layout)
	if not E:IsAddOnEnabled('BigWigs') then Private:Print('BigWigs ' .. L["is not installed or enabled."]) return end

	-- Profile names
	local name_main = 'Luckyone Main'
	local name_healing = 'Luckyone Healing'

	-- Profile strings
	local profile_main = 'BW1:DnvSUTnsq0JhTrkoKCsYWkxroGKIlaPXWM5StI6ogihBbjlbA6ya3eTKCm5IBj3f7UuYkLQk16tWf5dqFc6lyH(eYNGqktr2LuKg3XIbCMLZBEV3o06RSgPGqGIHrubwIPzIxUcszjvP9C8hoszB9S)8BzuEkIuFqW77EHFxp1Uw)4xwVfK3tjuUysalNZiqNr2hEWBSkIUbK8YcoMWFB7fZbiRSIDr0nCgQQGDWmGqOt7yxC2rbuoklg6uKDCrjhoevMxGOZMTC4sqkXzXIV0GtZLeCgWhELF)ZVO78BPzYlXFgEXAJeVIXaEisaJNFlkcK4uyK9rh48nZHdOz0Weonfsk8Jt1TEbkfUV7DmUEqtrZkGZut12nmbjtwgHfmcAMbPDxA6AyjbunwgZPtVInfXJejZZfaouB1JVpKGeIqJRnUEmgg(kpebhNP29(0hiYIaeV0H)4A9RUOW)vdBEwuVr7C4bhE8)jQTK3z(kF4o5LjOi60Ewww28TL6zRFMxbybaofT(6xBIN8wBtZD1ucj08jQNTP5jaxOV7DCV(iwRq9OLACZQxDApNvTDOSnln)Xsni1xipt97QglGkmhVzcwGdiGlI3hNILpErHO912NN35F4m)fWDSZaCCI8VwzmSQb52V7P(BQb6dAVnNL4A89XZ19CnosM89NWAu)jEGqI4YexdmJ5sTdKZH7hGZW6DASqASIlLZiGxxYKRoNlyOqnPF0QYT(TSyzz2w8dIRgSgUXQNQAVva6uLJ7TycjzDnfmYQjBV)NMno8VPEEIQ5(RQwpn1EkBV6ohKtKygbdC7hGBaDcKSP(oOCVO9cdgfVFslUDRyRwbwR0s7H)UxQ9NQSBcCh67pCGQ)(KFDLr4N(Pr6fyGR25gvFD5(wQbSM1tP6Q8wZnPQjSU(eJ6k0H2f8MqXHWQUzXANnPZZ)N0z)8p'
	local profile_healing = 'BW1:DnvVUTnsqyWWyKIdjwsg2U5k8vKding20NDY5Uqd6FeKSeKPJbCt0sQXKlULCxS7sjRGuPQRw1PYiipa6rq1PyHEe8JGqEaYUKI0iHfd4mlNV577BhA9nwTeqiqrqxQalX0uXFphsyXLPnD870vzB99gpMs5jis1bbN4DPVxp1AwFD9fRa5ekHYfddyzCgboUR9E7(wR8OBajROGJj8p29I4aKwuXop6gogvwWoymqi0rhBNF2(buokncoop7W8soCyqrEoIolxXHRaPeNgj()ACAMKGtbENR9BDXLEtUJMkVc)j4VwyK41mgWdrcO)K7qdajob6AV)UopAoSnnLggZPjqCUFCQU1lrjWdE3Z46bncnohotn1wUHXiz8SbybJGgBqATzMU6uqavTzrC6ORzJq8bI4jzcahQT6(pesqcrOX16xngddFtpebhLQw7HKNiY0aeVWH)Wc9RUOW)tdBw6GMDF(E7U3H)suBj)R5R8H7LxfJgqh10YYYMVQutB9ZKsaZbWjV1doWep6D2MM90ucj08zqtBtZdbUqF374EZ(SgH6rl14MwT6S1ew52HY2S0S9mnivxi)PADvTPqjM9xoelWbeWfXBHtWYxonx0(A7RxVlo7C)PW9SZbCuS81Zngw5GCB5DQ)YkGot7TzSyxJV3FIUNBWdKX)4vSAvFspqirCzSRbM(CP2bY4WdTXPy9onwinwXvYXeONhz41xWfmuOM0VyEXw)kwmRiBf(brLdwdxF12QTwjaDQYX9omHeVOIcgzvNTXVPzJd)hQDIv13CE56PP22SnQ6SDgrIzemWTFcU20Hq8YQ7GI9ITMAWi)9JAWTBez1iWAUwAp939mT)uMDBGBhF)oTvT28l2Znc)0p2vVadC1ZVv1sx(Zpt1MvVAkLxL3zUjv1HfvNyuxUo0UqVHuCim3lns7SXhVZ7tg)Z)'

	-- Profile import
	-- API:ImportProfileString(addonName, profileString, optionalCustomProfileName, optionalCallbackFunction)
	BigWigsAPI:ImportProfileString('LuckyoneUI', (layout == 'main' and profile_main) or profile_healing, (layout == 'main' and name_main) or name_healing, CallbackFunction)

	-- No chat print here
	-- BigWigs will print a message with all important information after the import
end
