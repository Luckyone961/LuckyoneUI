-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local _, L = unpack(ElvUI)

-- Runs after successful profile import
local function CallbackFunction(accepted)
	if not accepted then return end

	-- Handle minimap icon
	local LDBI = LibStub('LibDBIcon-1.0')
	BigWigsIconDB.hide = true
	LDBI:Hide('BigWigs')
end

-- BigWigs profiles
-- LC: 22/05/2025
function Private:Setup_BigWigs(layout)
	if not BigWigsAPI then Private:Print('BigWigs ' .. L["is not installed or enabled."]) return end

	-- Profile names
	local name_main = 'Luckyone Main'
	local name_healing = 'Luckyone Healing'

	-- Profile strings
	local profile_main = 'BW1:LvvZUTTrq4WYyuuuKwjhyLyahG0dTafiiirUoT13mTL)lYwcs01P5s5kQrKlcj3T7UuYQh1PEwpc(rqh6dGEci0JGFem6XEO7WFvs0HfANF)M5B2Hg)dVwiiLepOltsvuwK8hwcHC)IRN30Ut3etJDE2DrmrijOuXGdBDPDREjBy8FpyvEqoKfWeYXd4XcEaSFxZx9YF2i90AqqCMGM4Xpz2ZtaquMeZ0tl3PKcbMdMcbbSj7BMQ71dycsKhSF6T9sf1uadZUNgXM3NJH(GsrJ8K)DnblwfqJarNRSBF2LTMnIfP6t)l47wHL4vCoiCjsWz2iYqqrdHUMV(LnVdvEblI56lyHGFA)4yTRxscHBBDdxOt0eY00WHYsAy56tu(lgsL8aYumsBSa9QtgasQTWtWMCfFcrmu6plwcuxDR25w3aIu6IDnNY0Gi8h7rcOErjBCByfq41J0ztNbvvr(Qvk4gf6wAV)Ctddt(My0rzRvf8gOWt0W4iQaCrkSVIiucn)2U1X23JQVMou5BteEGABEnuYPa1Zx1r5dc52P2CGKRDVhrhbNmBortu26AUnmszWFmk6qglyiBs0LXHd0E6WBGW8ZZ(aRo22DUyb6tNrJKG6335bllGFwZ9o8QUTRDeZKtPASr9OkCNdYfyMYJvWdUVW4kQOs)7mUdVSoxx0nxl1hbsIkwO76vQXu)S0wF1ueV(NvJwh156l51lAshlG)mgICN29H6b29sXMftmeezKNrj5vvU2t5qpo9gi4UkZX0NBjAtxuDBD1jRFBLro8NwAGG5Eqen8iSm04YKV16QsPcuVtowxVg617Sto1oJwRsge5P8)Qm(VGSBn0d8xv0WZNh1)YcAHv9Nq5GZQIWTMzBxi7Gyf7qIu1vdlQBGUSYNElsVTp19d6YvAMXMzC7s7tp7W3M)ypvrFoXv)mXiD(k)I5m8Y7zSqCTXUF886zrJ1ZqG)AdKVBJ5zwuIZ1Eyu8wzRpf69DjbG58bKmQv(BR0)1I4(b9IG4OHNJtaVAVp6uJMFfTYgbUprdN0bcrUO0CpRiGNNncHN7UlE(MFXeDULEjcrQhpgMUkqGLJMeBAD9R5B6QtTclZYL9nMXl2NNyIR5F6cDqk3UStY3MuBouetN7htL0bbGfr0MgsvpAE6Ak8XFYXZHB4zDLVp9jArsSsxVugeC4kM7BHBjDMP9j9X7)(n8ALM0dK4ePVfgghbYKXc42lO6ruDcLkSn0xnna61ky8vNjKzu7xUm7Bu5Oyr2T84pWRiX6W5K8KKg5GxFnX3AeniWFvjeWsQo)XFs9ID3Vo55(j13AzXhtqzpH)4spVioqr5buqywfUlyJb)7l7)zZenMpQ4DYB2uyUPNXMdmwQlTQVfVq3FkU9(KxK8ITc(ILynF8F0v)LgqK8WmXTnsMXRxMGcgCesGj1HvLAWclTe0nGEJzuxyzRipDt1F)NFq40)p'
	local profile_healing = 'BW1:LvvZUTTrq4WWyuuuKwjByLyahG0dTafiiWwUoT13mTL)R2wcs0XP5s5kQrKlYsYT7Uu2QON0PEwpc(rqh6dGEci0JGFem6XEO7WFvs0HfANF)M5B2Hg)dVwaiLepOtKKQOrHYVFoeW9lUEwt72Dsmn28f3hgjciSsf9pO1L2T6MSIX)9Of5b5GiwKqoQppwWzWEDm361)Kr6PvFwCMGM4XpA21taqyMeZ0tl3XKcbM9hdmw0n7zMQB7(rcsOhSx6TDtf1uadYUNgXMpKJHEGsrd9K)DnruSIrdbr7RSp)0lBnzyuOQh9pHVDbwIxX5GWLibNjdjdafna6yU9RBEpQ8IOWixFrua4N2pos76LKa4Uw3Yf6eDdzCA4qzjnSC9jk)zdOsoJmgJ0kZqVANbGKAZ8er3Cf)gIyG0FsSeOU6wTZDUmIu6IDnNY0Gi8h6syuVWKvUlOci86H6SPZGQQi3AHcUvHUL27pZ0WWKVkgDu2svbVbk8ynmoKkaxKc7PicLqZVN36i7hq1xthO8TjcpqTbVgk5eG65RAR8bHCJuB2xY1U3LOJGtMnhRjkBDnFomuzWxdfDqueBq0nHxgh0x7PdVbcZpp79TABB3(IzOpThoucQFBZhnVa(zn37XR62U2rmtoLQXg1tRWDoiNHzkpwSh9qHXvurL(3zCpEzzUUOBUuQpeKevSq31RuJP(fPT(QPiE9pRgToS91xYRx0Kosa)rme6oUZt0dS7MInRiXaqKrEgLKxv5ApMdD50Bb29vMJPp3s0MoO6Z1vNS(Dvg5WFEPbIi39dPbhILHgxM81xwvkvG6DYX6Y1q3UNE8j2z0AvYGqpL)xMX)fKDRbEG)IIgE(8O(xwqlSQ3nuo4SOiClz2gfY2pwfDarQ6OHf1LPlR8P3I0B7tD)GUCLMzSzg3o3(Ktp4xZFSNQOhN4QFMyKoFLFXCcE59rrb4AJD(451tdhPNHa)LgiF3ktZSOeNl9WO4TY6Fk075syG50(KmQv(2f6)ArC)GErqC4GZWjGT29Jo1O5xqRSrG7t0WjDGqKlkn3tkc4zzJq45o7GNV5NnrNBPxIqK6XJbPRcey5OjXMwxVnFvxDQvyzwUSVXeEX(8etCn)ZNPds52Lnt(MKAtHIy68WiQK2NbweX50aQ6PttxtHp(toAkClpRR8DPprlsIv66LYGGdxXCFlClPZeTpPpE)3VMxR0KUGeNi9TWW4iqMmwa3DbvpIQtOuHTHEQXmOBl2ORoviZO2VyE23OYrXSSB5XVVxrI1HZj5zjnYbV(AIV1qkJ5VOecyjvNV2NuVy39RsEPFs91Nx8Xeu2Z4Rv65fXmfLZOGWSkCxenc8FOS)Nnt0y6WI3jVzvH5QEgR23yUU0Q(w8mD)P427tEvYRwN945ynF0V3r)LgqK8KmX)1JtMWRxMGcgCisGj1HfLAWclTe0nGUJIOUW8wHE6MQ)EVC)GX))d'

	-- Profile import
	-- API.RegisterProfile(addonName, profileString, optionalCustomProfileName, optionalCallbackFunction)
	BigWigsAPI.RegisterProfile('LuckyoneUI', (layout == 'main' and profile_main) or profile_healing, (layout == 'main' and name_main) or name_healing, CallbackFunction)

	-- No chat print here
	-- BigWigs will print a message with all important information after the import
end
