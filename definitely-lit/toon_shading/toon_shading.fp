varying mediump vec3 var_normal;
varying highp vec4 frag_pos;
varying mediump vec3 var_color;

#define LIGHT_COUNT 8

varying mediump vec4 var_light_pos[LIGHT_COUNT];
varying mediump vec4 var_light_color[LIGHT_COUNT];
uniform vec4 tint; // the color of the object
uniform vec4 math_vars; // x = 1; y = 0.09; z = 0.0032 and w = 0

// used in case the object has an ambient light
varying mediump vec4 var_light_dir;
uniform mediump vec4 light_dir_color;

// light_options indices are used to store information about how to do lighting (y if 0 tells the shader to do cel shading) 
uniform vec4 light_options;
uniform vec4 cel_shading; // variable used to store up to 4 steps in the cel shading process

varying float ambient_strength;

uniform lowp sampler2D tex0; // the texture of the model 
uniform lowp sampler2D zatoon;
varying mediump vec2 var_tex_coord;

vec3 light_point_calculation(vec3 light_color, vec3 light_pos, vec3 normal, vec3 frag_pos);
vec3 light_dir_calculation(vec3 light_color, vec3 light_dir, vec3 normal);

void main()
{
    vec3 result;

    result = light_dir_calculation(light_dir_color.xyz, var_light_dir.xyz, var_normal);

    for(int i = 0; i < LIGHT_COUNT; i++)
    {
        if(var_light_color[i].w != 0)
            result += light_point_calculation(var_light_color[i].xyz, var_light_pos[i].xyz, var_normal, frag_pos.xyz);
    }
    
    gl_FragColor = vec4((result * tint.xyz) * tint.w, 1);
}

vec3 light_dir_calculation(vec3 light_color, vec3 light_dir, vec3 normal)
{
    float nol = max(dot(normal, light_dir), 0.0);
    vec3 diffuse_light = texture(zatoon, vec2(nol, 0)).rgb * light_color;
    vec3 albedo = texture(tex0, var_tex_coord).xyz;
    return diffuse_light * albedo;
}

vec3 light_point_calculation(vec3 light_color, vec3 light_pos, vec3 normal, vec3 frag_pos)
{    
    vec3 light_dir = normalize(light_pos - frag_pos);
    float nol = max(dot(normal, light_dir), 0.0);
    vec3 diffuse_light = texture(zatoon, vec2(nol, 0)).rgb * light_color;
    vec3 albedo = texture(tex0, var_tex_coord).xyz;

    float light_distance = length(light_pos - frag_pos);
    float attenuation = 1.0 / (1 + 0.9 * light_distance + 0.0032 * (light_distance * light_distance));

    diffuse_light *= attenuation;
 
    return (diffuse_light * albedo);
}