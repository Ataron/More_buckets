-- Registration of buckets for more_buckets
-- Last modification on Thursday, November 20th by Ataron

more_buckets.register_bucket("wood",{
	recipeitem = "default:wood",
	description = "Wood Bucket",
	inventory_image = "wood_bucket.png",
	liquids = {"default:water_source"},
	sounds = default.node_sound_wood_defaults()
})

more_buckets.register_bucket("stone",{
	recipeitem = "default:stone",
	description = "Stone Bucket",
	inventory_image = "stone_bucket.png",
	liquids = {"default:water_source", "default:lava_source"},
	sounds = default.node_sound_wood_defaults()
})
	
more_buckets.register_bucket("bronze",{
	recipeitem = "moreores:bronze_ingot",
	description = "Bronze Bucket",
	inventory_image = "bronze_bucket.png",
	liquids = {"default:water_source", "default:lava_source"},
	sounds = default.node_sound_wood_defaults()
})
	
more_buckets.register_bucket("copper", {
		recipeitem = "default:copper_ingot",
		description = "Copper Bucket",
		inventory_image = "copper_bucket.png",
		liquids = {"default:water_source","default:lava_source"},
		sounds = default.node_sound_wood_defaults()
})
		
more_buckets.register_bucket("gold",{
		recipeitem = "default:gold_ingot",
		description = "Gold Bucket",
		inventory_image = "gold_bucket.png",
		liquids = {"default:water_source", "default:lava_source"},
		sounds = default.node_sound_wood_defaults()
})

more_buckets.register_bucket("glass", {
	recipeitem = "default:glass",
	description = "Glass bucket",
	inventory_image = "glass_bucket.png",
	liquids = {"default:water_source"}
})

more_buckets.register_bucket("mese", {
	recipitem = "default:mese_crystal",
	description = "Mese bucket",
	inventory_image = "mese_bucket.png",
	liquids = {"default:water_source", "default:lava_source"}
})

more_buckets.register_bucket("tree", {
	recipitem = "default:tree",
	description = "Tree bucket",
	inventory_image = "tree_bucket.png",
	liquids = {"default:water_source"}
})

more_buckets.register_bucket("obsidian", {
	recipitem = "default:obsidian",
	description = "Obsidian bucket",
	inventory_image = "obsidian_bucket.png",
	liquids = {"default:water_source", "default:lava_source"}
})

more_buckets.register_bucket("cobble", {
	recipitem = "default:cobble",
	description = "Cobble bucket",
	inventory_image = "cobble_bucket.png",
	liquids = {"default:water_source", "default:lava_source"}
})

more_buckets.register_bucket("diamond", {
	recipitem = "default:diamond",
	description = "Diamond bucket",
	inventory_image = "diamond_bucket.png",
	liquids = {"default:water_source", "default:lava_source"}
})

more_buckets.register_bucket("coal", {
	recipitem = "default:coal_lump",
	description = "Coal bucket",
	inventory_image = "coal_bucket.png",
	liquids = {"default:water_source"}
})

if minetest.get_modpath("moreores") ~= nil then		
	more_buckets.register_bucket("tin",{
		recipeitem = "moreores:tin_ingot",
		description = "Tin Bucket",
		inventory_image = "tin_bucket.png",
		liquids = {"default:water_source"},
		sounds = default.node_sound_wood_defaults()
	})
		more_buckets.register_bucket("silver",{
		recipeitem = "moreores:silver_ingot",
		description = "Silver Bucket",
		inventory_image = "silver_bucket.png",
		liquids = {"default:water_source", "default:lava_source"},
		sounds = default.node_sound_wood_defaults()
	})
	return
end

if minetest.get_modpath("quartz") ~= nil then
	ore_buckets.register_bucket("quartz",{
		recipeitem = "quartz:quartz_crystal",
		description = "Quartz bucket",
		inventory_image = "quartz_bucket.png",
		liquids = {"default:water_source","default:lava_source"},
	})
end