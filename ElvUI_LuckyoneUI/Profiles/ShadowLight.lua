local L1UI, E, L, V, P, G = unpack(select(2, ...))
if not L1UI.Retail then return end

-- Shadow & Light Profile
function L1UI:GetSLEProfile()

	-- Shadow & Light Version
	local version = GetAddOnMetadata('ElvUI_SLE', 'Version')

	-- Shadow & Light Global DB
	E.global["sle"]["advanced"]["confirmed"] = true
	E.global["sle"]["advanced"]["gameMenu"]["enable"] = false
	E.global["sle"]["advanced"]["general"] = true

	-- Shadow & Light Private DB
	E.private["sle"]["install_complete"] = "4.21"
	E.private["sle"]["module"]["blizzmove"]["enable"] = true
	E.private["sle"]["professions"]["deconButton"]["enable"] = false
	E.private["sle"]["skins"]["objectiveTracker"]["BGbackdrop"] = false
	E.private["sle"]["skins"]["objectiveTracker"]["color"]["g"] = 0.41960784313725
	E.private["sle"]["skins"]["objectiveTracker"]["color"]["r"] = 0.25882352941176
	E.private["sle"]["skins"]["objectiveTracker"]["texture"] = "Minimalist"
	E.private["sle"]["skins"]["objectiveTracker"]["underlineHeight"] = 2
	E.private["sle"]["skins"]["petbattles"]["enable"] = false

	-- Shadow & Light Profile DB
	if version >= '4.22' then
		E.db["sle"]["afk"]["defaultGraphics"]["classCrest"]["enable"] = false
		E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["enable"] = false
		E.db["sle"]["afk"]["defaultGraphics"]["factionLogo"]["enable"] = false
		E.db["sle"]["afk"]["defaultGraphics"]["slLogo"]["enable"] = false
		E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["anchorPoint"] = "CENTER"
		E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["attachTo"] = "SL_BottomPanel"
		E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["yOffset"] = 10
		E.db["sle"]["afk"]["defaultTexts"]["SL_AFKTimePassed"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["anchorPoint"] = "CENTER"
		E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["size"] = 24
		E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["xOffset"] = 0
		E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["yOffset"] = 40
		E.db["sle"]["afk"]["defaultTexts"]["SL_GuildName"]["enable"] = false
		E.db["sle"]["afk"]["defaultTexts"]["SL_GuildName"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_GuildName"]["size"] = 18
		E.db["sle"]["afk"]["defaultTexts"]["SL_GuildRank"]["enable"] = false
		E.db["sle"]["afk"]["defaultTexts"]["SL_GuildRank"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_GuildRank"]["size"] = 18
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerClass"]["enable"] = false
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerClass"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerClass"]["size"] = 18
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerLevel"]["enable"] = false
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerLevel"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerLevel"]["size"] = 18
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["enable"] = false
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["size"] = 26
		E.db["sle"]["afk"]["defaultTexts"]["SL_ScrollFrame"]["enable"] = false
		E.db["sle"]["afk"]["defaultTexts"]["SL_SubText"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_Time"]["font"] = "Expressway"
		E.db["sle"]["afk"]["defaultTexts"]["SL_Time"]["size"] = 20
		E.db["sle"]["afk"]["enable"] = true
		E.db["sle"]["afk"]["playermodel"]["distance"] = 6
	end

	E.db["sle"]["armory"]["character"]["background"]["overlay"] = false
	E.db["sle"]["armory"]["character"]["durability"]["display"] = "Hide"
	E.db["sle"]["armory"]["character"]["durability"]["font"] = "Expressway"
	E.db["sle"]["armory"]["character"]["durability"]["fontSize"] = 11
	E.db["sle"]["armory"]["character"]["enable"] = true
	E.db["sle"]["armory"]["character"]["enchant"]["font"] = "Expressway"
	E.db["sle"]["armory"]["character"]["enchant"]["fontSize"] = 10
	E.db["sle"]["armory"]["character"]["enchant"]["yOffset"] = -2
	E.db["sle"]["armory"]["character"]["gem"]["size"] = 11
	E.db["sle"]["armory"]["character"]["gem"]["xOffset"] = 4
	E.db["sle"]["armory"]["character"]["gradient"]["quality"] = true
	E.db["sle"]["armory"]["character"]["ilvl"]["colorType"] = "QUALITY"
	E.db["sle"]["armory"]["character"]["ilvl"]["font"] = "Expressway"
	E.db["sle"]["armory"]["character"]["ilvl"]["fontSize"] = 11
	E.db["sle"]["armory"]["inspect"]["background"]["overlay"] = false
	E.db["sle"]["armory"]["inspect"]["enable"] = true
	E.db["sle"]["armory"]["inspect"]["enchant"]["font"] = "Expressway"
	E.db["sle"]["armory"]["inspect"]["enchant"]["fontSize"] = 10
	E.db["sle"]["armory"]["inspect"]["enchant"]["yOffset"] = -2
	E.db["sle"]["armory"]["inspect"]["gem"]["size"] = 11
	E.db["sle"]["armory"]["inspect"]["gem"]["xOffset"] = 4
	E.db["sle"]["armory"]["inspect"]["gradient"]["quality"] = true
	E.db["sle"]["armory"]["inspect"]["ilvl"]["colorType"] = "QUALITY"
	E.db["sle"]["armory"]["inspect"]["ilvl"]["font"] = "Expressway"
	E.db["sle"]["armory"]["inspect"]["ilvl"]["fontSize"] = 11
	E.db["sle"]["armory"]["stats"]["catFonts"]["font"] = "Expressway"
	E.db["sle"]["armory"]["stats"]["catFonts"]["outline"] = "OUTLINE"
	E.db["sle"]["armory"]["stats"]["itemLevel"]["font"] = "Expressway"
	E.db["sle"]["armory"]["stats"]["itemLevel"]["outline"] = "OUTLINE"
	E.db["sle"]["armory"]["stats"]["itemLevel"]["size"] = 15
	E.db["sle"]["armory"]["stats"]["statFonts"]["font"] = "Expressway"
	E.db["sle"]["armory"]["stats"]["statFonts"]["outline"] = "OUTLINE"
	E.db["sle"]["armory"]["stats"]["statFonts"]["size"] = 11
	E.db["sle"]["media"]["fonts"]["gossip"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["gossip"]["size"] = 11
	E.db["sle"]["media"]["fonts"]["mail"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["mail"]["size"] = 11
	E.db["sle"]["media"]["fonts"]["objective"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["objective"]["outline"] = "OUTLINE"
	E.db["sle"]["media"]["fonts"]["objective"]["size"] = 11
	E.db["sle"]["media"]["fonts"]["objectiveHeader"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["objectiveHeader"]["outline"] = "OUTLINE"
	E.db["sle"]["media"]["fonts"]["pvp"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["questFontSuperHuge"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["questFontSuperHuge"]["size"] = 22
	E.db["sle"]["media"]["fonts"]["subzone"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["subzone"]["size"] = 24
	E.db["sle"]["media"]["fonts"]["zone"]["font"] = "Expressway"
	E.db["sle"]["media"]["fonts"]["zone"]["size"] = 30
	E.db["sle"]["raidmarkers"]["enable"] = false
	E.db["sle"]["skins"]["objectiveTracker"]["classHeader"] = true
	E.db["sle"]["skins"]["objectiveTracker"]["colorHeader"]["b"] = 1
	E.db["sle"]["skins"]["objectiveTracker"]["colorHeader"]["g"] = 0
	E.db["sle"]["skins"]["objectiveTracker"]["colorHeader"]["r"] = 0.81960784313725
	E.db["sle"]["skins"]["objectiveTracker"]["underlineClass"] = true
	E.db["sle"]["skins"]["talkinghead"]["hide"] = true
end
