local gen = {}

function gen:getRecipeConfigs()
	return {
		{
			debug = true,
			description = {
				identifier = "cloth_recipe",
				name = "Craft Cloth"
			},
			components = {
				hs_recipe = {
					preview_object = "cloth",
					classification = "craft",
					props = {

					}
				},
				hs_requirements = {
					skills = {
						"butchery"
					},
					resources = {
						{
							resource = "woolskin",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						}
					},
					tools = {
						"butcher"
					}
				},
				hs_output = {
					simple_output = {
						"cloth",
						"cloth",
						"cloth"
					}
				},
				hs_build_sequence = {
					build_model = "craftSimple",
					action_sequence = "butcher"
				}
			}
		}
	}
end

return gen