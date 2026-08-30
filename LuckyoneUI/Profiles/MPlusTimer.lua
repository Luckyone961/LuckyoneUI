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
	local importString = [[TN17ZTjoq0)Ishq)c4J1jXTzAItMa9UVXmk2Y2mHa(a5g77V(BfGnsGTrjox71zUp0exl0UAF7B39HsSBCuC43eBVjBEU6JFoB6Y8cXSO84W74jzJl4ViIdFuKYLj)qO(6O7F42Rhdp727NpVuiJN4SBFAlUrBXVkswSe(ic(8FMmtUmEcg7elJdhNxmvugUknrwQCViJ)uQyw8tMUSJjDjGHcxYNL)AZxfbFPYvtqQFcg(6)Anp9Y8u4mvVMB1AWpXvphr9zPzmeUEkCyk13LZH3148mLp2SQaE(x5B3DA6VvNUBDhqvhsJ5jh4u2Bt3VwMMKb5H7)E0T3m566tqyYFlGhGPEIWP8u1)bCW85jBUzAE2Pa0lVEs01pQbPOHa09a1fOpK4F3j4y5ixlJEI6jUCDrHit(W600r8c94EKPhos(msSrUUa8WDjzjVWttkLTSZ(wuhjhDFu093vNn18Kwan2hXOeuqGdbtDOuV45xqjQJWycf5Iyo(oiSxGxasTcE)Xc2RUzi0a3ay)oiIllWJ18WGzOo(mIRpXbX88qmwJd2zgSHzybuFWgbumJHyKGwZ4H8yehIRd2hoTE(DmdXmO8cOqC5sjmuabRzgkkWhtrGp8899Dd6eu0AZm2dt8Ci((G3yEUmCJ3qQZbCg8D9OyFxxy19MwJuin7WOY8QKOk7OxsR1TXO12O8YsrP63fZefnujvc8LvPczsEMwQ8yNNDePXu)aFFmIqXUQaIAgWn(4nuASVh6((MeWk8PpVOiFD2mJJwfiQWFwGJhTIa5vdIhEf8rxHabcK9XUa1YJgGcyo1bYXRpcxXNMKTqz1WOKxefnLk2wFmMH89WE(yhibfGd8A5ammvvv4aRqyuFsBndqzdWUiIdMGCcOUDyPM1mEbUiKtfRMryy2EZOH7M1ht62CyhV)yfRhylQoslfLYkm5QKYvPqlsf)Qzq3itY7XiP7gl3LLUNwqphYLEzY)fjxTii6eTFF8MV81iRMIy54nhTCZfm)ZBw3sbFMfJF2LBAcMrILjgzIMq6Dil4kbxU8siXkfvvM93r4Y8xRqzdw5fkYkiHQqmQa4gIAs7w9LvsmoqMOtSC60MYgD2WPtt9tgktyiIZ2KJAJAQJSGbPbU(17xRkwrKtM(CxUQfMTP8V2fk52HYcUKd15aIehMvja)21tFEBUkZ1m6QJw99TFpAZ33SADGb1rTEBjP7VSss3FZRiFy0Ux16isZBC5MEC6bXPlu6e0jfT6xpaMzD(Xgy1eUa)(cxXGSbqAjv4FDKkm53CAv7e8oGyhTdwRxOQYxdS(xtyWeNprvoSFliTVyRrJ2B5zlwZxa4XNxlbYXxtMjIQMtvnf7bbq7ZKvJ9obLQNM0JYO6ni0(xBUq8chK1aIKFYK8P9kRwqCodUPbtPZ1pWNd6cuhbvqTc(90kmB0byCY6jpvkyhUo1uc1zCvnAPHpQRQXY7CXAaUtrTfrYWLZFbg6hLNNktwPWDygCtZ823qDqM9(CaEOmGoYEgmntU1hcoOOC1QtTNYn4aZ)NW1hO)(QzCP4r4FXvnKdFiVmzhnZq9vH5vb3r2F73OjlbTpxorjMDiI7bVfMJb3NovFhFZTISfknSWHWOV9phfr1r0a4FNXBQ4NxKuMN1J6F67f)9Y8D(KF3Z)hf3)ndy7KqAxnZWe7)quuQOXty1VGw33CXIKU(lO9OqbGnclgkTAFIrhUBLmmQhSymWEaPYNRaJEQESoxAbMkZL8EQoKnVhB1n5ApjOFfXvIPQBsQu9aVbXAAa6a8FxBrrlGc1TOkuv2M9mSgThUg4Q1zle5zw18Tv1azi4Y46GEFHUTX4BODALEZ8cPaQ5rv)1H(My7TIFisTp2DpZq)DgxwGyde6QBon(Fc]]

	-- Profile import
	local API = _G.MPTAPI
	API:ImportProfile(importString, name, true)

	local DB = _G.MPTSV
	if DB then
		-- Additional data which is not part of the profile string
		DB.AutoGossip = false -- "Auto Accept Gossip"
		DB.KeySlot = false -- "Automatic Keyslot"
		DB.LowerKey = false -- "Data from Lower Level"
	end

	Private:Print(L["MPlusTimer profile has been set."], installer)
end
