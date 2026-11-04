local _, Private = ...
local L = Private.L

local _G = _G

-- MPlusTimer profile
function Private:Setup_MPlusTimer(installer)
	if not Private.IsAddOnLoaded('MPlusTimer') then Private:Print('MPlusTimer ' .. L["is not installed or enabled."]) return end

	-- Profile name
	local name = (Private.Addon.db.global.dev and 'Luckyone') or 'Luckyone ' .. Private.Version

	-- Profile string
	local importString = [[TN13VTTnq4)HwkK4VK0J1jXTbZXjisD7nHPAtBluzjpz6wN9W(BFhPSTiPKSP3sagW2dTirK84XV77U7JmP(PjPX)m)1hkxuj)XpwoBvvnFEsvA8Jz5LJRZwZtJFHxKjY)ox(5KNEEY9JH5(R5ZfRsNIXEhxN2GFMNVCLiDQFyA8(NwSylh(fyIV2(ZI04Xv1Z4BJ3uKl2k3EEz2xl4Zt)Q5w2yYtMXNagkEv28QFC4tjWhLMCk6GHV)33LvCBvb4tnJ5Rgd(FSAEe5plmCN44DZaNzR(Q86FvJRkL7X(n1W8)r2RnFjo)p4Weyh9TUgYZ2qpTtuKxcaC8KV8PF6p)TN(sYKhMEpyVS8EC)oR)iSRai43JNLvi9byKflY3)WSQYZHRV8WN(SoWIUeSEcUUbHEpGHtN)HcD(Dp7nhc4d3URUMxkEExrXOSA9J9itdoqunHVxSRg8IhZlZxNvKVv0Yr7ArDGC0tjjp9Ofn1Zyx1olJdrmkbff5rWupkniDXnuI0DgtOiFeZl0dHdIcIqYrWNCryT6MHqJ8JG17Hi(SOa2HjdMH6fYi(HepeliaXyh2GJMbBygweneSrefZyigjQ1mbOagXJ47HdbVni0YmeZdvqefox(ucdfrWAMHIIcXueShbHHH(rwhkAJzghGjbEKWqy3yb(m8HDdj9dWhc9dO4qFFy0tMwJparkzKxgeLrh9ItASwZkCj5R51YiB8OQ6586duxZQxnd5alUtnWBRwVPGlYRk1w9qhMJmYX0WOWqmIqX(s0GAIwXJYM9TL1v7kNByuf2jHDwKxavXBcAWU(hbp4iePl6rdOruFFFwlXA4uK4nzZYlxkxBlMMmCkYTR4BfQjEx(2nfqLdzPh7KLXmuyaoie7brXiCuqlHGHPYuepyecJgsAtGa(Be2hr8WeKhCcSOSMjqbr(iKNIIZimm7Kz0cRMjltTRACmjyOm3EwIcWuD8gzwTOBd1gA6X(Z2SuZQXoZt1j3D4S)BKE1sxqNPg8T3pn5(xCQ1HJn58SBO1TH3GnWhXxLBGHh8LordNBs(Xv8S5o0gZqtql)IsLdEhptS6wi8k4Qm0b9)4vv)qb5gKuG0fdkRQ5JQbEcVHcFcVOPXsfh9OWWSx9qrWdJkTH1cKFAVvyXmqiNr)boK3vaYoqEK7KMEQZYLKC68zFZM26WUCOwasParkcpwuNjYGSxarsJlvYYNSB23ETsg(gvTDlxj1R)(Bdvj2nn8SZPHVn70)mzNhcKoCY)prYPTYB1Gpp641WCuV(fVgKwhcIj1Ovv7fLXFMAeoIoWMToRP8HfaCz(Gbdd))1)DMIzv))gFvdG2(7w8mlTfQcdAaHZQlE3Knm17dQtGo7VPc1GLMMKvUCx2si88XDIgHut4FNx4alQf3WHotyUb1BVjTErKRiGpi3YbgU9ddC3UYL8QYPY2go)olyI7NC)(o4o4OAjyHVfyJj7huXul4LkGhw1NZNZtukxuYAuLuuxymX5xCPNYX3XNjfRUvL34(BPyYkoHKkks3xIYV)K9ROIKZyR82CCj14QRvRLuPGk5tWbsntpNqtncaXsPPBupyM181zWngGBG(vBgq2cqPR8HbKb8bY5pCP02NpYHQSDb(nWcNPoUJUcWwujYkCutyhP3IgHFn60hUMMCoYm)j8fIRr9WzFevn)695ru)NtKDW1TO4Uveaw3ZCq(uP4e9(8QEh8OyWzCWD7E5RUOOEIX1XP7nn6iYyKM6CiWi978SntTWYRnzFFchai9Rn9l86T5vqXF2r5UTpi3v0e8s(TTCX32xe)nO3)X0)lZt79blhITCEu5XS9t4LlvbdMHePE1r)wN6F9TUSUkw128J8K96ICQn)lHz9(gTFr7atrnfJwVjRoFBvzNY1NNa(3TmT3hcTrL3Nc1ohuER(RDD6V4Zx2mptWFb(NCgXFci5jvvfI8nswpW9uCF1JTEH2JQyY)3FCWAjxz)rrA6F9d]]

	-- Profile import
	_G.MPTAPI:ImportProfile(importString, name, true)

	local DB = _G.MPTSV
	if DB then
		-- Additional data which is not part of the profile string
		DB.KeySlot = false -- "Automatic Keyslot"
		DB.LowerKey = false -- "Data from Lower Level"
	end

	Private:Print(L["MPlusTimer profile has been set."], installer)
end
