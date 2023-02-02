components {
  id: "script"
  component: "/rendercam/camera.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "orthographic"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "nearZ"
    value: "-1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "farZ"
    value: "1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "viewDistance"
    value: "1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
components {
  id: "move_cam"
  component: "/rendercam/move_cam.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/rendercam/cam model.glb\"\n"
  "material: \"/rendercam/material/cam.material\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"unnamed\"\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
