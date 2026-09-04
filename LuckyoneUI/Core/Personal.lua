local _, Private = ...

local pairs = pairs

local _G = _G

-- Luckyone characters by GUID
local Toons = Private.isRetail and {
	-- (1598: LaughingSkull)
	['Player-1598-0F5E4639'] = true, -- [A] Druid
	['Player-1598-0F3E51B0'] = true, -- [A] Druid 2
	['Player-1598-0FBCD9A2'] = true, -- [A] DH
	['Player-1598-0F46FF5A'] = true, -- [H] Evoker
	['Player-1598-0F92E2B9'] = true, -- [H] Evoker 2
	['Player-1598-0BFF3341'] = true, -- [H] DH
	['Player-1598-0BD22704'] = true, -- [H] Priest
	['Player-1598-0BEFA545'] = true, -- [H] Monk
	['Player-1598-0E1A06DE'] = true, -- [H] Rogue
	['Player-1598-0BF2E377'] = true, -- [H] Hunter
	['Player-1598-0BF18248'] = true, -- [H] DK
	['Player-1598-0BFABB95'] = true, -- [H] Mage
	['Player-1598-0E67511D'] = true, -- [H] Paladin
	['Player-1598-0C0DD01B'] = true, -- [H] Warlock
	['Player-1598-0BF8013A'] = true, -- [H] Warrior
	['Player-1598-0BF56103'] = true, -- [H] Shaman
	['Player-1598-0F87B5AA'] = true, -- [A] Priest
} or Private.isMists and {
	-- (4454: Garalon + Shek'zeer)
	['Player-4454-060E2FD9'] = true, -- [H] Mage
	['Player-4454-060E336E'] = true, -- [H] Hunter
	['Player-4454-060E339A'] = true, -- [H] Monk
	['Player-4454-060E4058'] = true, -- [A] Druid
	['Player-4454-060E4064'] = true, -- [A] Priest
	['Player-4454-060E406B'] = true, -- [A] Warlock
	['Player-4454-060E4071'] = true, -- [A] Shaman
	['Player-4454-060E4076'] = true, -- [A] Warrior
	['Player-4454-060E4089'] = true, -- [A] Rogue
	['Player-4454-060E4091'] = true, -- [A] Paladin
	['Player-4454-060E4086'] = true, -- [A] DK
	['Player-4454-060E45B6'] = true, -- [A] Mage
	['Player-4454-060E45EA'] = true, -- [A] Hunter
	-- (4440: Everlook)
	['Player-4440-037C7E29'] = true, -- [A] DK
	['Player-4454-060E3657'] = true, -- [H] Druid
	['Player-4454-060E364E'] = true, -- [H] Priest
	['Player-4454-060E361A'] = true, -- [H] Shaman
} or Private.isTBC and {
	-- (6412: Spineshatter)
	['Player-6412-028A3A6D'] = true, -- [H] Hunter
	['Player-6412-0336641F'] = true, -- [H] Priest
	['Player-6412-02A39E0E'] = true, -- [H] Warlock
	['Player-6412-02BBE8AB'] = true, -- [H] Hunter 2
} or Private.isClassic and {
	-- (5827: Living Flame)
	['Player-5827-0273D732'] = true, -- [A] Hunter
	['Player-5827-0273D63E'] = true, -- [A] Paladin
	['Player-5827-0273D63D'] = true, -- [A] Warlock
	['Player-5827-0273D649'] = true, -- [A] Mage
	['Player-5827-0273D661'] = true, -- [A] Priest
	['Player-5827-0273D65D'] = true, -- [A] Druid
	['Player-5827-0273D63F'] = true, -- [A] Rogue
	['Player-5827-0273D638'] = true, -- [A] Warrior
	['Player-5827-02331C4B'] = true, -- [H] Shaman
	-- (5261: Nek'Rosh)
	['Player-5261-01ADAC25'] = true, -- [H] Rogue
	['Player-5261-019F4B67'] = true, -- [H] Hunter
	['Player-5261-01B3C53A'] = true, -- [H] Mage
	['Player-5261-01B50AC4'] = true, -- [H] Druid
	-- (5233: Firemaw)
	['Player-5233-01D22A72'] = true, -- [H] Hunter
	['Player-5233-01D27011'] = true, -- [H] Druid
}

function Private:HandleToons()
	Private.itsLuckyone = Toons and Toons[Private.myGUID]
	Toons = nil
end

-- ElvDB
local profileKeys = Private.isRetail and {
	['Luckywl - Laughing Skull'] = 'Luckyone Main',
	['Luckypriest - Laughing Skull'] = 'Luckyone Healing',
	['Luckyrogue - Laughing Skull'] = 'Luckyone Main',
	['Luckyone - Laughing Skull'] = 'Luckyone Main',
	['Luckypala - Laughing Skull'] = 'Luckyone Main',
	['Luckyhunter - Laughing Skull'] = 'Luckyone Main',
	['Luckytwo - Laughing Skull'] = 'Luckyone Main',
	['Luckymage - Laughing Skull'] = 'Luckyone Main',
	['Unluckyone - Laughing Skull'] = 'Luckyone Healing',
	['Luckymonkas - Laughing Skull'] = 'Luckyone Main',
	['Taylorswift - Laughing Skull'] = 'Luckyone Main',
	['Notlucky - Laughing Skull'] = 'Luckyone Main',
	['Lucky - Laughing Skull'] = 'Luckyone Main',
	['Luckydk - Laughing Skull'] = 'Luckyone Main',
} or Private.isMists and {
	['Luckymage - Garalon'] = 'Luckyone Main',
	['Luckyone - Garalon'] = 'Luckyone Main',
	['Luckymonk - Garalon'] = 'Luckyone Main',
	["Luckydruid - Shek'zeer"] = 'Luckyone Main',
	["Luckypriest - Shek'zeer"] = 'Luckyone Main',
	["Luckywl - Shek'zeer"] = 'Luckyone Main',
	["Luckyshaman - Shek'zeer"] = 'Luckyone Main',
	["Luckywarrior - Shek'zeer"] = 'Luckyone Main',
	["Luckyrogue - Shek'zeer"] = 'Luckyone Main',
	["Luckypala - Shek'zeer"] = 'Luckyone Main',
	["Luckydk - Shek'zeer"] = 'Luckyone Main',
	["Luckymage - Shek'zeer"] = 'Luckyone Main',
	["Luckyhunter - Shek'zeer"] = 'Luckyone Main',
	['Luckydruid - Norushen'] = 'Luckyone Main',
	['Luckypriest - Norushen'] = 'Luckyone Main',
	['Luckyshaman - Norushen'] = 'Luckyone Main',
	['Luckydk - Everlook'] = 'Luckyone Main',
} or Private.isTBC and {
	['Luckybank - Spineshatter'] = 'Luckyone Main',
	['Luckylock - Spineshatter'] = 'Luckyone Main',
	['Luckyone - Spineshatter'] = 'Luckyone Main',
	['Luckypriest - Spineshatter'] = 'Luckyone Main',
	['Luckytwo - Spineshatter'] = 'Luckyone Main',
} or Private.isClassic and {
	['Ðøñtçhëçkmæ - Living Flame'] = 'Luckyone Main',
	["Lucky - Nek'Rosh"] = 'Luckyone Main',
	['Luckydruid - Living Flame'] = 'Luckyone Main',
	['Luckymage - Living Flame'] = 'Luckyone Main',
	['Luckyone - Living Flame'] = 'Luckyone Main',
	["Luckyone - Nek'Rosh"] = 'Luckyone Main',
	['Luckypriest - Living Flame'] = 'Luckyone Main',
	['Luckyrogue - Living Flame'] = 'Luckyone Main',
	['Luckywarrior - Living Flame'] = 'Luckyone Main',
	['Luckywl - Living Flame'] = 'Luckyone Main',
	['Unluckyone - Living Flame'] = 'Luckyone Main',
	["Unluckyone - Nek'Rosh"] = 'Luckyone Main',
	['Unluckyone - Firemaw'] = 'Luckyone Main',
	['Luckydruid - Firemaw'] = 'Luckyone Main',
}

-- ElvPrivateDB
local privateKeys = Private.isRetail and {
	['Luckywl - Laughing Skull'] = true,
	['Luckypriest - Laughing Skull'] = true,
	['Luckyrogue - Laughing Skull'] = true,
	['Luckyone - Laughing Skull'] = true,
	['Luckypala - Laughing Skull'] = true,
	['Luckyhunter - Laughing Skull'] = true,
	['Luckytwo - Laughing Skull'] = true,
	['Luckymage - Laughing Skull'] = true,
	['Unluckyone - Laughing Skull'] = true,
	['Luckymonkas - Laughing Skull'] = true,
	['Taylorswift - Laughing Skull'] = true,
	['Notlucky - Laughing Skull'] = true,
	['Lucky - Laughing Skull'] = true,
	['Luckydk - Laughing Skull'] = true,
} or Private.isMists and {
	['Luckymage - Garalon'] = true,
	['Luckyone - Garalon'] = true,
	['Luckymonk - Garalon'] = true,
	["Luckydruid - Shek'zeer"] = true,
	["Luckypriest - Shek'zeer"] = true,
	["Luckywl - Shek'zeer"] = true,
	["Luckyshaman - Shek'zeer"] = true,
	["Luckywarrior - Shek'zeer"] = true,
	["Luckyrogue - Shek'zeer"] = true,
	["Luckypala - Shek'zeer"] = true,
	["Luckydk - Shek'zeer"] = true,
	["Luckymage - Shek'zeer"] = true,
	["Luckyhunter - Shek'zeer"] = true,
	['Luckydruid - Norushen'] = true,
	['Luckypriest - Norushen'] = true,
	['Luckyshaman - Norushen'] = true,
	['Luckydk - Everlook'] = true,
} or Private.isTBC and {
	['Luckylock - Spineshatter'] = true,
	['Luckyone - Spineshatter'] = true,
	['Luckypriest - Spineshatter'] = true,
	['Luckytwo - Spineshatter'] = true,
	['Luckybank - Spineshatter'] = true,
} or Private.isClassic and {
	['Luckyone - Living Flame'] = true,
	['Luckymage - Living Flame'] = true,
	['Luckywl - Living Flame'] = true,
	['Luckyrogue - Living Flame'] = true,
	['Luckypriest - Living Flame'] = true,
	['Luckydruid - Living Flame'] = true,
	["Lucky - Nek'Rosh"] = true,
	["Unluckyone - Nek'Rosh"] = true,
	['Ðøñtçhëçkmæ - Living Flame'] = true,
	['Luckywarrior - Living Flame'] = true,
	["Luckyone - Nek'Rosh"] = true,
	['Unluckyone - Living Flame'] = true,
	['Unluckyone - Firemaw'] = true,
	['Luckydruid - Firemaw'] = true,
}

-- LibDualSpec
local dualSpec = Private.isRetail and {
	['Luckymonkas - Laughing Skull'] = {
		'Luckyone Main',
		'Luckyone Healing',
		'Luckyone Main',
		['enabled'] = true,
	},
	['Luckypriest - Laughing Skull'] = {
		'Luckyone Healing',
		'Luckyone Healing',
		'Luckyone Main',
		['enabled'] = true,
	},
	['Unluckyone - Laughing Skull'] = {
		'Luckyone Main',
		'Luckyone Main',
		'Luckyone Healing',
		['enabled'] = true,
	},
	['Luckytwo - Laughing Skull'] = {
		'Luckyone Main',
		'Luckyone Healing',
		'Luckyone Main',
		['enabled'] = true,
	},
	['Luckyone - Laughing Skull'] = {
		'Luckyone Main',
		'Luckyone Main',
		'Luckyone Main',
		'Luckyone Healing',
		['enabled'] = true,
	},
	['Lucky - Laughing Skull'] = {
		'Luckyone Main',
		'Luckyone Healing',
		'Luckyone Main',
		['enabled'] = true,
	},
	['Luckypala - Laughing Skull'] = {
		'Luckyone Healing',
		'Luckyone Main',
		'Luckyone Main',
		['enabled'] = true,
	},
} or Private.isMists and {
	["Luckydruid - Shek'zeer"] = {
		'Luckyone Main',
		'Luckyone Healing',
		['enabled'] = true,
	},
	["Luckypriest - Shek'zeer"] = {
		'Luckyone Main',
		'Luckyone Healing',
		['enabled'] = true,
	},
} or nil

-- Setup the correct profile for each character after installation
function Private:HandleLuckyoneDB()
	if not Private.itsLuckyone then return end

	local ElvDB = _G.ElvDB
	local ElvPrivateDB = _G.ElvPrivateDB
	if not ElvDB or not ElvPrivateDB then return end

	-- ProfileDB
	if profileKeys then
		ElvDB.profileKeys = ElvDB.profileKeys or {}
		for char, profile in pairs(profileKeys) do
			ElvDB.profileKeys[char] = profile
		end
	end

	-- LibDualSpec
	if dualSpec then
		ElvDB.namespaces = ElvDB.namespaces or {}
		local ns = ElvDB.namespaces['LibDualSpec-1.0']
		if not ns then
			ns = {}
			ElvDB.namespaces['LibDualSpec-1.0'] = ns
		end
		ns.char = ns.char or {}
		for char, data in pairs(dualSpec) do
			ns.char[char] = data
		end
	end

	-- PrivateDB (all chars share the installing character's private profile)
	if privateKeys then
		ElvPrivateDB.profileKeys = ElvPrivateDB.profileKeys or {}
		local privateProfile = Private.myNameRealm
		for char in pairs(privateKeys) do
			ElvPrivateDB.profileKeys[char] = privateProfile
		end
	end

	-- Remove the default profile from the list
	if ElvDB.profiles then
		ElvDB.profiles.Default = nil
	end
end
