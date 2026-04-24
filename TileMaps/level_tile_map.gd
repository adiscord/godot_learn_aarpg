class_name LevelTileMap extends TileMapLayer

func _ready() -> void:
	LevelManager.update_current_tilemap_bounds([
		Vector2(get_used_rect().position * rendering_quadrant_size),
		Vector2(get_used_rect().end * rendering_quadrant_size)
	])
