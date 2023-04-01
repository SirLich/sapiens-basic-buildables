local woodStockGen = {}

local dyeColors = {
	"blue"
}

-- Extend dye colors with additional colors
local clothColors = {
	"blue",
	"red"
}

local function generateCloth(color)
	local identifier = color .. "_cloth"
	return {
		description = {
			identifier = identifier
		},
		components = {
			hs_object = {
				model = identifier
			},
			hs_resource = {
				link_to_resource = "woodCraftingSupplies"
			}
		}
	}
end

local function generateDye(color)
	local identifier = color .. "_dye"
	return {
		description = {
			identifier = identifier
		},
		components = {
			hs_object = {
				model = identifier
			},
			hs_resource = {
				link_to_resource = "redDye"
			}
		}
	}
end

function woodStockGen:getConfigs()
	local configs = {}
	for i, color in ipairs(dyeColors) do
		table.insert(configs, i, generateDye(color))
	end

	for i, color in ipairs(clothColors) do
		table.insert(configs, i, generateCloth(color))
	end
	return configs
end


return woodStockGen