local gen = {}

local stoneTypes = {
	"lime",
	"red",
	"green"
}

local function generateConfig(stoneType)
	local identifier = stoneType .. "_stoneStock"
	return {
		description = {
			identifier = identifier
		},
		components = {
			hs_object = {
				model = identifier,
				link_to_resource = "stoneStock"
			}
		}
	}
end

function gen:getModelRemaps()
	local out = {
		{
			model = "lime_stoneStock",
			base_model ="stoneStock",
			material_remaps = {
				{
					from = "rock",
					to = "limestone"
				}
			}
		},
		{
			model = "red_stoneStock",
			base_model ="stoneStock",
			material_remaps = {
				{
					from = "rock",
					to = "redRock"
				}
			}
		},
		{
			model = "green_stoneStock",
			base_model ="stoneStock",
			material_remaps = {
				{
					from = "rock",
					to = "greenRock"
				}
			}
		}
	}

	return out
end

function gen:getObjectConfigs()
	local out = {}

	-- Basic Stone Stock
	table.insert(out, {
		description = {
			identifier = "stoneStock"
		},
		components = {
			hs_object = {
				model = "stoneStock"
			},
			hs_resource = {
				link_to_storage = "shared_storage"
			}
		}
	})

	-- Variation
	for i, stoneType in ipairs(stoneTypes) do
		table.insert(out, generateConfig(stoneType))
	end

	return out
end


return gen