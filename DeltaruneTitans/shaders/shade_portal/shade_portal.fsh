//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
	vec2 coordinates = vec2(v_vTexcoord.x,v_vTexcoord.y);
	
	float randresult = rand(coordinates+(time*0.01));
	float distresult = distance(coordinates,vec2(0.5));
	
	gl_FragColor = vec4(randresult,randresult/3.0,randresult,1.0) * texture2D(gm_BaseTexture,coordinates);
	
	if (distresult > 0.2+(0.1*sin(time*.05))+(randresult/4.0)) {
		gl_FragColor = vec4(0.0);
		}
}
