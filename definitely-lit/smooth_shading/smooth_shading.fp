varying mediump vec3 var_normal;
varying highp vec4 frag_pos;

#define LIGHT_COUNT 8

varying mediump vec4 var_light_pos[LIGHT_COUNT];
varying mediump vec4 var_light_color[LIGHT_COUNT];
uniform vec4 tint; // the color of the object
uniform vec4 math_vars; // x = 1; y = 0.09; z = 0.0032 and w = 0

// used in case the object has an ambient light
varying mediump vec4 var_light_dir;
uniform mediump vec4 light_dir_color;
uniform mediump vec4 ambient;

uniform lowp sampler2D tex; // the texture of the model (in this case, is a 16x16 wooden floor)
varying mediump vec2 var_texcoord;

float ambient_strength = ambient.w;

vec3 light_point_calculation(vec3 light_color, vec4 light_pos, vec3 normal, vec3 frag_pos);
vec3 light_dir_calculation(vec3 light_color, vec4 light_dir, vec3 normal);

void main()
{
    vec3 result;

    result = light_dir_calculation(light_dir_color.rgb, var_light_dir, var_normal);
    for(int i = 0; i < LIGHT_COUNT; i++)
    {
        if(var_light_color[i].w != 0)
            result += light_point_calculation(var_light_color[i].rgb, var_light_pos[i], var_normal, frag_pos.xyz);
    }
    
    gl_FragColor = vec4(result, 1);
}

vec3 light_dir_calculation(vec3 light_color, vec4 light_dir, vec3 normal)
{
    // Diffuse light calculations
    vec3 var_ambient = ambient_strength * (vec3(texture(tex, var_texcoord)) * ambient.rgb);

    // diffuse
    float diff = max(dot(normal, light_dir.xyz), 0.0) * light_dir.a;
    vec3 diffuse = diff * light_color * vec3(texture(tex, var_texcoord));
 
    return (diffuse + var_ambient);
}

vec3 light_point_calculation(vec3 light_color, vec4 light_pos, vec3 normal, vec3 frag_pos)
{
    // Diffuse light calculations
    vec3 var_ambient = ambient_strength * (vec3(texture(tex, var_texcoord)) * ambient.rgb);
  	
    // diffuse 
    vec3 light_dir = normalize(light_pos.xyz - frag_pos);
    float diff = max(dot(normal, light_dir), 0.0) * light_pos.a;
    vec3 diffuse = diff * light_color * vec3(texture(tex, var_texcoord));

    float light_distance = length(light_pos.xyz - frag_pos);
    float attenuation = 1.0 / (1 + 0.9 * light_distance + 0.0032 * (light_distance * light_distance));

    var_ambient *= attenuation;
    diffuse *= attenuation;
 
    return (diffuse + var_ambient);
}