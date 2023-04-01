local gen = {}

-- Modules
local moduleManager = mjrequire "hammerstone/state/moduleManager"

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity

function gen:getConfigs()
	local gameObject = moduleManager:get("gameObject")
	return {
		{
			debug = true,
			description = {
				identifier = "redDye_recipe",
				name = "Craft Red Dye"
			},
			components = {
				hs_recipe = {
					preview_object = "redDye",
					classification = "craft",
					props = {
						dontPickUpRequiredTool = true,
						temporaryToolObjectType = gameObject.typeIndexMap.rockSmall,
						temporaryToolOffset = vec3(0.0,0.01,0.0),
						temporaryToolRotation = mat3Identity,
						placeBuildObjectsInFinalLocationsOnDropOff = true,
					}
				},
				hs_requirements = {
					skills = {
						"grinding"
					},
					resources = {
						{
							resource = "firedBowl",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						},
						{
							resource_group = "dyeIngredients",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						}
					},
					tools = {
						"grinding"
					}
				},
				hs_output = {
					simple_output = {
						"redDye"
					}
				},
				hs_build_sequence = {
					build_model = "craftMedicine",
					build_sequence = "grindingSequence"
				}
			}
		}
	}
end

return gen