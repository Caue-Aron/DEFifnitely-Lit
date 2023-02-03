components {
  id: "light_source"
  component: "/definitely-lit/light sources/sun/sun.model"
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
components {
  id: "arrow"
  component: "/definitely-lit/light sources/sun/arrow.model"
  position {
    x: 0.0
    y: 0.0
    z: 3.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
components {
  id: "sun"
  component: "/definitely-lit/light sources/sun/sun.script"
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
    id: "active"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "intensity"
    value: "4.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
