/reagent/nutrition/
	name = "nutrients"
	desc = "A source of nutrition."
	color = "#FFFFFF"
	alpha = 255

	metabolism_stomach = 1

	var/nutrition_amount = 0 //Per unit
	var/hydration_amount = 0 //Per unit
	var/nutrition_quality_amount = 0 //Per unit
	var/heal_factor = 2 //Per unit.

	value = 1

	liquid = -0.25

	heated_reagent = /reagent/carbon
	heated_reagent_temp = 300
	heated_reagent_amount = 0
	heated_reagent_mul = 0.01

/reagent/nutrition/New(var/desired_loc)
	//Automatically set value.

	value *= 0.1 + max(0.1,(nutrition_amount-nutrition_quality_amount)*0.035) + max(0,hydration_amount*0.015) + max(0,heal_factor) + max(0,0.05*flavor_strength)

	. = ..()

	value = CEILING(value,0.01)

	//log_debug("The value of [src.type] is now [value] credits per unit.")

	return .

/reagent/nutrition/on_add(var/reagent_container/container,var/amount_added=0,var/current_volume=0)

	. = ..()

	if(amount_added && (container.flags_metabolism & REAGENT_METABOLISM_INGEST) && is_living(container.owner.loc))
		var/mob/living/L = container.owner.loc
		. *= 0.5
		if(nutrition_amount)
			L.add_nutrition(nutrition_amount*.)
		if(hydration_amount)
			L.add_hydration(hydration_amount*.)
		if(nutrition_quality_amount)
			L.add_nutrition_quality(nutrition_quality_amount*.)

	return .


/reagent/nutrition/on_metabolize_stomach(var/atom/owner,var/reagent_container/container,var/starting_volume=0,var/multiplier=1)

	. = ..()

	var/mob/living/L = owner
	if(nutrition_amount)
		L.add_nutrition(nutrition_amount*.)
		if(L.blood_volume < L.blood_volume_max)
			L.blood_volume = clamp(L.blood_volume + nutrition_amount*.*0.1,0,L.blood_volume_max)
			L.queue_health_update = TRUE
	if(hydration_amount)
		L.add_hydration(hydration_amount*.)

	if(heal_factor && owner && owner.health)
		var/amount_to_heal = heal_factor*.

		if(amount_to_heal > 0)
			owner.health.adjust_loss_smart(brute=-amount_to_heal,burn=-amount_to_heal,tox=-amount_to_heal)
		else if(amount_to_heal < 0)
			owner.health.adjust_loss_smart(tox=-amount_to_heal)

	return .