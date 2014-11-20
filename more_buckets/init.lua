-- More_buckets from Ataron and Mg
-- Last modification on Thursday, November 20th by Mg and Ataron

local LIQUID_MAX = 8  --The number of water levels when liquid_finite is enabled
local CREATIVE_HIDDEN = 1 --Only empty buckets are shown in creative inventory ; 1 = only empty ones ; 0 = all

more_buckets = {}
more_buckets.liquids = {}
--more_buckets.bucket_def = {}

more_buckets.register_liquid = function(parameters)
	if parameters.source_name == nil or parameters.filling_texture == nil then
		minetest.log("error", "[more_buckets] Some parameters missing for liquid registration")
		return
	end
	
	minetest.log("action","[more_buckets] Registering liquid "..parameters.source_name)
	more_buckets.liquids[parameters.source_name] = {}
	more_buckets.liquids[parameters.source_name].filling_texture = parameters.filling_texture
	more_buckets.liquids[parameters.source_name].buckets = {}
	
end

dofile(minetest.get_modpath("more_buckets").."/liquids.lua")

local function check_protection(pos, name, text)
	if minetest.is_protected(pos, name) then
		minetest.log("action", (name ~= "" and name or "A mod")
			.. " tried to " .. text
			.. " at protected position "
			.. minetest.pos_to_string(pos)
			.. " with a bucket")
		minetest.record_protection_violation(pos, name)
		return true
	end
	return false
end


function more_buckets.register_bucket(subname, parameters)

	-- parameters = {recipeitem, description, inventory_image, sounds}
	
	-- Critical missing things
	if not subname then
		minetest.log("error", "[more_buckets] No subname given, cannot register bucket")
		return
	elseif parameters == nil then
		minetest.log("error", "[more_buckets] No parameters given, cannot register bucket")
		return
	end
	
	-- Fixing missing things
	if parameters.description == nil or parameters.description == "" then
		parameters.decription = subname.." bucket"
	elseif parameters.inventory_image == nil or parameters.inventory_image == "" then
		parameters.inventory_igame = "bucket_empty.png"
	elseif parameters.liquids == nil then
		parameters.liquids = {"default:water"}
	elseif parameters.sounds == nil then
		parameters.sounds = default.node_sound_wood_defaults()
	end
	
	--more_buckets.bucket_def[subname] = {}
	--more_buckets.bucket_def[subname].liquids = parameters.liquids
	
	for _, v in pairs(parameters.liquids) do
	
		if more_buckets.liquids[v] == nil then
			minetest.log("error","[more_buckets] Unknown liquid "..v.." for more_buckets")
		else	
			
			more_buckets.liquids[v].buckets[subname] = true
			
			minetest.register_craftitem(":more_buckets:bucket_" .. subname.."_"..v:split(":")[2]:split("_")[1], {
				description = parameters.description.."containing "..v:split(":")[2]:split("_")[1],
				inventory_image = parameters.inventory_image.."^"..more_buckets.liquids[v].filling_texture,
				stack_max = 1,
				liquids_pointable = true,
				sounds = parameters.sounds,
				groups = {not_in_creative_inventory = CREATIVE_HIDDEN},
				on_place = function(itemstack, user, pointed_thing)
					local place_liquid = function(pos, node, source, flowing, fullness)
						if check_protection(pos,
								user and user:get_player_name() or "",
								"place "..source) then
							return
						end
						if math.floor(fullness/128) == 1 or
							not minetest.setting_getbool("liquid_finite") then
								minetest.add_node(pos, {name=source,
								param2=fullness})
							return
						elseif node.name == flowing then
							fullness = fullness + node.param2
						elseif node.name == source then
							fullness = LIQUID_MAX
						end

						if fullness >= LIQUID_MAX then
							minetest.add_node(pos, {name=source,
									param2=LIQUID_MAX})
						else
							minetest.add_node(pos, {name=flowing,
									param2=fullness})
						end
					end
					
					-- Must be pointing to node
					if pointed_thing.type ~= "node" then
						return
					end
					-- Check if pointing to a liquid source
					
					p_node = minetest.get_node(pointed_thing.under)
					-- Call the on_rightclick
					local ndef
					if p_node then
						ndef = minetest.registered_nodes[p_node.name]
					end
					
					if ndef and ndef.on_rightclick and
						user and not user:get_player_control().sneak then
						return ndef.on_rightclick(
							pointed_thing.under,
							p_node, user,
							itemstack) or itemstack
					end
						
					-- Check if pointing to a buildable node
					local fullness = tonumber(itemstack:get_metadata())
					if not fullness then fullness = LIQUID_MAX end
					flowing = v:split("_")[1].."flowing"
					
					if ndef and ndef.buildable_to == true then
						-- buildable; replace the node
						place_liquid(pointed_thing.under, node,
								v, flowing, fullness)
						return ItemStack({name = "more_buckets:bucket_"..subname.."_empty", count = user:get_wielded_item():get_count()})
					else
						-- not buildable to; place the liquid above
						-- check if the node above can be replaced
						local node = minetest.get_node_or_nil(pointed_thing.above)
						if node and minetest.registered_nodes[node.name].buildable_to then
							place_liquid(pointed_thing.above,
									node, v,
									flowing, fullness)
							return ItemStack({name = "more_buckets:bucket_"..subname.."_empty", count = user:get_wielded_item():get_count()})
						end
					end
				end
			})
		
		end
		
		-- Register empty bucket
		
		minetest.register_craftitem(":more_buckets:bucket_" .. subname.."_empty", {
				description = parameters.description,
				inventory_image = parameters.inventory_image,
				stack_max = 1,
				liquids_pointable = true,
				sounds = parameters.sounds,
				on_use = function(itemstack, user, pointed_thing)
					-- Must be pointing to node
					if pointed_thing.type ~= "node" then
						return
					end
					-- Check if pointing to a liquid source
					node = minetest.get_node(pointed_thing.under)
					
					if more_buckets.liquids[node.name] and more_buckets.liquids[node.name].buckets[subname] == true then
						minetest.set_node(pointed_thing.under,{name = "air"})
						return ItemStack({name = "more_buckets:bucket_"..subname.."_"..node.name:split(":")[2]:split("_")[1]})
					else
						return
					end
				end,
		})
	end
	
	-- You can register a bucket without any craft
	if parameters.recipeitem ~= nil and parameters.recipeitem ~= "" and minetest.registered_items[parameters.recipeitem] then
		minetest.register_craft({
			output = 'more_buckets:bucket_' .. subname .. "_empty",
			recipe = {
				{ "", "", ""},
				{parameters.recipeitem, "", parameters.recipeitem},
				{ "", parameters.recipeitem, ""},
			},
		})
	end
end


dofile(minetest.get_modpath("more_buckets").."/buckets.lua")
