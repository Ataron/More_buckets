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
	inventory_image = "bucket.png", -- TODO
	liquids = {"default:water_source"}
})

more_buckets.register_bucket("mese", {
	recipitem = "default:mese_crystal",
	description = "Mese bucket",
	inventory_image = "bucket.png", -- TODO
	liquids = {"default:water_source", "default:lava_source"}
})

more_buckets.register_bucket("tree", {
	recipitem = "default:tree",
	description = "Tree bucket",
	inventory_image = "bucket.png", -- TODO
	liquids = {"default:water_source"}
})

more_buckets.register_bucket("obsidian", {
	recipitem = "default:obsidian",
	description = "Obsidian bucket",
	inventory_image = "bucket.png", -- TODO
	liquids = {"default:water_source", "default:lava_source"}
})

more_buckets.register_bucket("cobble", {
	recipitem = "default:cobble",
	description = "Cobble bucket",
	inventory_image = "bucket.png", -- TODO
	liquids = {"default:water_source", "default:lava_source"}
})

more_buckets.register_bucket("mese", {
	recipitem = "default:mese_crystal",
	description = "Mese bucket",
	inventory_image = "bucket.png", -- TODO
	liquids = {"default:water_source", "default:lava_source"}
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