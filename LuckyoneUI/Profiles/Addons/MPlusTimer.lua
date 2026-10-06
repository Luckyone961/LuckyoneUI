local _, Private = ...
local L = Private.L

local _G = _G

-- MPlusTimer profile
function Private:Setup_MPlusTimer(installer)
	if not Private.IsAddOnLoaded('MPlusTimer') then Private:Print('MPlusTimer ' .. L["is not installed or enabled."]) return end

	-- Global db
	local dev = Private.Addon.db.global.dev

	-- Profile name
	local name = (dev and 'Luckyone') or 'Luckyone ' .. Private.Version

	-- Profile string
	local importString = [[TN13ZjUnq4)HAUX6Nw(XJKWDzkHKj2x7BEQdiapNXMAm3r6d9V9UsgWwY2eX1Kz6m9EizalPvR(2VD3plIrXrXH)Q8L7YxuO(4hZNTQOuopQio8(K08XLjRLXHpjZsQs)Mu94OhECYTJH5(7PZRwfpLq8oUUwd(zz6YvvXtrI4W9pSyXwj8fyIV085Q4WXfLZKBd3KLwTvT9Y8KNZKZJF2ClRn5jZGOGHcxLmV47hEue8qLjNIpy4B)ZDjzxxKb(u9yi9yW)j65rvFUYWDcd3ndCMTTxLx)RACrUAp2VPeM)3tEP(jHP)LeMa)OV11qE2g6HDvzP5aaho5lF6x(7)4HVen5UP3c2ljTh3VZ6pc7Aac(E4SKmLpaJSyr6(7MvKFoC9P7(0NBdS4xdwpbxxHXVhWWPZ)qHou3ZE9HaEW17klL5vpUllBusz7J9itdoqunsUVAxj4f3NMNUojlDBvdhTRfBdKJEik6H7TOPEg7ARZYybMZO4GapkH5Xy(XlUIrvUZykdJWCpHhM4h4hGvJqo5IWABBgklafaR3dtr8aF(HjdMH5j4uKG6H5((yo)WgC0medZWdycWgbmcNJ50GgZ4J95upkYJiaV1xyzgQ5HYpGbNleJYXbuslZWWbccdd7HVqiqbwhkwTzg7tO(EuHa2nUpItoSByLFa(Ga5Zicecg9KPBXhGiLkYRcIQOt7ItTyTMv4Isxllvr2WrfLZLLhOUMvVQhYbwCNAGxxSEtMSkTiV1Qh6WCKroMjceccMYiifAWmrRWrjZ(6YYID5ZnmQg7uWopWZNP5n(1yx)JqgCekekrECQFacrzibdlQDHHtrc3KmlnFPATnyA0WPixVsUTspXBs3UjdQCOk9yNSmMJf(eFbXdIIbKa)gcbNWuPiEWiuotqBsGa(BabHPEek2lGHSOSMjqWreJ90uCoLt4NmtRWQzYYu7QghtcgkZTNLObmDhVrMvl62qTMMES)Snl1SASZ802K7oC2)lsVAOl4Zud(6BNgD7to16WXMCE2n062WBWg4JKRsnWWd(sNOHZnj)4kzYChAJzOjOHFXyQbVrMuT6Ai8wj1zOd6)HRk(UgYniPaPleuwvkhvc8eznf(eEXIdvko6rHHzV6HIGhgvzdRfOE0ERWIzGqnJ(dCyVlaKDG8O2Pw6PolxsXPtN9vBARd7YHAbyTceLi8WQYKQei7fqK4WCTS8j7M91xkuHVrfB3k1s96V)2qvIDtdp)CA4BYorNj78qG0Ht()lsoTvERh8XrhFnmh1R)QVguRoeutQrJQ2xvg)zQr4i6aB26K6YhwaWRZhmyyKFw)3zkMv9)Rq6gan93T4zwAl0fgAbeoRU4Dt2WuVpOpbTz)1vOgS00KK8L7swcHNpURQwi1e53KzoWIAWnIWzcZv4E7n1Qxe9cc4dYTCGHBFXa3SlFPSiFQQTHZ3ZcH6(jh13b3bhTvcM4TaBmz)GkMYkzUg4Hv9505YiTYfTSgDjf9lmg58nU0t54BKZuIv3QZBC)UumzfNqsnfP7nrH6pz)cQizv51zOw9YDsftXHOztsLgQuxbhi1m(CcnBraOwknDJ6bZSuUobEJb4nqF2MbKSau6QUyavaFGC(dVuAZ1h5qv2Ua)gyHZ0h3rxa6wvuLK5OMWosVRQf(vRtF4AAQ5OY8NixuDjQho7LO2YVEFUe1)9YoCW1TskCRiaSUVSzEsL8j4pnbujY3w9Rd7EBr()MSCBAbuQIFuCwZ1hDbLSFTyQT4M327V9nOt1rY6z4ZN0o2Z1RneB78OY9j7NiZxQdgCJg69Q67TMOEXIITFXHITPh5j7B3sU083TX6TXBEsRdmdxN6SEtsz62I8ofxopb8hTOI3he2OY7tzfNdkVv)2mN(9j(eWQJkkYQs3OO5azl8rjKONxDQl55j8d6rgTECG909oC6IAT7VEzTg7TB8XcSgD7Dowy0f)88lZmdv1e9LT(kTh1S8F2FSJR)d2FSko(Fo]]

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
