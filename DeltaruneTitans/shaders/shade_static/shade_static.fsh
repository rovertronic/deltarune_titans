//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float not_red;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
	vec2 coordinates = vec2(v_vTexcoord.x,v_vTexcoord.y);
	
	float randresult = rand(coordinates+(time*0.01));
	
	gl_FragColor = texture2D(gm_BaseTexture,coordinates);
	if (texture2D(gm_BaseTexture,coordinates) == vec4(0.0,0.0,1.0,1.0)) {
		gl_FragColor = vec4(randresult,randresult*not_red,randresult*not_red,1.0);
		}
	
}
