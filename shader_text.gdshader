shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float circle1 = distance(vec2(0.5), UV);
	float circle2 = distance(vec2(0.5), UV);
	COLOR.a = step(circle1, 0.1);
	COLOR.a = step(circle1, 0.2);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
