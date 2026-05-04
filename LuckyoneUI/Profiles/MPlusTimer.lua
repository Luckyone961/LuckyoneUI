-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Global environment
local _G = _G

-- MPlusTimer profile
function Private:Setup_MPlusTimer(installer)
	if not Private.IsAddOnLoaded('MPlusTimer') then Private:Print('MPlusTimer ' .. L["is not installed or enabled."]) return end

	-- Global db
	local dev = Private.Addon.db.global.dev

	-- Profile name
	local name = (dev and 'Luckyone') or 'Luckyone ' .. Private.Version

	-- Profile string
	local importString = [[LNvxVnQoq0FrDf4VaECtBZ2QTnPQK9EFdj3eNg0sGCbNTT3F93zasWajbNOELwP9HTlfBg75mNzMJDJCJMff(D1h3NUmdF8RPZxLLRwmllk8rzC64C5Avu4ZQePo(xk81ZM(0d3ogM7htxUSqPJM4S77mg8DJbVtf)6k4rc88FhVqVkAcL6ePJchNLpxveUjjwxGlVkv(sIAr0lTxYoM0LbgkCLCr2B1VAg8sCPMqWFcg(2)zRm56SeypvnMB5yWpPLZJHpRB7dHBNdBMcZVY5WF14SuCnEFtom)3KF04)v70Q9wFd50ZqY4dSl7nTPB1jXPqCy6pM9W9tUTAheg)VkyccCgHZLj4Va7KLlJF)(5zPNcqV(2jZU9zdiLmeGUhOUICk)FNHTgbowmY1sVNvAKT55Qu9tBtsgjrRfArqCh0mcyTQ31BZHv4X4041YK4cDd7S2Igt3ejhnD2SPp2NZBSbmCUX(ebNrccCyuUdN7fT8kod3zJzCIlr447qOEbEbeCe6(Dl8TMMHXdCdGV3HWCfbEI6jdMH74lyU(mhIWZJie1lWoZqBzgra3hSraNkeeblOXmEepbZH56q9HDRNFhZWA7uEbCWVC5mbjGrnmdNe4t5eyn8899Dd64u8kZm2JY8Cy((WQj8Cf06vJG7dyp476XP(UUWO7nTbbbIuyKhdIy0XmL2OAtRsBJYkkuf4)NVqLxtLWG26njkDCwQr47y7HDCQXC)aFFkHXPUOtWB7K1RHfPc7ltYoq90rY5)818STPlAT1kboeZfboE8ssJxfWD4rOhDeg4iqeN6c0jpEajq4u5i6JMFeUropo9v0QHZIxRYRtvSk)yLQqx(r3exSjbQHGbG6obJ6N)mwq89OE(uhiygqd8A4ickhZACGrycUpRjNcO0buxcZHYiobC3oS425uEbUeItjRxWeuXEZyeJAN)mPBnLD5fhlz(aFI(4K0DTL7Ys7ZnoBggVDAYVJKRgcc5eLFF((VDNjZ6kHV1DYCSQ7ZX71vV2FDLsUWI(nw3sCKAvCRir9w7cKfCJsQxDney1QYmZ(Fr4QS3krzezBGrxRrrCQOCJdev6auNoeI2OZhGVYqat)iboHwk4avF5Qr5aDwvvgXAq3sMqn46xT2gf0qIC88Fs6k(4i2YalQt)RwcuUDOoxQLq2kGcrHPLcWxOwk3MO335QJu99vFpAT3ZwSoqG6iwVjJ09CYiTNk9hqc5tJ2DsRJOmVl8n4jDmeMZAtkAKVEamZcGUdSAnCbR7AjYGSbqAiv0ZIurzwdm)bqRAAG3be7iDWALcLz(hga)C1fmX5lCCb7xcY4fF0Qo7tkGxNQlBRDcot9rX71sW8mVwWlonjlxTwcYwarWV0HX1CKul4mBGPnV0FoNEwTybDUcc5sOLpU6OfpmbQfBh(TFSzHuREg(xvuPSxtPI8ZjZCybyN8Uzmq(pR7MXYlz5sl3zHNmCc8DXluZkjP5vN(z9gzECrwAL2SJ3VOFd8lc8D(IFx)6Zc(VuC1YW2WylsJ7bJdqJVuC8pAs83aPQZYYs0XBquhKog(uwrmEFkrDLeM3(gL7CIHM3yiVHSpAob1epuLF7VBZhLV)Gk9vuQlSgh(wGSpszbuEH3w8arGoTjRK)14m2dy0Hamts9N2DHBbUnmf8Vu5fOVoHxDESYtQyHLpY5XEwHj516mgc(Bv8ONSdtmRr1WOEPSTACF6QvNNgJ(bQthK)mdC6mTS0Hmf6ORp3A5f3oe58g1C8YHkqdEgP2ww2CGQ0U2IOwaf4LMQWU4xyAYW5a3Sn9vvw65vK8mopfw((IC9)p84s1Mz5AfKZtk)Jb9D1hpO(LkXEF3(BO4WU(f6xwGyd464fLg9F)]]

	-- Profile import
	local API = _G.MPTAPI
	API:ImportProfile(importString, name, true)

	-- Additional data which is not part of the profile string
	_G.MPTSV.AutoGossip = false -- "Auto Accept Gossip"
	_G.MPTSV.KeySlot = false -- "Automatic Keyslot"
	_G.MPTSV.LowerKey = false -- "Data from Lower Level"

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["MPlusTimer profile has been set."])
	end

	Private:Print(L["MPlusTimer profile has been set."])
end
