/*
    CRT Shader by EasyMode
    License: GPL
*/

uniform int FrameDirection;
uniform int FrameCount;
uniform vec2 screen_texture_sz; // OutputSize
uniform vec2 color_texture_pow2_sz; // TextureSize
uniform vec2 color_texture_sz; // InputSize
uniform sampler2D color_texture;
varying vec2 TexCoord;

#define GAMMA_INPUT 2.4				//	def - 2.4

void main()
{
	gl_FragColor = pow(vec4(texture2D(color_texture, TexCoord)), vec4(GAMMA_INPUT));
}