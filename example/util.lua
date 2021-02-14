local util = {}

util.acquire_camera_focus = hash("acquire_camera_focus")
util.acquire_input_focus = hash("acquire_input_focus")
util.animation_done = hash("animation_done")
util.apply_force = hash("apply_force")
util.async_load = hash("async_load")
util.clear_color = hash("clear_color")
util.collision_response = hash("collision_response")
util.contact_point_response = hash("contact_point_response")
util.disable = hash("disable")
util.draw_debug_text = hash("draw_debug_text")
util.draw_line = hash("draw_line")
util.enable = hash("enable")
util.exit = hash("exit")
util.final = hash("final")
util.init = hash("init")
util.layout_changed = hash("layout_changed")
util.load = hash("load")
util.model_animation_done = hash("model_animation_done")
util.play_animation = hash("play_animation")
util.play_sound = hash("play_sound")
util.proxy_loaded = hash("proxy_loaded")
util.proxy_unloaded = hash("proxy_unloaded")
util.ray_cast_missed = hash("ray_cast_missed")
util.ray_cast_response = hash("ray_cast_response")
util.reboot = hash("reboot")
util.release_camera_focus = hash("release_camera_focus")
util.release_input_focus = hash("release_input_focus")
util.resize = hash("resize")
util.set_camera = hash("set_camera")
util.set_gain = hash("set_gain")
util.set_parent = hash("set_parent")
util.set_time_step = hash("set_time_step")
util.set_update_frequency = hash("set_update_frequency")
util.set_vsync = hash("set_vsync")
util.sound_done = hash("sound_done")
util.spine_animation_done = hash("spine_animation_done")
util.spine_event = hash("spine_event")
util.start_record = hash("start_record")
util.stop_record = hash("stop_record")
util.stop_sound = hash("stop_sound")
util.toggle_physics_debug = hash("toggle_physics_debug")
util.toggle_profile = hash("toggle_profile")
util.trigger_response = hash("trigger_response")
util.unload = hash("unload")
util.window_resized = hash("window_resized")

function util.get_table(rows, columns, value)
	local result = {}
	for i = 1, rows do
		table.insert(result, {})
		for j = 1, columns do
			table.insert(result[i], value)
		end
	end
	return result
end

function util.round(value)
	local ceil = math.ceil(value)
	local floor = math.floor(value)
	if math.abs(ceil - value) > math.abs(value - floor) then
		return floor
	end
	return ceil
end

function util.clamp(min, max, value)
	if value < min then
		return min
	end
	if value > max then
		return max
	end
	return value
end

function util.is_within_bounds(width, height, x, y)
	return 0 < x and x <= width and 0 < y and y <= height
end

util.deque = {}

function util.deque.new()
	return { front = 0, back = -1 }
end

function util.deque.is_empty(deque)
	return deque.front > deque.back
end

function util.deque.front(deque)
	return deque[deque.front]
end

function util.deque.back(deque)
	return deque[deque.back]
end

function util.deque.push_front(deque, value)
	deque.front = deque.front - 1
	deque[deque.front] = value
end

function util.deque.pop_front(deque)
	if deque.front <= deque.back then
		local result = deque[deque.front]
		deque[deque.front] = nil
		deque.front = deque.front + 1
		return result
	end
end

function util.deque.push_back(deque, value)
	deque.back = deque.back + 1
	deque[deque.back] = value
end

function util.deque.pop_back(deque)
	if deque.front <= deque.back then
		local result = deque[deque.back]
		deque[deque.back] = nil
		deque.back = deque.back - 1
		return result
	end
end

return util