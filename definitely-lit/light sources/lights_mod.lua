MSG_ACTIVATE_SUN      = hash('activate_sun')
MSG_DEACTIVATE_SUN    = hash('deactivate_sun')

lights = {}
lights.sources = {
  lamp = {},
  sun = {},
  flashlight = {}
}

-- LAMPS
function lights:new_lamp(id)
  self.sources.lamp[id] = {}
end

function lights:update_lamp_position(id, position)
  if self.sources.lamp[id] then
    self.sources.lamp[id].position = position
  end
end

function lights:update_lamp_color(id, color)
  if self.sources.lamp[id] then
    self.sources.lamp[id].color = color
  end
end


-- SUN
function lights:new_sun(id)
  if id and self.sources.sun.id ~= id then

    if self.sources.sun.id then
      msg.post(self.sources.sun.id, hash'disable')
    end

    msg.post(id, hash'enable')
    self.sources.sun.id = id
  end
end

function lights:update_sun_color(color)
  self.sources.sun.color = color
end

function lights:update_sun_rotation(rotation)
  self.sources.sun.rotation = rotation
end

function lights:update_sun_intensity(intensity)
  self.sources.sun.intensity = intensity
end





return lights