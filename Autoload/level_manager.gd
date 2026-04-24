extends Node

var current_tilemap_bounds: Array[Vector2] = []
signal current_tilemaps_changed_signal(bounds: Array[Vector2])

func update_current_tilemap_bounds(bounds: Array[Vector2]):
	current_tilemap_bounds = bounds
	current_tilemaps_changed_signal.emit.call_deferred(bounds)
