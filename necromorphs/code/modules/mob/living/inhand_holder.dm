/obj/item/mob_holder/drone/scavbot
	examine_mob = FALSE

/obj/item/mob_holder/drone/scavbot/deposit(mob/living/target_mob)
	. = ..()
	name = "scavenger bot"
	desc = "The drone has folded into a holdable mode"
	icon = 'necromorphs/icons/mob/animal.dmi'
	icon_state = "spiderbot_off"
	worn_icon_state = "spiderbot_back"
	worn_icon = 'necromorphs/icons/mob/animal.dmi'
