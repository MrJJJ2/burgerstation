obj/structure/scenery/pinetrees
	name = "pinetree"
	icon = 'icons/obj/structure/flora/pinetrees.dmi'
	icon_state = "pine_1"

	density = 1
	pixel_x = -16
	pixel_y = 0
	layer = LAYER_LARGE_OBJ

	mouse_opacity = 0

	has_transparency_marker = TRUE


obj/structure/scenery/rocks/New()
	..()
	icon_state = "pine_[rand(1,3)]"


obj/structure/scenery/snow_grass
	name = "grass"
	icon = 'icons/obj/structure/flora/snowflora.dmi'
	icon_state = "snowgrass1"
	density = 0


obj/structure/scenery/snow_grass/New()
	..()
	icon_state = "snowgrass[rand(1,3)]"


obj/structure/scenery/snow_bush
	name = "berry bush"
	icon = 'icons/obj/structure/flora/snowflora.dmi'
	icon_state = "snowbush1"
	density = 0
	layer = LAYER_LARGE_OBJ


obj/structure/scenery/snow_bush/New()
	..()
	icon_state = "snowbush[rand(1,3)]"