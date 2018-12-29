varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D MY_TEXTURE;
uniform lowp vec4 my_col;

void main()
{
	// Pre-multiply alpha since all runtime textures already are
	lowp vec4 tint_pm = vec4(my_col.xyz , my_col.w);
	gl_FragColor = texture2D(MY_TEXTURE, var_texcoord0.xy) * tint_pm;
}
