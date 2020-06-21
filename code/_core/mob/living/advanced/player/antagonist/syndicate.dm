/mob/living/advanced/player/antagonist/syndicate
	name = "antagonist syndicate operative"
	loadout_to_use = /loadout/syndicate/player_antagonist

/mob/living/advanced/player/antagonist/syndicate/prepare()
	. = ..()
	src.add_organ(/obj/item/organ/internal/implant/hand/left/iff/syndicate)
	src.add_organ(/obj/item/organ/internal/implant/head/loyalty/syndicate)
	src.add_organ(/obj/item/organ/internal/implant/groin/syndicate_explosive)
	to_chat(span("danger","You are a highly skilled syndicate agent tasked with sabotaging and destroying the incoming NanoTrasen forces with extreme prejudice. <h1>An explosive implant was implanted in your head that triggers when you leave the Area of Operations.</h1>"))
	return .


/mob/living/advanced/player/antagonist/syndicate/setup_name()
	name = "Operative [gender == MALE ? FIRST_NAME_MALE : FIRST_NAME_FEMALE] [LAST_NAME]"
	real_name = name
	return TRUE