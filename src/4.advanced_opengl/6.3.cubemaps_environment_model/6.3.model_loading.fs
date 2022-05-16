#version 330 core
out vec4 FragColor;

in vec2 TexCoords;
in vec3 Normal;
in vec3 Position;

uniform vec3 cameraPos;
uniform samplerCube skybox;
uniform sampler2D texture_diffuse1;
uniform sampler2D texture_height1;

void main()
{
	vec3 I = normalize(Position - cameraPos);
    vec3 R = reflect(I, normalize(Normal));
	vec4 reflectLight = texture(texture_height1, TexCoords) * texture(skybox, R);

    FragColor = texture(texture_diffuse1, TexCoords);// + reflectLight;
}