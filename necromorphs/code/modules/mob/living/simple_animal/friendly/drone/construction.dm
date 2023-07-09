/obj/item/bot_assembly/scavbot
	icon = 'necromorphs/icons/mob/animal.dmi'
	name = "incomplete scavanger bot assembly"
	desc = "A frame with an arm attached to it."
	icon_state = "spiderbot_construction1"
	created_name = "Scavanger bot"

/obj/item/bot_assembly/scavbot/attackby(obj/item/W, mob/user, params)
	..()
	switch(build_step)
		if(ASSEMBLY_FIRST_STEP)
			if(istype(W, /obj/item/stack/cable_coil))
				if(!user.temporarilyRemoveItemFromInventory(W))
					return
				to_chat(user,span_notice("You add the [W] to [src]!"))
				qdel(W)
				inhand_icon_state = "spiderbot_construction2"
				icon_state = "spiderbot_construction2"
				desc = "An incomplete scavanger bot assembly with wires."
				build_step++

		if(ASSEMBLY_SECOND_STEP)
			if(istype(W, /obj/item/electronics/apc))
				if(!user.temporarilyRemoveItemFromInventory(W))
					return
				to_chat(user, span_notice("You add [W] to [src]."))
				qdel(W)
				name = "incomplete Scavanger bot assembly"
				inhand_icon_state = "spiderbot_construction3"
				icon_state = "spiderbot_construction3"
				build_step++

		if(ASSEMBLY_THIRD_STEP)
			if(W.tool_behaviour == TOOL_SCREWDRIVER)
				to_chat(user, span_notice("You start screwing the pieces together..."))
				if(W.use_tool(src, user, 40, volume=100))
					var/obj/effect/mob_spawn/ghost_role/drone/scavbot/B = new(drop_location())
					B.name = created_name
					to_chat(user, span_notice("You completed the Scavanger bot."))
					qdel(src)

/datum/crafting_recipe/scavbot
	name = "Scavanger bot"
	result = /obj/effect/mob_spawn/ghost_role/drone/scavbot
	reqs = list(/obj/item/wallframe/apc = 1,
				/obj/item/bodypart/arm/right/robot = 1,
				/obj/item/stack/cable_coil = 15,
				/obj/item/electronics/apc = 1)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 40
	category = CAT_ROBOT
