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
	local importString = [[TN12UTnoq0VOuiEvupwNg3gSjobrQ7(MayTPTfQIKxz52K9RFhkjBrslzXuSDrFOp0cBtYHZCMZCJjfLMKg)hQxVTyDP(JVVy52Yk1QKY047LzfZRKpRsJFsLlRZ(Ms)Zjp84D3mh27FLTQEB6ccj445mw8tQSnBRtxGePXV8W617vWxGn(A)NRtJNxwTuTpExEw9E91RkKFjxTk9l2xzRipjgefeu8w5QYV39tjWpQf5cCNGV5VpiZVUmh0P21qnRb)pPzFu9NRTuN44dlbLzV5Pcg(uZll03Xl7QG9)D5RT)sC2)OGnW7rJw9(Hd15zfak(WNtU72f3a7wMnGYf4EnTM456J7g1BDPmxF5WDVED2l3USS4sa6t3(XpzIO4PWZt40vyS)2F31CoamMNb9dz8xFOQsvu)4H88zYktZEM9vnI7mr9s9Hkq)UpRi7zzE2(6EY55s0eiN9qsYd37WpdSUvdRCUaZzuCuuaLWcySW01xXOA1zoLHryEGiatcJcJW6viNur4SMIHYIqrW5dWuepkK3TzqmSabNIe0ampmeZ5DxWrXqSedpIjazeXiCoMtJ6ftioKtdOOaIa02qHJyO2gvyedSleJYXruIHyy4ibHHH7iuieOihJI1kM5HeAyaviGBJhI4KUBdR1dqheOqgrGqWQNeTbtb8uApV2jQ9oMzLmyT2P2sYEwvP9SXZkRwPQ6OUdKhRD9PPHwj8UU85D5Q6SYcJdoMXCKroNjIeccMYiinAWSrR4zYLFDtv5HIvwcTb70WopkiK1WBcBXUHxHm6kuWvIc40WieIYqcgw0QcJhIeVtUmRyJ(S9yAY4HixVvTVUzJFiB)UCiZHo1JBWYCowescfKaWlgrIc7jeCcthIeaRq5mbTpac4VreeMgqO4GigYHYAhabMigh0qX5uoHFsmgEu7GLfUznogemwK7ahPbWAk1nZoBX5vsBPPhlm7YsTZg7nf9IfP)vKE1txWxih813Si5MNEdfvMSixGBbTZl4DEnTzQTzwGxNsmQBO1h8(Tk5kpks5B9WEIfJR)6huY6Txd(1AvtO55kE82YV3aYw0sDlbqtuvQzvaZq1sApHqS0yDpgd0tHtT)r8zDRQLHZb0)0loocBOxVJHDv4G2vn66XBsHhi7fzpAwC2YV6su94(7I(Xn9CO73oUUswlHWtarsJlA6a)Udl)6RLA)2SY97vnn3nCfTXY96x768l1UEF8i6cXJDospS8FPchpYF)Pfp28ThNDCulpBnFYrDmkgqT5e9nWozh7NJFoWciRNLngH)w(0malof53549fzpXoUcr1FVV4TdZYPXHMCagiG3To8tRNGfbVJzzrbhtgnAwO7KfBoi3a(L3FOUTlP7uFtL7b9Ph3M(jemIRgSmKrzhX0J87nXDANHUO(HInQYIf6sdJNkXzSuc1FtgnKf7Hnyes5bO4RfRBrPQwval2s3HsGnDs)MC5HSPS)l(QrgwPb1G)F57gnzwyp0nVXu)EeQ6UwlAgVoX3tnufTpOwQBTFVEhgKYP8j2HzNqEDTUbaEKVa)KqT34OEgyLNTA2ZvBWinzdAmpDWGddQb1QlcFdIHDwPEwctubtO)f3Or5AyGa9dNOdCgjgQBO9(Nx7hIJVdo4Yg7C2BawRlRL5E2b9zdQ0LJODQM3soc8KLf(DoIHYr85DRK1QNG)1W70tc5oIGh6L5Kq)PQAFwjKYN3(EAYQS9LfN5rVCjVFuVzW7eUqXp3)sbJ(s5(5b82J2fy424WytWnWZyoMLEzC(E5l3Pk204D5Ubhtbsts59169Hd6mUw5(mnaKMy10ToZQ1FrmNh)O)xmSucVLrOhkRhA9NmpzPs3zB8H49)t)QFe4BjLL51z70eqGge)OcWHI6tfaVmvC4YJ2gO)LiTQizwV8TvQBWQRNMx2S6TVqLDv5ZF)TP9kGm(u2kvsZHQAkfM(V]]

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
