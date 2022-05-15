#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform vec3 cameraPos;
out vec3 R;

void main()
{   
    // 世界空间中的法线
    vec3 normal_world = mat3(transpose(inverse(model))) * aNormal;
    // 世界空间中的位置
    vec3 pos_world = vec3(model * vec4(aPos, 1.0));

    // 入射向量
    vec3 I = normalize(pos_world - cameraPos);

    // 反射向量
    R = reflect(I, normal_world);

    gl_Position = projection * view * model * vec4(aPos, 1.0);
}