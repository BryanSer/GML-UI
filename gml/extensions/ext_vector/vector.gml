#define vector_Create
var vector = array_create(2);
vector[0] = 0;
if(argument0 != undefined){
	vector[0] = argument0;
}
vector[1] = 0;
if(argument1 != undefined){
	vector[1] = argument1;
}
return vector;

#define vector_Length
var vector = argument0;
return sqrt(sqr(vector[0]) + sqr(vector[1]));


#define vector_Unitization
var vector = argument0;
if(vector[0] == 0 && vector[1] == 0){
	return vector;
}
var length = vector_Length(vector);
vector[0] /= length
vector[1] /= length
return vector;

#define vector_SqrLength
var vector = argument0;
return sqr(vector[0]) + sqr(vector[1]);

#define vector_Add
var tt_vector = argument0;
var t_x = argument1;
var t_y = argument2;
tt_vector[0] += t_x
tt_vector[1] += t_y
return tt_vector;

#define vector_Multiply
var vector = argument0;
var m = argument1;
vector[0] *= m
vector[1] *= m
return vector;

#define vector_Multiply_by_Vector
var v1 = argument0;
var v2 = argument1;
return vector_Create(v1[0] * v2[0], v1[1] * v2[1]);

#define vector_Dot
var v1 = argument0;
var v2 = argument1;
return v1[0] * v2[0] + v1[1] * v2[1];

#define vector_ToAngle
var v1 = argument0;
var theta = arctan2(-v1[1], v1[0])
theta = (theta + pi * 2) % (pi * 2)

return radtodeg(theta);

#define vector_FromAngle
var t_angle = argument0 % 360
t_angle = degtorad(t_angle)
var t_y = -1 * sin(t_angle)
var t_x = cos(t_angle)
return vector_Create(t_x, t_y);

#define vector_SymmetryVectory
var v1 = argument0;
var v2 = argument1;

var t_a1 = vector_ToAngle(v1)
var t_a2 = vector_ToAngle(v2)

var t_tar = t_a2 * 2 - t_a1
var t_r = vector_FromAngle(t_tar)

t_r = vector_Multiply(t_r, vector_Length(v1))
return t_r


