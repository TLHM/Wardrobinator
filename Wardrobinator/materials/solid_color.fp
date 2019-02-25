varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D MY_TEXTURE;
uniform lowp vec4 my_col;
uniform lowp vec4 my_col2;
uniform lowp vec4 stripeVars;
uniform lowp vec4 dotVars;

void main()
{
	// Pre-multiply alpha since all runtime textures already are

	// stripes
	lowp float stripeVal = ceil((cos(var_texcoord0.x*100.0*stripeVars.x)*.5+.5)-stripeVars.y);
	//lowp vec4 stripeColor = vec4(stripeVal*my_col.xyz + (1.0-stripeVal)*my_col2.xyz, my_col.w);

	// stripes
	lowp float hstripeVal = ceil((cos(var_texcoord0.y*100.0*stripeVars.z)*.5+.5)-stripeVars.w);
	//lowp vec4 hstripeColor = vec4(hstripeVal*my_col.xyz + (1.0-hstripeVal)*my_col2.xyz, my_col.w);

	// Dots
	lowp float dotVal = ceil((cos((var_texcoord0.x)*100.0*dotVars.x + dotVars.z)*.25+cos((var_texcoord0.y)*100.0*dotVars.x + dotVars.w)*.25+.5)-dotVars.y);
	//lowp vec4 dotColor = vec4(dotVal*my_col.xyz + (1.0-dotVal)*my_col2.xyz, my_col.w);

	// Combine into our color
	lowp float finalVal = min(min(stripeVal, min(dotVal, hstripeVal)),1.0);
	lowp vec4 finalCol = vec4(finalVal*my_col.xyz + (1.0-finalVal)*my_col2.xyz, my_col.w);
	gl_FragColor = texture2D(MY_TEXTURE, var_texcoord0.xy) * finalCol;
}
