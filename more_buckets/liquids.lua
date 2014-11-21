-- Registration of liquids for more_buckets
-- Last modification on Thursday, November 20th by Mg

-- Default ones
more_buckets.register_liquid({source_name = "default:water_source",filling_texture = "eau_d.png"})
more_buckets.register_liquid({source_name = "default:lava_source",filling_texture = "lava_d.png"})

-- If acid_source exists (it actually is in Carbone), add it
if minetest.registered_nodes["default:acid_source"] then
	more_buckets.register_liquid({source_name = "default:acid_source",filling_texture = "eau_d.png"})
end
if minetest.get_modpath("lulzpack") ~= nil then
	more_buckets.register_liquid({source_name = "lulzpack:meltedlyra_source", filling_texture = "lava_d.png"})
	more_buckets.register_liquid({source_name = "lulzpack:meltedununbet_source", filling_texture = "lava_d.png"})
	more_buckets.register_liquid({source_name = "lulzpack:meltedununset_source", filling_texture = "lava_d.png"})
	more_buckets.register_liquid({source_name = "lulzpack:meltedbretonium_source", filling_texture = "lava_d.png"})
	more_buckets.register_liquid({source_name = "lulzpack:meltediron_source", filling_texture = "lava_d.png"})
	more_buckets.register_liquid({source_name = "lulzpack:meltedununterx_source", filling_texture = "lava_d.png"})
end

-- Liquids from fluide mod
if minetest.get_modpath("fluide") ~= nil then
	more_buckets.register_liquid({source_name = "fluide:seve_source", filling_texture = "lava_d.png"})
	more_buckets.register_liquid({source_name = "fluide:or_source", filling_texture = "lava_d.png"})
	more_buckets.register_liquid({source_name = "fluide:gazole_source", filling_texture = "lava_d.png"})
end