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
	vec2 coordinates = vec2(v_vTexcoord.x+(sin((time*3.0)+v_vTexcoord.y*10.0)/20.0),v_vTexcoord.y+(sin(time+v_vTexcoord.y*4.0)/10.0));
	
	//float color_mult = (sin((time*3.0)+v_vTexcoord.y*10.0)/20.0);
    // Normalized pixel coordinates (from 0 to 1)

    // Time varying pixel color
    float col = 0.5 + 
    0.2*cos(1.5*time+v_vTexcoord.x*0.03)+ 
    0.2*cos(6.0*time+v_vTexcoord.x*0.03)*cos(6.0*time+v_vTexcoord.y*0.03);

	
	
	gl_FragColor = texture2D(gm_BaseTexture,coordinates) * vec4(col);
	//if (texture2D(gm_BaseTexture,coordinates) == vec4(0.0,0.0,1.0,1.0)) {
		//gl_FragColor = vec4(randresult,randresult*not_red,randresult*not_red,1.0);
		//}
	
}

