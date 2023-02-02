# DEFinitely lit
## _The quickest way to lit up your 3D scene in Defold!_

Definitly lit is a project contaning examples on how to do a simple and fast lighting system. By default, your mesh can support up to 8 lights plus a directional light.

## Applying light to your scene

- Obviously, you need to have a scene with 3D meshes.
- You will need to every mesh in your scene be lit named as "lit_model" on your scene.
- Apply the either the `smooth_shader` or `toon_shader` material to your mesh and the `light_reciever.script` to the game object that holds the mesh to be lit.
- Add lamps (`lamp.go`) to your scene to have a point light or a `sun.go` to have a sun-like light. Both are discussed in detail later.


## lamp.go
`lamp.go` is an object that has a point light property. Just put one into your scene, mark the `Lit` option as true in the script and the light will be working. You can set its collor in the script too.

## sun.go
This is similar to the lamp.go, but it acts like a constant light source that only emits light in one direction. To change what direction the light is being emitted, you just need to rotate the object itself. The `Color` script property sets the color of the sun, it can be tweaked during runtime, just like a lamp. The w component of the Color adjust how intense the color is. You can have more than one sun per scene, tho only one can be active at a time. You will need to manually set which one is active by going to its script in the editor and setting true to the `Active` option. If more than one sun is active, there's no way to know which one will be active. Currently, there's no way to change which sun is active or deactivate in runtime, unlike lamps which can be activated and deactivated.
The sun will not work if it is inside a collection or another GO, the reason is uknown but it is treated as a bug.

## light_reciever.script
The script that makes meshes get lit has 3 properties: `Sun _OR_ Lamps`, `Sun _AND_ Lamps`, `Tint`. `Sun _AND_ Lamps` tells the script whether the mesh should get light from both sun and lamps, if it is true. If it is false it will get light only from lamps or only from the sun. This is decided by the `Sun _OR_ Lamps` properties, which tells whether the mesh should recieve light from a sun or from lamps. If it is true, it gets light from a sun, if it is false it recieves light from lamps. I believe the `Tint` is pretty self explanatory.

## The lighting materials
There's currently 2 lighting materials for 2 lighting options: the `toon` and the `smooth`, or standard, shader.
- The smooth shader will make the light in the mesh act like a regular light. You can set the ambient value on the material to get more varied results.
- The toon shader gives much more control of how lighting works. It uses an image to configurate how light will be on a certain mesh. The `zatoon` texture should be a texture with indefinite height but it is recommended the width of the image to be 256 pixels wide. It is hard to explain how that image affects the lighting, for that I'd recommend this video to understand: https://www.youtube.com/watch?v=mnxs6CR6Zrk&t=900s&ab_channel=Jasper at 09:04.

## Take note that:
This lighting system got updated from 1.3 to 1.4, since it was broken on 1.4. The lighting system used to support normal mapping, tho it was so broken in 1.4 that it got scrapped. The extension is built for a fishing game im making so it is not so robust as of now, tho I surely plan on updating it and making better, more flexible and faster. If you find any bugs contact me in the Defold forums.


Big thanks to my buddies at Defold Discord server!
