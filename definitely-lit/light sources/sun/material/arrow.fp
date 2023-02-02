varying mediump vec3 var_normal;
varying highp vec4 frag_pos;
varying mediump vec3 var_color;

uniform vec4 tint; // the color of the object
uniform vec4 math_vars; // x = 1; y = 0.09; z = 0.0032 and w = 0

// used in case the object has an ambient light
varying mediump vec4 var_light_dir;
uniform mediump vec4 light_dir_color;

// light_options indices are used to store information about how to do lighting (y if 0 tells the shader to do cel shading) 
uniform vec4 light_options;
uniform vec4 cel_shading; // variable used to store up to 4 steps in the cel shading process

uniform lowp sampler2D tex; // the texture of the model (in this case, is a 16x16 wooden floor)
varying mediump vec2 var_tex_coord;

vec3 light_dir_calculation(vec4 light_color, vec3 light_dir, vec3 normal);

void main()
{
    vec3 result = light_dir_calculation(light_dir_color, var_light_dir.xyz, var_normal);
    
    gl_FragColor = vec4((result * tint.xyz) * tint.w, 1);
}

vec3 light_dir_calculation(vec4 light_color, vec3 light_dir, vec3 normal)
{
    // Diffuse light calculations
    float ambient_strength = var_light_dir.w;
    vec3 color = light_color.xyz * light_color.w;
    // diffuse
    float diff = max(dot(normal, light_dir), 0.0);
    // diff = step(0.5, diff);
    vec3 diffuse = (diff * color);
 
    return (diffuse + ambient_strength);
}