local gen = {}

-- Modukes
local moduleManager = mjrequire "hammerstone/state/moduleManager"

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec3xMat3 = mjm.vec3xMat3

function gen:getConfigs()
	local craftable = moduleManager:get("craftable")
	local gameObject = moduleManager:get("gameObject")

	return {
		{
			debug = true,
			description = {
				identifier = "cookedChicken_recipe",
				name = "COoked Chicken + Tallow"
			},
			components = {
				hs_recipe = {
					preview_object = "chickenMeatCooked",
					classification = "craft",
					props = {
						isFoodPreperation = true,
						disabledUntilCraftableResearched = false,
						temporaryToolObjectType = gameObject.typeIndexMap.stick,
						temporaryToolOffset = vec3xMat3(vec3(-0.35,0.0,0.0), craftable.cookingStickRotationOffset),
						temporaryToolRotation = craftable.cookingStickRotation,
					}
				},
				hs_requirements = {
					craft_area_groups = {
						"campfire"
					},
					skills = {
						"campfireCooking"
					},
					resources = {
						{
							resource = "bronzePot",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						},
						{
							resource = "chickenMeat",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						}
					}
				},
				hs_output = {
					output_by_object = {
						{
							input = "bronzePot",
							output = {
								"bronzePot"
							}
						},
						{
							input = "chickenMeat",
							output = {
								"chickenMeatCooked",
								"chickenMeatCooked",
								"chickenMeatCooked",
								"chickenMeatCooked",
								"chickenMeatCooked",
								"chickenMeatCooked",
								"chickenMeatCooked"
							}
						},
						{
							input = "chickenMeatBreast",
							output = {
								"chickenMeatBreastCooked"
							}
						}
					}
				},
				hs_build_sequence = {
					action_sequence = "inspect"
				}
			}
		}
	}
end

return gen