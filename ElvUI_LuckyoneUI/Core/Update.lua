local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI

function L1UI:UpdateLayout(layout)

	if not E.db.movers then E.db.movers = {} end

	E.db["unitframe"]["units"]["arena"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["arena"]["healPrediction"]["enable"] = true

	E.db["unitframe"]["units"]["focus"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["focus"]["healPrediction"]["enable"] = true

	E.db["unitframe"]["units"]["party"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["party"]["healPrediction"]["enable"] = true

	E.db["unitframe"]["units"]["pet"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["pet"]["healPrediction"]["enable"] = true

	E.db["unitframe"]["units"]["player"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["player"]["healPrediction"]["enable"] = true

	E.db["unitframe"]["units"]["raid"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["raid"]["healPrediction"]["enable"] = true

	E.db["unitframe"]["units"]["raid40"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["raid40"]["healPrediction"]["enable"] = true

	E.db["unitframe"]["units"]["target"]["healPrediction"]["absorbStyle"] = "WRAPPED"
	E.db["unitframe"]["units"]["target"]["healPrediction"]["enable"] = true

	if layout == 'dps' then

	elseif layout == 'healer' then

	end

	E:StaggeredUpdateAll(nil, true)

	ReloadUI()
end
