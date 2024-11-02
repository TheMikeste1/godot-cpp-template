#include "gdexample.hpp"
#include <godot_cpp/core/class_db.hpp>

using namespace godot;

void GDExample::_bind_methods() {
}

GDExample::GDExample() {
	// Initialize any variables here.
	timePassed = 0.0;
}

GDExample::~GDExample() {
	// Add your cleanup here.
}

void GDExample::_process(double delta) {
	timePassed += delta;

	Vector2 new_position = Vector2(10.0 + (10.0 * sin(timePassed * 2.0)), 10.0 + (10.0 * cos(timePassed * 1.5)));

	set_position(new_position);
}
