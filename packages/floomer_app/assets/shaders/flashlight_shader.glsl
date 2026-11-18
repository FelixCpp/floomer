#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec2 uMouse;
uniform float uRadius;
uniform float uSoftness;

uniform sampler2D uTexture;

out vec4 fragColor;

void main(void) {
    vec2 position = FlutterFragCoord().xy;
    vec2 uv = position / uSize;

    vec4 color = texture(uTexture, uv);

    float dist = distance(position, uMouse);

    float light = 1.0 - smoothstep(
        uRadius - uSoftness,
        uRadius,
        dist
    );

    float darkness = 0.08 + light * 0.92;

    fragColor = vec4(
        color.rgb * darkness,
        color.a
    );
}
