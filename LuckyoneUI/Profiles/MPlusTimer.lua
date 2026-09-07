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
	local importString = [[TNvBVTTnq4FrPq8vr9X6K42GL4eePU9nbOAtBluzjpz5vN9RFhPSTePKSO7AXwhgcsGJO4XJp3ZD3dPJrXrXH)I8ThYxwO(47ZNVUOuUiQio8PK08PLjBKXHVkZsQs)dP6Xrp)YJ3pfE3FlDr164zeI3P51AWpktxTUkEgsehE45Ll3jH)bEX3A(CvC40IY5YDHBZsR2PwEzEYNZKlI)S5swBYZMbrbdfUozrXxp(Oi4HktodF0W3)77tYUTid8P6Xq6XG)s0Vhv95kd3jmC)CWz21EwE9pRPf5Q14W2s49)AYB1pjm9pLWlWp5BDnKNTHEEFvwAoaWp)POhFy29GHss7XV7mXt4TgzG)pCEsMAXHrwUm9WdZlYna0jMa6Rp8Hp2grPJHNNXPBW4FO7)HIzOU796nb8GB3xwkZREzFw2KKsRTTdHZi5HQ9LGx8uAE6MKS0DvnKZUwSnqo55OONFYIF6zSQT2ltfyoJIdc8OeMhJ5hV8ggv5otPmmcZ9eEyIFGFawnc5SlcZTTzOSauamFpmfXd85hFzWmmpbNIeupm33hZ5hxGtMHyygEata2iGr4CmNg0ygFSpN6rrEeb4T(clZqn3u(bmyFHyuooGsAzggoqqyyyn8fcbkWAtXQnZuFc13JkeWQX9rCYXvdR8dWheiFgrGqWONnDl(aePurEvqufDAxvQfR1S0wu6gzPkYgoPOCHS8i11SSv9qoWI7u872InBZKvPf5TM9qBMtmYPmrGqqWugbPqdMjAfojz(xwvwSpFHHr1yNc25bE(mnVXVg76FeYGJqHqjYJt9dqikdjyyrTlmCks42K5P5R0fqoJPrdNIC7A5Uk9lEx6UTzqLdWt7KSmLJf(eFbXdIIbKa)gcbNWuPiEWiuotqBsGa(BabHPEek2lGHSOSMjqWweJ90uCoLt4NntRWQzYYm7QgNscgkZTNPObmDRUjMvl62jTMMEQXSnl1SASZ802K7oC2)nsVAOl4lud(27NfD)Ro16WXMCE2n062WRBNRjY1PgG3rNOtyW5UJVFTmzHd9Vmed0qSy6n1DYKQ13cX1kPo1SRJhUU4RAq2GwsGbaruLYjLaZqwtApJqywCOsKrpIkmBppIceLnSMG6rhSIeMyV6ngiwjUc41b(IALAPj9I0hfnoD(xSzQoSkht)XArhkb3HvLjvjqclGiXH5Aj4pUF(xERqf4MuSBNuRUR)wAdv81n968lPxVjHeDHeYJbsh25)3oF0wLTEWxMC6SwdCyh7zn6zDA1nGAYjAuWoQK9(kl4iSaRYMe92ZENpodWGtr()I8JtQSkYFdIPgTP7TfZYs5GUgqleWzTd)WefmZ7D6DqB(EDXObRc9ys(Q9jRG4Y73xvlt6r5FiZgVKudSjWotug9iVy8veV)(CK372NVswKpt1Ay4sjwCfYvCmFuFBzh80VXEXDrft(oOrPSsMdtMQE9pMUqgP1LOfTOREOpayKZ3GspSJ7KZvIp3PZuoJAJsuAreeTGqkV3Ruc1F6TlfFuN2sQIXwLzDgLDi(1K)OXi1LObshJ7v4yRyn1OnNRSm4nlLBsan)WziNyhZtwcswvhTxn0a51hpwzZfa5qL0Uq9wyIZ17ZjxbAwvuLK5OeVosPRQ1XvR7E82En5WJkh4Ix9zlxQv9T(zQodFF3us4GxBr9DlzhM3hGkLrffzvPBvipiewRw3wgRdEqB16)QSCxAbuwIFsSvZv)Cf1LhlKARz5F(7E909oR4W2nHg60a9CNydXXUmC8uYHhL5R0rbUnrEm85Vb98Qv3Al9Vyx6jMXH2DAln)6vSoiDZtATtz06eMnBtkt3vK3PqYLPCFRvr8ENWgv(z)Rq5SMQxKqcCE15gExMp3DDn6I4a5O71R0fuA3Q866Y10yTRGbZg3od1gnKVm9XK4)PTlsQKVc)Q3iQIg6lc9AA8DJ)3kNTdW)ZDNV6mz3i5QFI)Rp]]

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
