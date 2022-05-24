#version 330 core
layout (location = 0) in vec3 aPos;

uniform mat4 lightSpaceMatrix;
uniform mat4 lightProjMatrix;
uniform mat4 lightViewMatrix;
uniform mat4 model;

void main()
{
    gl_Position = lightProjMatrix * lightViewMatrix * model * vec4(aPos, 1.0);
}