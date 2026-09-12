local _, Private = ...
local L = Private.Libs.ACL

local _G = _G

-- MPlusTimer profile
function Private:Setup_MPlusTimer(installer)
	if not Private.IsAddOnLoaded('MPlusTimer') then Private:Print('MPlusTimer ' .. L["is not installed or enabled."]) return end

	-- Global db
	local dev = Private.Addon.db.global.dev

	-- Profile name
	local name = (dev and 'Luckyone') or 'Luckyone ' .. Private.Version

	-- Profile string
	local importString = [[TNv3Yjoot0xODMY6xlF5qsyMudHKkMz37CTAab4ACSznIzc7f7Z(2Y2GLmyqHKD3P(QVlcHyz1s9PpD3hPKGsMKe)z12BZNxy(6hYNUSOunBsrs8DY08HLYNujXpQYK60VRmpEY9pm6MHW7U9(5ZxR0jJd2npRbF2AWpPsxSe(ksKe)BPZ0ltgtibj6K4HfLtvRJxLLQxBwEvU8RzQzjF1Dj7ysefmA8s5SIF08OjWdnl1yS5tWW38hBKzxvKb7P6XqvJbFsQEpQ57AxFiEZuyZS2EwbhFwdlYnRXZRkH3)hYT72nho1GUtDhqv7sdLPhzxEWKUFJolnhIdXJ(Yh)L)63V)ltgD74BQ3iXP)PcEpU5fJNkZm)bSoZNN(8TtlYpfU(4TF8t2al(CW6E46Dy8Bcm0Sd6lsHocg0RZF1MYsvU(HnzzdKL2U9a3vONO6e1Z6nLWkCxAE6tYS016wo6Hw0gihC)Kj3FxDm1ALSCOHcmNrXrrbuclGXctM)og1SfgszyeMhicWKWOWiSzeY(TfmxBZqzrOiy(bykIhfYBEzWmSabNIe0ampmeZ5nlWoZqCmdpIjaBeXiCoMtJAntioKtdOOaIa2THIoMH66uHrmWVqmkhhrjwMHHJeeggwJqHqGI64uSAZmmKqddOcbSA8qeN0SAyZ(a2dcuiJiqiy09M2IuODRZyI8MGOj6yXuDk64uHBs6tQstKnEqr5mvzdBYedFAvMsNwKBfn7BlTJlnKjIeccMYiiJpXC95M14fKCSVyQDb0bYPFBrzXM8zoBTkC0ec4rbHSkouynoE8ri9ocfcROaonmcHOmKGHf1os)PiXRKttZxyMBlMoX)uKHCSiKekibqikIef2sd4eMjXiagHYzcABAdWAJiimnGqXbrmuhIQBAd4myCqfXMt5e(EZyH7UPiJ7wFyh1VV81JmftrPLQ16km5601RYGIKvvzR74nWL)2hnDx)5USuhAXftUCRP)Zi9QfdXNOg8v3mEYnp6vVepBYfyfEySxx)ULk5mp6b5kpyGAzQtGOXHUCbcxRK6LxbHxTQkdT3jgVS4hvqUdjfiDXGYQs1GsGNOQPW7XlaImkooIcJoT77jc2mQXgDMWPdyhgxmMWrANVXjZeTel5bxQfHXb1Z3kL2WPtN(TU0wpmBtTaC1syeHhRlLAjK0dissCELS8rBM(TTfMW3GI1Rvvs9oE)T(Qe)Y1WZ7QHVn7eDISt)f6DbjNO)vZnBCL3(KZhgS7yyEQx)ShdYQ2o1LA0QQ9iqN3rjFqxxudw3NK1HmVXLwgg5)S6)Vd9)gnaA7V3HN1rBH36jQkgyHy)JjByCW7zMf8WQswpyRtT3rY8fBKlay5dB0af5tPZutQ6Cv1w7bfKdKRRAh(2u66GEJoDopjRRu9Keu9aQO)QLBGCowRh8Nxbf1IQqpiVvohumy2dgVAf87PvO2G(PE66UsvsDpb6AENQC7rQ56xsTTtEfpwbL3QR4XZ7QXB4(vCfiNlj)JG6Gjffz60vgagAw3uVV9CTNOltNM)KZfiSb4xb9ZTY3BjCSNIDgA4ya2()SWZ5jEd7Fz1mPw9i8JzMXpuSoDhZZQTQPYNZLl35idTpXsmdzFC1eZ8P29rUpN(a9thWVt(8iv(IkX58ZPb1d48sJu(fgSbTATuasiltxxKFqgXPldCPzcbVx01tERYfUuOZZCi)qy4f)vv5AdXEmV(4EDphKhSa7J79OYGJnAs8ztqFj6mSLw4O5WT(Rt)(EsUAQu)A1NCGOjVJREaS6cT8anl6MJgxDzX(tiosHLRvtnxu16k40))pkwa6(4H5eAhjBa5lo6byyUNwLDS256v8aW9GncUb8IxVjFHQiVB15ZO0GEoCBRDFJldc81vDth8WXn3cBmmfTkFhk8z12rQVRYordQDNATTJir4pkG)5tYvLNRts(7p]]

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
