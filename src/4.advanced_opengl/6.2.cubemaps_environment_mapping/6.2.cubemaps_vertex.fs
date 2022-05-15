#version 330 core

out vec4 FragColor;

in vec3 R;

uniform samplerCube skybox;

void main(){
    FragColor = vec4(texture(skybox, R).rgb, 1.0);
}