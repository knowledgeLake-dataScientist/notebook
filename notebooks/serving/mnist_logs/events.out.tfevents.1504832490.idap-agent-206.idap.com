       гK"	  А·zl╓Abrain.Event:2я	р&@     ис<	·╢╗·zl╓A"│┤
O

tf_examplePlaceholder*
dtype0*
_output_shapes
:*
shape:
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
h
&ParseExample/ParseExample/dense_keys_0Const*
_output_shapes
: *
value	B Bx*
dtype0
Щ
ParseExample/ParseExampleParseExample
tf_exampleParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*
Tdense
2*
Ndense*(
_output_shapes
:         Р*
Nsparse *
dense_shapes	
:Р*
sparse_types
 
[
xIdentityParseExample/ParseExample*
T0*(
_output_shapes
:         Р
n
PlaceholderPlaceholder*
dtype0*'
_output_shapes
:         
*
shape:         

\
zerosConst*
valueB	Р
*    *
dtype0*
_output_shapes
:	Р

~
Variable
VariableV2*
shape:	Р
*
shared_name *
dtype0*
_output_shapes
:	Р
*
	container 
Ъ
Variable/AssignAssignVariablezeros*
T0*
_class
loc:@Variable*
validate_shape(*
_output_shapes
:	Р
*
use_locking(
j
Variable/readIdentityVariable*
T0*
_class
loc:@Variable*
_output_shapes
:	Р

T
zeros_1Const*
valueB
*    *
dtype0*
_output_shapes
:

v

Variable_1
VariableV2*
shared_name *
dtype0*
_output_shapes
:
*
	container *
shape:

Э
Variable_1/AssignAssign
Variable_1zeros_1*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(*
_output_shapes
:

k
Variable_1/readIdentity
Variable_1*
T0*
_class
loc:@Variable_1*
_output_shapes
:

o
truncated_normal/shapeConst*
_output_shapes
:*%
valueB"             *
dtype0
Z
truncated_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
\
truncated_normal/stddevConst*
valueB
 *═╠╠=*
dtype0*
_output_shapes
: 
в
 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*

seed *
T0*
dtype0*&
_output_shapes
: *
seed2 
З
truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*&
_output_shapes
: *
T0
u
truncated_normalAddtruncated_normal/multruncated_normal/mean*
T0*&
_output_shapes
: 
О

Variable_2
VariableV2*
dtype0*&
_output_shapes
: *
	container *
shape: *
shared_name 
▓
Variable_2/AssignAssign
Variable_2truncated_normal*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
w
Variable_2/readIdentity
Variable_2*
T0*
_class
loc:@Variable_2*&
_output_shapes
: 
R
ConstConst*
dtype0*
_output_shapes
: *
valueB *═╠╠=
v

Variable_3
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
Ы
Variable_3/AssignAssign
Variable_3Const*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
k
Variable_3/readIdentity
Variable_3*
T0*
_class
loc:@Variable_3*
_output_shapes
: 
f
Reshape/shapeConst*%
valueB"             *
dtype0*
_output_shapes
:
l
ReshapeReshapexReshape/shape*
T0*
Tshape0*/
_output_shapes
:         
╗
Conv2DConv2DReshapeVariable_2/read*
paddingSAME*/
_output_shapes
:          *
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(
]
addAddConv2DVariable_3/read*
T0*/
_output_shapes
:          
K
ReluReluadd*/
_output_shapes
:          *
T0
д
MaxPoolMaxPoolRelu*
T0*
strides
*
data_formatNHWC*
ksize
*
paddingSAME*/
_output_shapes
:          
q
truncated_normal_1/shapeConst*%
valueB"          @   *
dtype0*
_output_shapes
:
\
truncated_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_1/stddevConst*
valueB
 *═╠╠=*
dtype0*
_output_shapes
: 
ж
"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*

seed *
T0*
dtype0*&
_output_shapes
: @*
seed2 
Н
truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*&
_output_shapes
: @*
T0
{
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0*&
_output_shapes
: @
О

Variable_4
VariableV2*
shape: @*
shared_name *
dtype0*&
_output_shapes
: @*
	container 
┤
Variable_4/AssignAssign
Variable_4truncated_normal_1*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @*
use_locking(
w
Variable_4/readIdentity
Variable_4*
T0*
_class
loc:@Variable_4*&
_output_shapes
: @
T
Const_1Const*
valueB@*═╠╠=*
dtype0*
_output_shapes
:@
v

Variable_5
VariableV2*
dtype0*
_output_shapes
:@*
	container *
shape:@*
shared_name 
Э
Variable_5/AssignAssign
Variable_5Const_1*
_output_shapes
:@*
use_locking(*
T0*
_class
loc:@Variable_5*
validate_shape(
k
Variable_5/readIdentity
Variable_5*
T0*
_class
loc:@Variable_5*
_output_shapes
:@
╜
Conv2D_1Conv2DMaxPoolVariable_4/read*/
_output_shapes
:         @*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
a
add_1AddConv2D_1Variable_5/read*
T0*/
_output_shapes
:         @
O
Relu_1Reluadd_1*
T0*/
_output_shapes
:         @
и
	MaxPool_1MaxPoolRelu_1*
T0*
strides
*
data_formatNHWC*
ksize
*
paddingSAME*/
_output_shapes
:         @
i
truncated_normal_2/shapeConst*
dtype0*
_output_shapes
:*
valueB"@     
\
truncated_normal_2/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_2/stddevConst*
valueB
 *═╠╠=*
dtype0*
_output_shapes
: 
а
"truncated_normal_2/TruncatedNormalTruncatedNormaltruncated_normal_2/shape*
T0*
dtype0* 
_output_shapes
:
└А*
seed2 *

seed 
З
truncated_normal_2/mulMul"truncated_normal_2/TruncatedNormaltruncated_normal_2/stddev*
T0* 
_output_shapes
:
└А
u
truncated_normal_2Addtruncated_normal_2/multruncated_normal_2/mean*
T0* 
_output_shapes
:
└А
В

Variable_6
VariableV2*
shape:
└А*
shared_name *
dtype0* 
_output_shapes
:
└А*
	container 
о
Variable_6/AssignAssign
Variable_6truncated_normal_2*
validate_shape(* 
_output_shapes
:
└А*
use_locking(*
T0*
_class
loc:@Variable_6
q
Variable_6/readIdentity
Variable_6*
T0*
_class
loc:@Variable_6* 
_output_shapes
:
└А
V
Const_2Const*
dtype0*
_output_shapes	
:А*
valueBА*═╠╠=
x

Variable_7
VariableV2*
dtype0*
_output_shapes	
:А*
	container *
shape:А*
shared_name 
Ю
Variable_7/AssignAssign
Variable_7Const_2*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А*
use_locking(
l
Variable_7/readIdentity
Variable_7*
_output_shapes	
:А*
T0*
_class
loc:@Variable_7
`
Reshape_1/shapeConst*
valueB"    @  *
dtype0*
_output_shapes
:
q
	Reshape_1Reshape	MaxPool_1Reshape_1/shape*
T0*
Tshape0*(
_output_shapes
:         └
Е
MatMulMatMul	Reshape_1Variable_6/read*
T0*(
_output_shapes
:         А*
transpose_a( *
transpose_b( 
X
add_2AddMatMulVariable_7/read*
T0*(
_output_shapes
:         А
H
Relu_2Reluadd_2*
T0*(
_output_shapes
:         А
R
Placeholder_1Placeholder*
shape:*
dtype0*
_output_shapes
:
S
dropout/ShapeShapeRelu_2*
_output_shapes
:*
T0*
out_type0
_
dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
_
dropout/random_uniform/maxConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Э
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape*

seed *
T0*
dtype0*(
_output_shapes
:         А*
seed2 
z
dropout/random_uniform/subSubdropout/random_uniform/maxdropout/random_uniform/min*
T0*
_output_shapes
: 
Ц
dropout/random_uniform/mulMul$dropout/random_uniform/RandomUniformdropout/random_uniform/sub*(
_output_shapes
:         А*
T0
И
dropout/random_uniformAdddropout/random_uniform/muldropout/random_uniform/min*(
_output_shapes
:         А*
T0
\
dropout/addAddPlaceholder_1dropout/random_uniform*
T0*
_output_shapes
:
F
dropout/FloorFloordropout/add*
_output_shapes
:*
T0
P
dropout/divRealDivRelu_2Placeholder_1*
T0*
_output_shapes
:
a
dropout/mulMuldropout/divdropout/Floor*
T0*(
_output_shapes
:         А
i
truncated_normal_3/shapeConst*
dtype0*
_output_shapes
:*
valueB"   
   
\
truncated_normal_3/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
^
truncated_normal_3/stddevConst*
valueB
 *═╠╠=*
dtype0*
_output_shapes
: 
Я
"truncated_normal_3/TruncatedNormalTruncatedNormaltruncated_normal_3/shape*

seed *
T0*
dtype0*
_output_shapes
:	А
*
seed2 
Ж
truncated_normal_3/mulMul"truncated_normal_3/TruncatedNormaltruncated_normal_3/stddev*
T0*
_output_shapes
:	А

t
truncated_normal_3Addtruncated_normal_3/multruncated_normal_3/mean*
_output_shapes
:	А
*
T0
А

Variable_8
VariableV2*
dtype0*
_output_shapes
:	А
*
	container *
shape:	А
*
shared_name 
н
Variable_8/AssignAssign
Variable_8truncated_normal_3*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

p
Variable_8/readIdentity
Variable_8*
_output_shapes
:	А
*
T0*
_class
loc:@Variable_8
T
Const_3Const*
dtype0*
_output_shapes
:
*
valueB
*═╠╠=
v

Variable_9
VariableV2*
dtype0*
_output_shapes
:
*
	container *
shape:
*
shared_name 
Э
Variable_9/AssignAssign
Variable_9Const_3*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:

k
Variable_9/readIdentity
Variable_9*
T0*
_class
loc:@Variable_9*
_output_shapes
:

И
MatMul_1MatMuldropout/mulVariable_8/read*'
_output_shapes
:         
*
transpose_a( *
transpose_b( *
T0
Y
add_3AddMatMul_1Variable_9/read*'
_output_shapes
:         
*
T0
F
RankConst*
value	B :*
dtype0*
_output_shapes
: 
J
ShapeShapeadd_3*
T0*
out_type0*
_output_shapes
:
H
Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
L
Shape_1Shapeadd_3*
out_type0*
_output_shapes
:*
T0
G
Sub/yConst*
value	B :*
dtype0*
_output_shapes
: 
:
SubSubRank_1Sub/y*
T0*
_output_shapes
: 
R
Slice/beginPackSub*
T0*

axis *
N*
_output_shapes
:
T

Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
b
SliceSliceShape_1Slice/begin
Slice/size*
Index0*
T0*
_output_shapes
:
b
concat/values_0Const*
dtype0*
_output_shapes
:*
valueB:
         
M
concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
q
concatConcatV2concat/values_0Sliceconcat/axis*
T0*
N*
_output_shapes
:*

Tidx0
l
	Reshape_2Reshapeadd_3concat*
T0*
Tshape0*0
_output_shapes
:                  
H
Rank_2Const*
value	B :*
dtype0*
_output_shapes
: 
R
Shape_2ShapePlaceholder*
_output_shapes
:*
T0*
out_type0
I
Sub_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
>
Sub_1SubRank_2Sub_1/y*
_output_shapes
: *
T0
V
Slice_1/beginPackSub_1*
N*
_output_shapes
:*
T0*

axis 
V
Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
h
Slice_1SliceShape_2Slice_1/beginSlice_1/size*
Index0*
T0*
_output_shapes
:
d
concat_1/values_0Const*
valueB:
         *
dtype0*
_output_shapes
:
O
concat_1/axisConst*
_output_shapes
: *
value	B : *
dtype0
y
concat_1ConcatV2concat_1/values_0Slice_1concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
t
	Reshape_3ReshapePlaceholderconcat_1*
T0*
Tshape0*0
_output_shapes
:                  
Ю
SoftmaxCrossEntropyWithLogitsSoftmaxCrossEntropyWithLogits	Reshape_2	Reshape_3*
T0*?
_output_shapes-
+:         :                  
I
Sub_2/yConst*
value	B :*
dtype0*
_output_shapes
: 
<
Sub_2SubRankSub_2/y*
T0*
_output_shapes
: 
W
Slice_2/beginConst*
_output_shapes
:*
valueB: *
dtype0
U
Slice_2/sizePackSub_2*
T0*

axis *
N*
_output_shapes
:
o
Slice_2SliceShapeSlice_2/beginSlice_2/size*
Index0*
T0*#
_output_shapes
:         
x
	Reshape_4ReshapeSoftmaxCrossEntropyWithLogitsSlice_2*
T0*
Tshape0*#
_output_shapes
:         
Q
Const_4Const*
dtype0*
_output_shapes
:*
valueB: 
^
MeanMean	Reshape_4Const_4*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
T
gradients/ConstConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
k
!gradients/Mean_grad/Reshape/shapeConst*
valueB:*
dtype0*
_output_shapes
:
М
gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes
:
b
gradients/Mean_grad/ShapeShape	Reshape_4*
out_type0*
_output_shapes
:*
T0
Ш
gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:         
d
gradients/Mean_grad/Shape_1Shape	Reshape_4*
_output_shapes
:*
T0*
out_type0
^
gradients/Mean_grad/Shape_2Const*
dtype0*
_output_shapes
: *
valueB 
c
gradients/Mean_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ц
gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
Ъ
gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
_
gradients/Mean_grad/Maximum/yConst*
value	B :*
dtype0*
_output_shapes
: 
В
gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
_output_shapes
: *
T0
А
gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
_output_shapes
: *
T0
n
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
И
gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*#
_output_shapes
:         
{
gradients/Reshape_4_grad/ShapeShapeSoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:
д
 gradients/Reshape_4_grad/ReshapeReshapegradients/Mean_grad/truedivgradients/Reshape_4_grad/Shape*
T0*
Tshape0*#
_output_shapes
:         
}
gradients/zeros_like	ZerosLikeSoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
Ж
;gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
valueB :
         *
dtype0*
_output_shapes
: 
т
7gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims gradients/Reshape_4_grad/Reshape;gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*'
_output_shapes
:         *

Tdim0
╠
0gradients/SoftmaxCrossEntropyWithLogits_grad/mulMul7gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDimsSoftmaxCrossEntropyWithLogits:1*0
_output_shapes
:                  *
T0
c
gradients/Reshape_2_grad/ShapeShapeadd_3*
T0*
out_type0*
_output_shapes
:
╜
 gradients/Reshape_2_grad/ReshapeReshape0gradients/SoftmaxCrossEntropyWithLogits_grad/mulgradients/Reshape_2_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         

b
gradients/add_3_grad/ShapeShapeMatMul_1*
T0*
out_type0*
_output_shapes
:
f
gradients/add_3_grad/Shape_1Const*
valueB:
*
dtype0*
_output_shapes
:
║
*gradients/add_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_3_grad/Shapegradients/add_3_grad/Shape_1*
T0*2
_output_shapes 
:         :         
н
gradients/add_3_grad/SumSum gradients/Reshape_2_grad/Reshape*gradients/add_3_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Э
gradients/add_3_grad/ReshapeReshapegradients/add_3_grad/Sumgradients/add_3_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         

▒
gradients/add_3_grad/Sum_1Sum gradients/Reshape_2_grad/Reshape,gradients/add_3_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ц
gradients/add_3_grad/Reshape_1Reshapegradients/add_3_grad/Sum_1gradients/add_3_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:

m
%gradients/add_3_grad/tuple/group_depsNoOp^gradients/add_3_grad/Reshape^gradients/add_3_grad/Reshape_1
т
-gradients/add_3_grad/tuple/control_dependencyIdentitygradients/add_3_grad/Reshape&^gradients/add_3_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_3_grad/Reshape*'
_output_shapes
:         

█
/gradients/add_3_grad/tuple/control_dependency_1Identitygradients/add_3_grad/Reshape_1&^gradients/add_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_3_grad/Reshape_1*
_output_shapes
:

┴
gradients/MatMul_1_grad/MatMulMatMul-gradients/add_3_grad/tuple/control_dependencyVariable_8/read*
transpose_b(*
T0*(
_output_shapes
:         А*
transpose_a( 
╢
 gradients/MatMul_1_grad/MatMul_1MatMuldropout/mul-gradients/add_3_grad/tuple/control_dependency*
_output_shapes
:	А
*
transpose_a(*
transpose_b( *
T0
t
(gradients/MatMul_1_grad/tuple/group_depsNoOp^gradients/MatMul_1_grad/MatMul!^gradients/MatMul_1_grad/MatMul_1
э
0gradients/MatMul_1_grad/tuple/control_dependencyIdentitygradients/MatMul_1_grad/MatMul)^gradients/MatMul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/MatMul_1_grad/MatMul*(
_output_shapes
:         А
ъ
2gradients/MatMul_1_grad/tuple/control_dependency_1Identity gradients/MatMul_1_grad/MatMul_1)^gradients/MatMul_1_grad/tuple/group_deps*
_output_shapes
:	А
*
T0*3
_class)
'%loc:@gradients/MatMul_1_grad/MatMul_1
t
 gradients/dropout/mul_grad/ShapeShapedropout/div*
T0*
out_type0*#
_output_shapes
:         
x
"gradients/dropout/mul_grad/Shape_1Shapedropout/Floor*#
_output_shapes
:         *
T0*
out_type0
╠
0gradients/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/dropout/mul_grad/Shape"gradients/dropout/mul_grad/Shape_1*
T0*2
_output_shapes 
:         :         
Й
gradients/dropout/mul_grad/mulMul0gradients/MatMul_1_grad/tuple/control_dependencydropout/Floor*
T0*
_output_shapes
:
╖
gradients/dropout/mul_grad/SumSumgradients/dropout/mul_grad/mul0gradients/dropout/mul_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
а
"gradients/dropout/mul_grad/ReshapeReshapegradients/dropout/mul_grad/Sum gradients/dropout/mul_grad/Shape*
_output_shapes
:*
T0*
Tshape0
Й
 gradients/dropout/mul_grad/mul_1Muldropout/div0gradients/MatMul_1_grad/tuple/control_dependency*
_output_shapes
:*
T0
╜
 gradients/dropout/mul_grad/Sum_1Sum gradients/dropout/mul_grad/mul_12gradients/dropout/mul_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
ж
$gradients/dropout/mul_grad/Reshape_1Reshape gradients/dropout/mul_grad/Sum_1"gradients/dropout/mul_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:

+gradients/dropout/mul_grad/tuple/group_depsNoOp#^gradients/dropout/mul_grad/Reshape%^gradients/dropout/mul_grad/Reshape_1
ы
3gradients/dropout/mul_grad/tuple/control_dependencyIdentity"gradients/dropout/mul_grad/Reshape,^gradients/dropout/mul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dropout/mul_grad/Reshape*
_output_shapes
:
ё
5gradients/dropout/mul_grad/tuple/control_dependency_1Identity$gradients/dropout/mul_grad/Reshape_1,^gradients/dropout/mul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dropout/mul_grad/Reshape_1*
_output_shapes
:
f
 gradients/dropout/div_grad/ShapeShapeRelu_2*
out_type0*
_output_shapes
:*
T0
x
"gradients/dropout/div_grad/Shape_1ShapePlaceholder_1*
T0*
out_type0*#
_output_shapes
:         
╠
0gradients/dropout/div_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/dropout/div_grad/Shape"gradients/dropout/div_grad/Shape_1*2
_output_shapes 
:         :         *
T0
Ф
"gradients/dropout/div_grad/RealDivRealDiv3gradients/dropout/mul_grad/tuple/control_dependencyPlaceholder_1*
T0*
_output_shapes
:
╗
gradients/dropout/div_grad/SumSum"gradients/dropout/div_grad/RealDiv0gradients/dropout/div_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
░
"gradients/dropout/div_grad/ReshapeReshapegradients/dropout/div_grad/Sum gradients/dropout/div_grad/Shape*
T0*
Tshape0*(
_output_shapes
:         А
`
gradients/dropout/div_grad/NegNegRelu_2*
T0*(
_output_shapes
:         А
Б
$gradients/dropout/div_grad/RealDiv_1RealDivgradients/dropout/div_grad/NegPlaceholder_1*
T0*
_output_shapes
:
З
$gradients/dropout/div_grad/RealDiv_2RealDiv$gradients/dropout/div_grad/RealDiv_1Placeholder_1*
T0*
_output_shapes
:
г
gradients/dropout/div_grad/mulMul3gradients/dropout/mul_grad/tuple/control_dependency$gradients/dropout/div_grad/RealDiv_2*
T0*
_output_shapes
:
╗
 gradients/dropout/div_grad/Sum_1Sumgradients/dropout/div_grad/mul2gradients/dropout/div_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
ж
$gradients/dropout/div_grad/Reshape_1Reshape gradients/dropout/div_grad/Sum_1"gradients/dropout/div_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0

+gradients/dropout/div_grad/tuple/group_depsNoOp#^gradients/dropout/div_grad/Reshape%^gradients/dropout/div_grad/Reshape_1
√
3gradients/dropout/div_grad/tuple/control_dependencyIdentity"gradients/dropout/div_grad/Reshape,^gradients/dropout/div_grad/tuple/group_deps*(
_output_shapes
:         А*
T0*5
_class+
)'loc:@gradients/dropout/div_grad/Reshape
ё
5gradients/dropout/div_grad/tuple/control_dependency_1Identity$gradients/dropout/div_grad/Reshape_1,^gradients/dropout/div_grad/tuple/group_deps*
_output_shapes
:*
T0*7
_class-
+)loc:@gradients/dropout/div_grad/Reshape_1
Ъ
gradients/Relu_2_grad/ReluGradReluGrad3gradients/dropout/div_grad/tuple/control_dependencyRelu_2*
T0*(
_output_shapes
:         А
`
gradients/add_2_grad/ShapeShapeMatMul*
out_type0*
_output_shapes
:*
T0
g
gradients/add_2_grad/Shape_1Const*
valueB:А*
dtype0*
_output_shapes
:
║
*gradients/add_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_2_grad/Shapegradients/add_2_grad/Shape_1*
T0*2
_output_shapes 
:         :         
л
gradients/add_2_grad/SumSumgradients/Relu_2_grad/ReluGrad*gradients/add_2_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ю
gradients/add_2_grad/ReshapeReshapegradients/add_2_grad/Sumgradients/add_2_grad/Shape*(
_output_shapes
:         А*
T0*
Tshape0
п
gradients/add_2_grad/Sum_1Sumgradients/Relu_2_grad/ReluGrad,gradients/add_2_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ч
gradients/add_2_grad/Reshape_1Reshapegradients/add_2_grad/Sum_1gradients/add_2_grad/Shape_1*
_output_shapes	
:А*
T0*
Tshape0
m
%gradients/add_2_grad/tuple/group_depsNoOp^gradients/add_2_grad/Reshape^gradients/add_2_grad/Reshape_1
у
-gradients/add_2_grad/tuple/control_dependencyIdentitygradients/add_2_grad/Reshape&^gradients/add_2_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_2_grad/Reshape*(
_output_shapes
:         А
▄
/gradients/add_2_grad/tuple/control_dependency_1Identitygradients/add_2_grad/Reshape_1&^gradients/add_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_2_grad/Reshape_1*
_output_shapes	
:А
┐
gradients/MatMul_grad/MatMulMatMul-gradients/add_2_grad/tuple/control_dependencyVariable_6/read*
T0*(
_output_shapes
:         └*
transpose_a( *
transpose_b(
│
gradients/MatMul_grad/MatMul_1MatMul	Reshape_1-gradients/add_2_grad/tuple/control_dependency*
T0* 
_output_shapes
:
└А*
transpose_a(*
transpose_b( 
n
&gradients/MatMul_grad/tuple/group_depsNoOp^gradients/MatMul_grad/MatMul^gradients/MatMul_grad/MatMul_1
х
.gradients/MatMul_grad/tuple/control_dependencyIdentitygradients/MatMul_grad/MatMul'^gradients/MatMul_grad/tuple/group_deps*(
_output_shapes
:         └*
T0*/
_class%
#!loc:@gradients/MatMul_grad/MatMul
у
0gradients/MatMul_grad/tuple/control_dependency_1Identitygradients/MatMul_grad/MatMul_1'^gradients/MatMul_grad/tuple/group_deps* 
_output_shapes
:
└А*
T0*1
_class'
%#loc:@gradients/MatMul_grad/MatMul_1
g
gradients/Reshape_1_grad/ShapeShape	MaxPool_1*
_output_shapes
:*
T0*
out_type0
├
 gradients/Reshape_1_grad/ReshapeReshape.gradients/MatMul_grad/tuple/control_dependencygradients/Reshape_1_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         @
Ї
$gradients/MaxPool_1_grad/MaxPoolGradMaxPoolGradRelu_1	MaxPool_1 gradients/Reshape_1_grad/Reshape*
paddingSAME*/
_output_shapes
:         @*
T0*
data_formatNHWC*
strides
*
ksize

Т
gradients/Relu_1_grad/ReluGradReluGrad$gradients/MaxPool_1_grad/MaxPoolGradRelu_1*
T0*/
_output_shapes
:         @
b
gradients/add_1_grad/ShapeShapeConv2D_1*
T0*
out_type0*
_output_shapes
:
f
gradients/add_1_grad/Shape_1Const*
valueB:@*
dtype0*
_output_shapes
:
║
*gradients/add_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_1_grad/Shapegradients/add_1_grad/Shape_1*
T0*2
_output_shapes 
:         :         
л
gradients/add_1_grad/SumSumgradients/Relu_1_grad/ReluGrad*gradients/add_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
е
gradients/add_1_grad/ReshapeReshapegradients/add_1_grad/Sumgradients/add_1_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         @
п
gradients/add_1_grad/Sum_1Sumgradients/Relu_1_grad/ReluGrad,gradients/add_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ц
gradients/add_1_grad/Reshape_1Reshapegradients/add_1_grad/Sum_1gradients/add_1_grad/Shape_1*
Tshape0*
_output_shapes
:@*
T0
m
%gradients/add_1_grad/tuple/group_depsNoOp^gradients/add_1_grad/Reshape^gradients/add_1_grad/Reshape_1
ъ
-gradients/add_1_grad/tuple/control_dependencyIdentitygradients/add_1_grad/Reshape&^gradients/add_1_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_1_grad/Reshape*/
_output_shapes
:         @
█
/gradients/add_1_grad/tuple/control_dependency_1Identitygradients/add_1_grad/Reshape_1&^gradients/add_1_grad/tuple/group_deps*
_output_shapes
:@*
T0*1
_class'
%#loc:@gradients/add_1_grad/Reshape_1
d
gradients/Conv2D_1_grad/ShapeShapeMaxPool*
T0*
out_type0*
_output_shapes
:
═
+gradients/Conv2D_1_grad/Conv2DBackpropInputConv2DBackpropInputgradients/Conv2D_1_grad/ShapeVariable_4/read-gradients/add_1_grad/tuple/control_dependency*J
_output_shapes8
6:4                                    *
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME
x
gradients/Conv2D_1_grad/Shape_1Const*%
valueB"          @   *
dtype0*
_output_shapes
:
е
,gradients/Conv2D_1_grad/Conv2DBackpropFilterConv2DBackpropFilterMaxPoolgradients/Conv2D_1_grad/Shape_1-gradients/add_1_grad/tuple/control_dependency*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME*&
_output_shapes
: @
Н
(gradients/Conv2D_1_grad/tuple/group_depsNoOp,^gradients/Conv2D_1_grad/Conv2DBackpropInput-^gradients/Conv2D_1_grad/Conv2DBackpropFilter
О
0gradients/Conv2D_1_grad/tuple/control_dependencyIdentity+gradients/Conv2D_1_grad/Conv2DBackpropInput)^gradients/Conv2D_1_grad/tuple/group_deps*
T0*>
_class4
20loc:@gradients/Conv2D_1_grad/Conv2DBackpropInput*/
_output_shapes
:          
Й
2gradients/Conv2D_1_grad/tuple/control_dependency_1Identity,gradients/Conv2D_1_grad/Conv2DBackpropFilter)^gradients/Conv2D_1_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/Conv2D_1_grad/Conv2DBackpropFilter*&
_output_shapes
: @
■
"gradients/MaxPool_grad/MaxPoolGradMaxPoolGradReluMaxPool0gradients/Conv2D_1_grad/tuple/control_dependency*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingSAME*/
_output_shapes
:          
М
gradients/Relu_grad/ReluGradReluGrad"gradients/MaxPool_grad/MaxPoolGradRelu*/
_output_shapes
:          *
T0
^
gradients/add_grad/ShapeShapeConv2D*
out_type0*
_output_shapes
:*
T0
d
gradients/add_grad/Shape_1Const*
valueB: *
dtype0*
_output_shapes
:
┤
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
е
gradients/add_grad/SumSumgradients/Relu_grad/ReluGrad(gradients/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Я
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*/
_output_shapes
:          *
T0*
Tshape0
й
gradients/add_grad/Sum_1Sumgradients/Relu_grad/ReluGrad*gradients/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Р
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
т
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*/
_output_shapes
:          
╙
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1*
_output_shapes
: 
b
gradients/Conv2D_grad/ShapeShapeReshape*
_output_shapes
:*
T0*
out_type0
╟
)gradients/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputgradients/Conv2D_grad/ShapeVariable_2/read+gradients/add_grad/tuple/control_dependency*
use_cudnn_on_gpu(*
paddingSAME*J
_output_shapes8
6:4                                    *
T0*
data_formatNHWC*
strides

v
gradients/Conv2D_grad/Shape_1Const*%
valueB"             *
dtype0*
_output_shapes
:
Я
*gradients/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterReshapegradients/Conv2D_grad/Shape_1+gradients/add_grad/tuple/control_dependency*
use_cudnn_on_gpu(*
paddingSAME*&
_output_shapes
: *
T0*
data_formatNHWC*
strides

З
&gradients/Conv2D_grad/tuple/group_depsNoOp*^gradients/Conv2D_grad/Conv2DBackpropInput+^gradients/Conv2D_grad/Conv2DBackpropFilter
Ж
.gradients/Conv2D_grad/tuple/control_dependencyIdentity)gradients/Conv2D_grad/Conv2DBackpropInput'^gradients/Conv2D_grad/tuple/group_deps*/
_output_shapes
:         *
T0*<
_class2
0.loc:@gradients/Conv2D_grad/Conv2DBackpropInput
Б
0gradients/Conv2D_grad/tuple/control_dependency_1Identity*gradients/Conv2D_grad/Conv2DBackpropFilter'^gradients/Conv2D_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
: 
}
beta1_power/initial_valueConst*
valueB
 *fff?*
_class
loc:@Variable_2*
dtype0*
_output_shapes
: 
О
beta1_power
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@Variable_2*
	container 
н
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
i
beta1_power/readIdentitybeta1_power*
T0*
_class
loc:@Variable_2*
_output_shapes
: 
}
beta2_power/initial_valueConst*
valueB
 *w╛?*
_class
loc:@Variable_2*
dtype0*
_output_shapes
: 
О
beta2_power
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@Variable_2*
	container *
shape: 
н
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
i
beta2_power/readIdentitybeta2_power*
T0*
_class
loc:@Variable_2*
_output_shapes
: 
е
!Variable_2/Adam/Initializer/zerosConst*
_class
loc:@Variable_2*%
valueB *    *
dtype0*&
_output_shapes
: 
▓
Variable_2/Adam
VariableV2*
dtype0*&
_output_shapes
: *
shared_name *
_class
loc:@Variable_2*
	container *
shape: 
═
Variable_2/Adam/AssignAssignVariable_2/Adam!Variable_2/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
Б
Variable_2/Adam/readIdentityVariable_2/Adam*
T0*
_class
loc:@Variable_2*&
_output_shapes
: 
з
#Variable_2/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_2*%
valueB *    *
dtype0*&
_output_shapes
: 
┤
Variable_2/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_2*
	container *
shape: *
dtype0*&
_output_shapes
: 
╙
Variable_2/Adam_1/AssignAssignVariable_2/Adam_1#Variable_2/Adam_1/Initializer/zeros*
validate_shape(*&
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Variable_2
Е
Variable_2/Adam_1/readIdentityVariable_2/Adam_1*&
_output_shapes
: *
T0*
_class
loc:@Variable_2
Н
!Variable_3/Adam/Initializer/zerosConst*
dtype0*
_output_shapes
: *
_class
loc:@Variable_3*
valueB *    
Ъ
Variable_3/Adam
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@Variable_3*
	container *
shape: 
┴
Variable_3/Adam/AssignAssignVariable_3/Adam!Variable_3/Adam/Initializer/zeros*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: *
use_locking(
u
Variable_3/Adam/readIdentityVariable_3/Adam*
T0*
_class
loc:@Variable_3*
_output_shapes
: 
П
#Variable_3/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_3*
valueB *    *
dtype0*
_output_shapes
: 
Ь
Variable_3/Adam_1
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@Variable_3*
	container *
shape: 
╟
Variable_3/Adam_1/AssignAssignVariable_3/Adam_1#Variable_3/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: 
y
Variable_3/Adam_1/readIdentityVariable_3/Adam_1*
T0*
_class
loc:@Variable_3*
_output_shapes
: 
е
!Variable_4/Adam/Initializer/zerosConst*
_class
loc:@Variable_4*%
valueB @*    *
dtype0*&
_output_shapes
: @
▓
Variable_4/Adam
VariableV2*
shape: @*
dtype0*&
_output_shapes
: @*
shared_name *
_class
loc:@Variable_4*
	container 
═
Variable_4/Adam/AssignAssignVariable_4/Adam!Variable_4/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @
Б
Variable_4/Adam/readIdentityVariable_4/Adam*&
_output_shapes
: @*
T0*
_class
loc:@Variable_4
з
#Variable_4/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_4*%
valueB @*    *
dtype0*&
_output_shapes
: @
┤
Variable_4/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_4*
	container *
shape: @*
dtype0*&
_output_shapes
: @
╙
Variable_4/Adam_1/AssignAssignVariable_4/Adam_1#Variable_4/Adam_1/Initializer/zeros*
validate_shape(*&
_output_shapes
: @*
use_locking(*
T0*
_class
loc:@Variable_4
Е
Variable_4/Adam_1/readIdentityVariable_4/Adam_1*&
_output_shapes
: @*
T0*
_class
loc:@Variable_4
Н
!Variable_5/Adam/Initializer/zerosConst*
_class
loc:@Variable_5*
valueB@*    *
dtype0*
_output_shapes
:@
Ъ
Variable_5/Adam
VariableV2*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name *
_class
loc:@Variable_5
┴
Variable_5/Adam/AssignAssignVariable_5/Adam!Variable_5/Adam/Initializer/zeros*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@*
use_locking(
u
Variable_5/Adam/readIdentityVariable_5/Adam*
_output_shapes
:@*
T0*
_class
loc:@Variable_5
П
#Variable_5/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_5*
valueB@*    *
dtype0*
_output_shapes
:@
Ь
Variable_5/Adam_1
VariableV2*
dtype0*
_output_shapes
:@*
shared_name *
_class
loc:@Variable_5*
	container *
shape:@
╟
Variable_5/Adam_1/AssignAssignVariable_5/Adam_1#Variable_5/Adam_1/Initializer/zeros*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@*
use_locking(
y
Variable_5/Adam_1/readIdentityVariable_5/Adam_1*
T0*
_class
loc:@Variable_5*
_output_shapes
:@
Щ
!Variable_6/Adam/Initializer/zerosConst*
dtype0* 
_output_shapes
:
└А*
_class
loc:@Variable_6*
valueB
└А*    
ж
Variable_6/Adam
VariableV2*
dtype0* 
_output_shapes
:
└А*
shared_name *
_class
loc:@Variable_6*
	container *
shape:
└А
╟
Variable_6/Adam/AssignAssignVariable_6/Adam!Variable_6/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А
{
Variable_6/Adam/readIdentityVariable_6/Adam* 
_output_shapes
:
└А*
T0*
_class
loc:@Variable_6
Ы
#Variable_6/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_6*
valueB
└А*    *
dtype0* 
_output_shapes
:
└А
и
Variable_6/Adam_1
VariableV2*
	container *
shape:
└А*
dtype0* 
_output_shapes
:
└А*
shared_name *
_class
loc:@Variable_6
═
Variable_6/Adam_1/AssignAssignVariable_6/Adam_1#Variable_6/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А

Variable_6/Adam_1/readIdentityVariable_6/Adam_1*
_class
loc:@Variable_6* 
_output_shapes
:
└А*
T0
П
!Variable_7/Adam/Initializer/zerosConst*
_class
loc:@Variable_7*
valueBА*    *
dtype0*
_output_shapes	
:А
Ь
Variable_7/Adam
VariableV2*
dtype0*
_output_shapes	
:А*
shared_name *
_class
loc:@Variable_7*
	container *
shape:А
┬
Variable_7/Adam/AssignAssignVariable_7/Adam!Variable_7/Adam/Initializer/zeros*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А*
use_locking(
v
Variable_7/Adam/readIdentityVariable_7/Adam*
T0*
_class
loc:@Variable_7*
_output_shapes	
:А
С
#Variable_7/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_7*
valueBА*    *
dtype0*
_output_shapes	
:А
Ю
Variable_7/Adam_1
VariableV2*
dtype0*
_output_shapes	
:А*
shared_name *
_class
loc:@Variable_7*
	container *
shape:А
╚
Variable_7/Adam_1/AssignAssignVariable_7/Adam_1#Variable_7/Adam_1/Initializer/zeros*
validate_shape(*
_output_shapes	
:А*
use_locking(*
T0*
_class
loc:@Variable_7
z
Variable_7/Adam_1/readIdentityVariable_7/Adam_1*
T0*
_class
loc:@Variable_7*
_output_shapes	
:А
Ч
!Variable_8/Adam/Initializer/zerosConst*
dtype0*
_output_shapes
:	А
*
_class
loc:@Variable_8*
valueB	А
*    
д
Variable_8/Adam
VariableV2*
dtype0*
_output_shapes
:	А
*
shared_name *
_class
loc:@Variable_8*
	container *
shape:	А

╞
Variable_8/Adam/AssignAssignVariable_8/Adam!Variable_8/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

z
Variable_8/Adam/readIdentityVariable_8/Adam*
T0*
_class
loc:@Variable_8*
_output_shapes
:	А

Щ
#Variable_8/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_8*
valueB	А
*    *
dtype0*
_output_shapes
:	А

ж
Variable_8/Adam_1
VariableV2*
shape:	А
*
dtype0*
_output_shapes
:	А
*
shared_name *
_class
loc:@Variable_8*
	container 
╠
Variable_8/Adam_1/AssignAssignVariable_8/Adam_1#Variable_8/Adam_1/Initializer/zeros*
_output_shapes
:	А
*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(
~
Variable_8/Adam_1/readIdentityVariable_8/Adam_1*
T0*
_class
loc:@Variable_8*
_output_shapes
:	А

Н
!Variable_9/Adam/Initializer/zerosConst*
_class
loc:@Variable_9*
valueB
*    *
dtype0*
_output_shapes
:

Ъ
Variable_9/Adam
VariableV2*
dtype0*
_output_shapes
:
*
shared_name *
_class
loc:@Variable_9*
	container *
shape:

┴
Variable_9/Adam/AssignAssignVariable_9/Adam!Variable_9/Adam/Initializer/zeros*
_output_shapes
:
*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(
u
Variable_9/Adam/readIdentityVariable_9/Adam*
T0*
_class
loc:@Variable_9*
_output_shapes
:

П
#Variable_9/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_9*
valueB
*    *
dtype0*
_output_shapes
:

Ь
Variable_9/Adam_1
VariableV2*
_class
loc:@Variable_9*
	container *
shape:
*
dtype0*
_output_shapes
:
*
shared_name 
╟
Variable_9/Adam_1/AssignAssignVariable_9/Adam_1#Variable_9/Adam_1/Initializer/zeros*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:
*
use_locking(*
T0
y
Variable_9/Adam_1/readIdentityVariable_9/Adam_1*
_output_shapes
:
*
T0*
_class
loc:@Variable_9
W
Adam/learning_rateConst*
valueB
 *╖╤8*
dtype0*
_output_shapes
: 
O

Adam/beta1Const*
valueB
 *fff?*
dtype0*
_output_shapes
: 
O

Adam/beta2Const*
valueB
 *w╛?*
dtype0*
_output_shapes
: 
Q
Adam/epsilonConst*
valueB
 *w╠+2*
dtype0*
_output_shapes
: 
ф
 Adam/update_Variable_2/ApplyAdam	ApplyAdam
Variable_2Variable_2/AdamVariable_2/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon0gradients/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_2*
use_nesterov( *&
_output_shapes
: 
╒
 Adam/update_Variable_3/ApplyAdam	ApplyAdam
Variable_3Variable_3/AdamVariable_3/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon-gradients/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_3*
use_nesterov( *
_output_shapes
: 
ц
 Adam/update_Variable_4/ApplyAdam	ApplyAdam
Variable_4Variable_4/AdamVariable_4/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon2gradients/Conv2D_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_4*
use_nesterov( *&
_output_shapes
: @
╫
 Adam/update_Variable_5/ApplyAdam	ApplyAdam
Variable_5Variable_5/AdamVariable_5/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_5*
use_nesterov( *
_output_shapes
:@
▐
 Adam/update_Variable_6/ApplyAdam	ApplyAdam
Variable_6Variable_6/AdamVariable_6/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon0gradients/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_6*
use_nesterov( * 
_output_shapes
:
└А
╪
 Adam/update_Variable_7/ApplyAdam	ApplyAdam
Variable_7Variable_7/AdamVariable_7/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_2_grad/tuple/control_dependency_1*
_class
loc:@Variable_7*
use_nesterov( *
_output_shapes	
:А*
use_locking( *
T0
▀
 Adam/update_Variable_8/ApplyAdam	ApplyAdam
Variable_8Variable_8/AdamVariable_8/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon2gradients/MatMul_1_grad/tuple/control_dependency_1*
_class
loc:@Variable_8*
use_nesterov( *
_output_shapes
:	А
*
use_locking( *
T0
╫
 Adam/update_Variable_9/ApplyAdam	ApplyAdam
Variable_9Variable_9/AdamVariable_9/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_3_grad/tuple/control_dependency_1*
_class
loc:@Variable_9*
use_nesterov( *
_output_shapes
:
*
use_locking( *
T0
Е
Adam/mulMulbeta1_power/read
Adam/beta1!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam!^Adam/update_Variable_8/ApplyAdam!^Adam/update_Variable_9/ApplyAdam*
T0*
_class
loc:@Variable_2*
_output_shapes
: 
Х
Adam/AssignAssignbeta1_powerAdam/mul*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: *
use_locking( 
З

Adam/mul_1Mulbeta2_power/read
Adam/beta2!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam!^Adam/update_Variable_8/ApplyAdam!^Adam/update_Variable_9/ApplyAdam*
T0*
_class
loc:@Variable_2*
_output_shapes
: 
Щ
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: *
use_locking( 
┬
AdamNoOp!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam!^Adam/update_Variable_8/ApplyAdam!^Adam/update_Variable_9/ApplyAdam^Adam/Assign^Adam/Assign_1
R
ArgMax/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
c
ArgMaxArgMaxadd_3ArgMax/dimension*
T0*#
_output_shapes
:         *

Tidx0
T
ArgMax_1/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
m
ArgMax_1ArgMaxPlaceholderArgMax_1/dimension*
T0*#
_output_shapes
:         *

Tidx0
N
EqualEqualArgMaxArgMax_1*
T0	*#
_output_shapes
:         
R
Cast_1CastEqual*

SrcT0
*#
_output_shapes
:         *

DstT0
Q
Const_5Const*
valueB: *
dtype0*
_output_shapes
:
]
Mean_1MeanCast_1Const_5*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
Ь
initNoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Т
save/SaveV2/tensor_namesConst*┼
value╗B╕BVariableB
Variable_1B
Variable_2BVariable_2/AdamBVariable_2/Adam_1B
Variable_3BVariable_3/AdamBVariable_3/Adam_1B
Variable_4BVariable_4/AdamBVariable_4/Adam_1B
Variable_5BVariable_5/AdamBVariable_5/Adam_1B
Variable_6BVariable_6/AdamBVariable_6/Adam_1B
Variable_7BVariable_7/AdamBVariable_7/Adam_1B
Variable_8BVariable_8/AdamBVariable_8/Adam_1B
Variable_9BVariable_9/AdamBVariable_9/Adam_1Bbeta1_powerBbeta2_power*
dtype0*
_output_shapes
:
Ы
save/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
╡
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2Variable_2/AdamVariable_2/Adam_1
Variable_3Variable_3/AdamVariable_3/Adam_1
Variable_4Variable_4/AdamVariable_4/Adam_1
Variable_5Variable_5/AdamVariable_5/Adam_1
Variable_6Variable_6/AdamVariable_6/Adam_1
Variable_7Variable_7/AdamVariable_7/Adam_1
Variable_8Variable_8/AdamVariable_8/Adam_1
Variable_9Variable_9/AdamVariable_9/Adam_1beta1_powerbeta2_power**
dtypes 
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
l
save/RestoreV2/tensor_namesConst*
valueBBVariable*
dtype0*
_output_shapes
:
h
save/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Р
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
Я
save/AssignAssignVariablesave/RestoreV2*
_output_shapes
:	Р
*
use_locking(*
T0*
_class
loc:@Variable*
validate_shape(
p
save/RestoreV2_1/tensor_namesConst*
_output_shapes
:*
valueBB
Variable_1*
dtype0
j
!save/RestoreV2_1/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
в
save/Assign_1Assign
Variable_1save/RestoreV2_1*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(*
_output_shapes
:

p
save/RestoreV2_2/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
Variable_2
j
!save/RestoreV2_2/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
о
save/Assign_2Assign
Variable_2save/RestoreV2_2*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
u
save/RestoreV2_3/tensor_namesConst*$
valueBBVariable_2/Adam*
dtype0*
_output_shapes
:
j
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2
│
save/Assign_3AssignVariable_2/Adamsave/RestoreV2_3*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
w
save/RestoreV2_4/tensor_namesConst*
dtype0*
_output_shapes
:*&
valueBBVariable_2/Adam_1
j
!save/RestoreV2_4/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
╡
save/Assign_4AssignVariable_2/Adam_1save/RestoreV2_4*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
p
save/RestoreV2_5/tensor_namesConst*
valueBB
Variable_3*
dtype0*
_output_shapes
:
j
!save/RestoreV2_5/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes
:*
dtypes
2
в
save/Assign_5Assign
Variable_3save/RestoreV2_5*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: *
use_locking(
u
save/RestoreV2_6/tensor_namesConst*$
valueBBVariable_3/Adam*
dtype0*
_output_shapes
:
j
!save/RestoreV2_6/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
з
save/Assign_6AssignVariable_3/Adamsave/RestoreV2_6*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
w
save/RestoreV2_7/tensor_namesConst*
dtype0*
_output_shapes
:*&
valueBBVariable_3/Adam_1
j
!save/RestoreV2_7/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes
:*
dtypes
2
й
save/Assign_7AssignVariable_3/Adam_1save/RestoreV2_7*
use_locking(*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: 
p
save/RestoreV2_8/tensor_namesConst*
_output_shapes
:*
valueBB
Variable_4*
dtype0
j
!save/RestoreV2_8/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
о
save/Assign_8Assign
Variable_4save/RestoreV2_8*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @
u
save/RestoreV2_9/tensor_namesConst*$
valueBBVariable_4/Adam*
dtype0*
_output_shapes
:
j
!save/RestoreV2_9/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
_output_shapes
:*
dtypes
2
│
save/Assign_9AssignVariable_4/Adamsave/RestoreV2_9*
validate_shape(*&
_output_shapes
: @*
use_locking(*
T0*
_class
loc:@Variable_4
x
save/RestoreV2_10/tensor_namesConst*&
valueBBVariable_4/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_10/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
_output_shapes
:*
dtypes
2
╖
save/Assign_10AssignVariable_4/Adam_1save/RestoreV2_10*&
_output_shapes
: @*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(
q
save/RestoreV2_11/tensor_namesConst*
valueBB
Variable_5*
dtype0*
_output_shapes
:
k
"save/RestoreV2_11/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
_output_shapes
:*
dtypes
2
д
save/Assign_11Assign
Variable_5save/RestoreV2_11*
use_locking(*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@
v
save/RestoreV2_12/tensor_namesConst*$
valueBBVariable_5/Adam*
dtype0*
_output_shapes
:
k
"save/RestoreV2_12/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Щ
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
_output_shapes
:*
dtypes
2
й
save/Assign_12AssignVariable_5/Adamsave/RestoreV2_12*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0
x
save/RestoreV2_13/tensor_namesConst*&
valueBBVariable_5/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_13/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Щ
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
_output_shapes
:*
dtypes
2
л
save/Assign_13AssignVariable_5/Adam_1save/RestoreV2_13*
use_locking(*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@
q
save/RestoreV2_14/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
Variable_6
k
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Щ
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
_output_shapes
:*
dtypes
2
к
save/Assign_14Assign
Variable_6save/RestoreV2_14*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А
v
save/RestoreV2_15/tensor_namesConst*$
valueBBVariable_6/Adam*
dtype0*
_output_shapes
:
k
"save/RestoreV2_15/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
_output_shapes
:*
dtypes
2
п
save/Assign_15AssignVariable_6/Adamsave/RestoreV2_15*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А
x
save/RestoreV2_16/tensor_namesConst*&
valueBBVariable_6/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_16/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
▒
save/Assign_16AssignVariable_6/Adam_1save/RestoreV2_16*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А*
use_locking(*
T0
q
save/RestoreV2_17/tensor_namesConst*
valueBB
Variable_7*
dtype0*
_output_shapes
:
k
"save/RestoreV2_17/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
_output_shapes
:*
dtypes
2
е
save/Assign_17Assign
Variable_7save/RestoreV2_17*
use_locking(*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А
v
save/RestoreV2_18/tensor_namesConst*$
valueBBVariable_7/Adam*
dtype0*
_output_shapes
:
k
"save/RestoreV2_18/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
_output_shapes
:*
dtypes
2
к
save/Assign_18AssignVariable_7/Adamsave/RestoreV2_18*
use_locking(*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А
x
save/RestoreV2_19/tensor_namesConst*&
valueBBVariable_7/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_19/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
_output_shapes
:*
dtypes
2
м
save/Assign_19AssignVariable_7/Adam_1save/RestoreV2_19*
validate_shape(*
_output_shapes	
:А*
use_locking(*
T0*
_class
loc:@Variable_7
q
save/RestoreV2_20/tensor_namesConst*
valueBB
Variable_8*
dtype0*
_output_shapes
:
k
"save/RestoreV2_20/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
_output_shapes
:*
dtypes
2
й
save/Assign_20Assign
Variable_8save/RestoreV2_20*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

v
save/RestoreV2_21/tensor_namesConst*$
valueBBVariable_8/Adam*
dtype0*
_output_shapes
:
k
"save/RestoreV2_21/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
_output_shapes
:*
dtypes
2
о
save/Assign_21AssignVariable_8/Adamsave/RestoreV2_21*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

x
save/RestoreV2_22/tensor_namesConst*&
valueBBVariable_8/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_22/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
_output_shapes
:*
dtypes
2
░
save/Assign_22AssignVariable_8/Adam_1save/RestoreV2_22*
validate_shape(*
_output_shapes
:	А
*
use_locking(*
T0*
_class
loc:@Variable_8
q
save/RestoreV2_23/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
Variable_9
k
"save/RestoreV2_23/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
_output_shapes
:*
dtypes
2
д
save/Assign_23Assign
Variable_9save/RestoreV2_23*
_output_shapes
:
*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(
v
save/RestoreV2_24/tensor_namesConst*$
valueBBVariable_9/Adam*
dtype0*
_output_shapes
:
k
"save/RestoreV2_24/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_24	RestoreV2
save/Constsave/RestoreV2_24/tensor_names"save/RestoreV2_24/shape_and_slices*
_output_shapes
:*
dtypes
2
й
save/Assign_24AssignVariable_9/Adamsave/RestoreV2_24*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:

x
save/RestoreV2_25/tensor_namesConst*&
valueBBVariable_9/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_25/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Щ
save/RestoreV2_25	RestoreV2
save/Constsave/RestoreV2_25/tensor_names"save/RestoreV2_25/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save/Assign_25AssignVariable_9/Adam_1save/RestoreV2_25*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:

r
save/RestoreV2_26/tensor_namesConst* 
valueBBbeta1_power*
dtype0*
_output_shapes
:
k
"save/RestoreV2_26/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_26	RestoreV2
save/Constsave/RestoreV2_26/tensor_names"save/RestoreV2_26/shape_and_slices*
_output_shapes
:*
dtypes
2
б
save/Assign_26Assignbeta1_powersave/RestoreV2_26*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
r
save/RestoreV2_27/tensor_namesConst* 
valueBBbeta2_power*
dtype0*
_output_shapes
:
k
"save/RestoreV2_27/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_27	RestoreV2
save/Constsave/RestoreV2_27/tensor_names"save/RestoreV2_27/shape_and_slices*
_output_shapes
:*
dtypes
2
б
save/Assign_27Assignbeta2_powersave/RestoreV2_27*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
ш
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27
Ю
init_1NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign
Ю
init_2NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign
Ю
init_3NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign"8@9°7     ┐~zj	R└·zl╓AJЕю
х&╚&
9
Add
x"T
y"T
z"T"
Ttype:
2	
ы
	ApplyAdam
var"TА	
m"TА	
v"TА
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"TА"
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
l
ArgMax

input"T
	dimension"Tidx

output	"
Ttype:
2	"
Tidxtype0:
2	
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
╚
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
ю
Conv2DBackpropFilter

input"T
filter_sizes
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
э
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
A
Equal
x"T
y"T
z
"
Ttype:
2	
Р
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
+
Floor
x"T
y"T"
Ttype:
2
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
┼
MaxPool

input"T
output"T"
Ttype0:
2		"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
ы
MaxPoolGrad

orig_input"T
orig_output"T	
grad"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype0:
2		
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	Р
К
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
<
Mul
x"T
y"T
z"T"
Ttype:
2	Р
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
я
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
К
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
A
Relu
features"T
activations"T"
Ttype:
2		
S
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
l
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
i
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
i
SoftmaxCrossEntropyWithLogits
features"T
labels"T	
loss"T
backprop"T"
Ttype:
2
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
Й
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И
&
	ZerosLike
x"T
y"T"	
Ttype*1.2.12v1.2.0-5-g435cdfc│┤
O

tf_examplePlaceholder*
_output_shapes
:*
shape:*
dtype0
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
dtype0*
_output_shapes
: *
valueB 
h
&ParseExample/ParseExample/dense_keys_0Const*
dtype0*
_output_shapes
: *
value	B Bx
Щ
ParseExample/ParseExampleParseExample
tf_exampleParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*
Tdense
2*
Ndense*(
_output_shapes
:         Р*
Nsparse *
dense_shapes	
:Р*
sparse_types
 
[
xIdentityParseExample/ParseExample*(
_output_shapes
:         Р*
T0
n
PlaceholderPlaceholder*
dtype0*'
_output_shapes
:         
*
shape:         

\
zerosConst*
valueB	Р
*    *
dtype0*
_output_shapes
:	Р

~
Variable
VariableV2*
shape:	Р
*
shared_name *
dtype0*
_output_shapes
:	Р
*
	container 
Ъ
Variable/AssignAssignVariablezeros*
use_locking(*
T0*
_class
loc:@Variable*
validate_shape(*
_output_shapes
:	Р

j
Variable/readIdentityVariable*
T0*
_class
loc:@Variable*
_output_shapes
:	Р

T
zeros_1Const*
_output_shapes
:
*
valueB
*    *
dtype0
v

Variable_1
VariableV2*
shape:
*
shared_name *
dtype0*
_output_shapes
:
*
	container 
Э
Variable_1/AssignAssign
Variable_1zeros_1*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(*
_output_shapes
:

k
Variable_1/readIdentity
Variable_1*
T0*
_class
loc:@Variable_1*
_output_shapes
:

o
truncated_normal/shapeConst*
dtype0*
_output_shapes
:*%
valueB"             
Z
truncated_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
\
truncated_normal/stddevConst*
valueB
 *═╠╠=*
dtype0*
_output_shapes
: 
в
 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*&
_output_shapes
: *
seed2 *

seed *
T0*
dtype0
З
truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*&
_output_shapes
: *
T0
u
truncated_normalAddtruncated_normal/multruncated_normal/mean*
T0*&
_output_shapes
: 
О

Variable_2
VariableV2*
shape: *
shared_name *
dtype0*&
_output_shapes
: *
	container 
▓
Variable_2/AssignAssign
Variable_2truncated_normal*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
w
Variable_2/readIdentity
Variable_2*
T0*
_class
loc:@Variable_2*&
_output_shapes
: 
R
ConstConst*
valueB *═╠╠=*
dtype0*
_output_shapes
: 
v

Variable_3
VariableV2*
shape: *
shared_name *
dtype0*
_output_shapes
: *
	container 
Ы
Variable_3/AssignAssign
Variable_3Const*
use_locking(*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: 
k
Variable_3/readIdentity
Variable_3*
T0*
_class
loc:@Variable_3*
_output_shapes
: 
f
Reshape/shapeConst*%
valueB"             *
dtype0*
_output_shapes
:
l
ReshapeReshapexReshape/shape*/
_output_shapes
:         *
T0*
Tshape0
╗
Conv2DConv2DReshapeVariable_2/read*
paddingSAME*/
_output_shapes
:          *
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(
]
addAddConv2DVariable_3/read*/
_output_shapes
:          *
T0
K
ReluReluadd*
T0*/
_output_shapes
:          
д
MaxPoolMaxPoolRelu*
ksize
*
paddingSAME*/
_output_shapes
:          *
T0*
strides
*
data_formatNHWC
q
truncated_normal_1/shapeConst*%
valueB"          @   *
dtype0*
_output_shapes
:
\
truncated_normal_1/meanConst*
_output_shapes
: *
valueB
 *    *
dtype0
^
truncated_normal_1/stddevConst*
_output_shapes
: *
valueB
 *═╠╠=*
dtype0
ж
"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*
T0*
dtype0*&
_output_shapes
: @*
seed2 *

seed 
Н
truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*
T0*&
_output_shapes
: @
{
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0*&
_output_shapes
: @
О

Variable_4
VariableV2*
dtype0*&
_output_shapes
: @*
	container *
shape: @*
shared_name 
┤
Variable_4/AssignAssign
Variable_4truncated_normal_1*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @
w
Variable_4/readIdentity
Variable_4*
T0*
_class
loc:@Variable_4*&
_output_shapes
: @
T
Const_1Const*
valueB@*═╠╠=*
dtype0*
_output_shapes
:@
v

Variable_5
VariableV2*
_output_shapes
:@*
	container *
shape:@*
shared_name *
dtype0
Э
Variable_5/AssignAssign
Variable_5Const_1*
use_locking(*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@
k
Variable_5/readIdentity
Variable_5*
T0*
_class
loc:@Variable_5*
_output_shapes
:@
╜
Conv2D_1Conv2DMaxPoolVariable_4/read*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:         @*
T0
a
add_1AddConv2D_1Variable_5/read*/
_output_shapes
:         @*
T0
O
Relu_1Reluadd_1*
T0*/
_output_shapes
:         @
и
	MaxPool_1MaxPoolRelu_1*
ksize
*
paddingSAME*/
_output_shapes
:         @*
T0*
strides
*
data_formatNHWC
i
truncated_normal_2/shapeConst*
valueB"@     *
dtype0*
_output_shapes
:
\
truncated_normal_2/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_2/stddevConst*
valueB
 *═╠╠=*
dtype0*
_output_shapes
: 
а
"truncated_normal_2/TruncatedNormalTruncatedNormaltruncated_normal_2/shape*

seed *
T0*
dtype0* 
_output_shapes
:
└А*
seed2 
З
truncated_normal_2/mulMul"truncated_normal_2/TruncatedNormaltruncated_normal_2/stddev*
T0* 
_output_shapes
:
└А
u
truncated_normal_2Addtruncated_normal_2/multruncated_normal_2/mean*
T0* 
_output_shapes
:
└А
В

Variable_6
VariableV2*
shape:
└А*
shared_name *
dtype0* 
_output_shapes
:
└А*
	container 
о
Variable_6/AssignAssign
Variable_6truncated_normal_2*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А
q
Variable_6/readIdentity
Variable_6*
T0*
_class
loc:@Variable_6* 
_output_shapes
:
└А
V
Const_2Const*
valueBА*═╠╠=*
dtype0*
_output_shapes	
:А
x

Variable_7
VariableV2*
dtype0*
_output_shapes	
:А*
	container *
shape:А*
shared_name 
Ю
Variable_7/AssignAssign
Variable_7Const_2*
validate_shape(*
_output_shapes	
:А*
use_locking(*
T0*
_class
loc:@Variable_7
l
Variable_7/readIdentity
Variable_7*
_output_shapes	
:А*
T0*
_class
loc:@Variable_7
`
Reshape_1/shapeConst*
valueB"    @  *
dtype0*
_output_shapes
:
q
	Reshape_1Reshape	MaxPool_1Reshape_1/shape*
T0*
Tshape0*(
_output_shapes
:         └
Е
MatMulMatMul	Reshape_1Variable_6/read*
T0*(
_output_shapes
:         А*
transpose_a( *
transpose_b( 
X
add_2AddMatMulVariable_7/read*
T0*(
_output_shapes
:         А
H
Relu_2Reluadd_2*
T0*(
_output_shapes
:         А
R
Placeholder_1Placeholder*
dtype0*
_output_shapes
:*
shape:
S
dropout/ShapeShapeRelu_2*
T0*
out_type0*
_output_shapes
:
_
dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
_
dropout/random_uniform/maxConst*
_output_shapes
: *
valueB
 *  А?*
dtype0
Э
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape*
T0*
dtype0*(
_output_shapes
:         А*
seed2 *

seed 
z
dropout/random_uniform/subSubdropout/random_uniform/maxdropout/random_uniform/min*
T0*
_output_shapes
: 
Ц
dropout/random_uniform/mulMul$dropout/random_uniform/RandomUniformdropout/random_uniform/sub*
T0*(
_output_shapes
:         А
И
dropout/random_uniformAdddropout/random_uniform/muldropout/random_uniform/min*
T0*(
_output_shapes
:         А
\
dropout/addAddPlaceholder_1dropout/random_uniform*
T0*
_output_shapes
:
F
dropout/FloorFloordropout/add*
_output_shapes
:*
T0
P
dropout/divRealDivRelu_2Placeholder_1*
T0*
_output_shapes
:
a
dropout/mulMuldropout/divdropout/Floor*(
_output_shapes
:         А*
T0
i
truncated_normal_3/shapeConst*
valueB"   
   *
dtype0*
_output_shapes
:
\
truncated_normal_3/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_3/stddevConst*
valueB
 *═╠╠=*
dtype0*
_output_shapes
: 
Я
"truncated_normal_3/TruncatedNormalTruncatedNormaltruncated_normal_3/shape*
dtype0*
_output_shapes
:	А
*
seed2 *

seed *
T0
Ж
truncated_normal_3/mulMul"truncated_normal_3/TruncatedNormaltruncated_normal_3/stddev*
T0*
_output_shapes
:	А

t
truncated_normal_3Addtruncated_normal_3/multruncated_normal_3/mean*
_output_shapes
:	А
*
T0
А

Variable_8
VariableV2*
shape:	А
*
shared_name *
dtype0*
_output_shapes
:	А
*
	container 
н
Variable_8/AssignAssign
Variable_8truncated_normal_3*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

p
Variable_8/readIdentity
Variable_8*
T0*
_class
loc:@Variable_8*
_output_shapes
:	А

T
Const_3Const*
valueB
*═╠╠=*
dtype0*
_output_shapes
:

v

Variable_9
VariableV2*
dtype0*
_output_shapes
:
*
	container *
shape:
*
shared_name 
Э
Variable_9/AssignAssign
Variable_9Const_3*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:
*
use_locking(
k
Variable_9/readIdentity
Variable_9*
_output_shapes
:
*
T0*
_class
loc:@Variable_9
И
MatMul_1MatMuldropout/mulVariable_8/read*
T0*'
_output_shapes
:         
*
transpose_a( *
transpose_b( 
Y
add_3AddMatMul_1Variable_9/read*
T0*'
_output_shapes
:         

F
RankConst*
value	B :*
dtype0*
_output_shapes
: 
J
ShapeShapeadd_3*
T0*
out_type0*
_output_shapes
:
H
Rank_1Const*
value	B :*
dtype0*
_output_shapes
: 
L
Shape_1Shapeadd_3*
T0*
out_type0*
_output_shapes
:
G
Sub/yConst*
value	B :*
dtype0*
_output_shapes
: 
:
SubSubRank_1Sub/y*
_output_shapes
: *
T0
R
Slice/beginPackSub*
_output_shapes
:*
T0*

axis *
N
T

Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
b
SliceSliceShape_1Slice/begin
Slice/size*
_output_shapes
:*
Index0*
T0
b
concat/values_0Const*
valueB:
         *
dtype0*
_output_shapes
:
M
concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
q
concatConcatV2concat/values_0Sliceconcat/axis*
T0*
N*
_output_shapes
:*

Tidx0
l
	Reshape_2Reshapeadd_3concat*
T0*
Tshape0*0
_output_shapes
:                  
H
Rank_2Const*
value	B :*
dtype0*
_output_shapes
: 
R
Shape_2ShapePlaceholder*
T0*
out_type0*
_output_shapes
:
I
Sub_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
>
Sub_1SubRank_2Sub_1/y*
T0*
_output_shapes
: 
V
Slice_1/beginPackSub_1*
T0*

axis *
N*
_output_shapes
:
V
Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
h
Slice_1SliceShape_2Slice_1/beginSlice_1/size*
Index0*
T0*
_output_shapes
:
d
concat_1/values_0Const*
valueB:
         *
dtype0*
_output_shapes
:
O
concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
y
concat_1ConcatV2concat_1/values_0Slice_1concat_1/axis*
N*
_output_shapes
:*

Tidx0*
T0
t
	Reshape_3ReshapePlaceholderconcat_1*
T0*
Tshape0*0
_output_shapes
:                  
Ю
SoftmaxCrossEntropyWithLogitsSoftmaxCrossEntropyWithLogits	Reshape_2	Reshape_3*
T0*?
_output_shapes-
+:         :                  
I
Sub_2/yConst*
dtype0*
_output_shapes
: *
value	B :
<
Sub_2SubRankSub_2/y*
_output_shapes
: *
T0
W
Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB: 
U
Slice_2/sizePackSub_2*
T0*

axis *
N*
_output_shapes
:
o
Slice_2SliceShapeSlice_2/beginSlice_2/size*#
_output_shapes
:         *
Index0*
T0
x
	Reshape_4ReshapeSoftmaxCrossEntropyWithLogitsSlice_2*#
_output_shapes
:         *
T0*
Tshape0
Q
Const_4Const*
valueB: *
dtype0*
_output_shapes
:
^
MeanMean	Reshape_4Const_4*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
_output_shapes
: *
valueB *
dtype0
T
gradients/ConstConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
k
!gradients/Mean_grad/Reshape/shapeConst*
valueB:*
dtype0*
_output_shapes
:
М
gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes
:
b
gradients/Mean_grad/ShapeShape	Reshape_4*
_output_shapes
:*
T0*
out_type0
Ш
gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:         
d
gradients/Mean_grad/Shape_1Shape	Reshape_4*
_output_shapes
:*
T0*
out_type0
^
gradients/Mean_grad/Shape_2Const*
dtype0*
_output_shapes
: *
valueB 
c
gradients/Mean_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ц
gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
gradients/Mean_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
Ъ
gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
_
gradients/Mean_grad/Maximum/yConst*
value	B :*
dtype0*
_output_shapes
: 
В
gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
_output_shapes
: *
T0
А
gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
_output_shapes
: *
T0
n
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
И
gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*#
_output_shapes
:         
{
gradients/Reshape_4_grad/ShapeShapeSoftmaxCrossEntropyWithLogits*
_output_shapes
:*
T0*
out_type0
д
 gradients/Reshape_4_grad/ReshapeReshapegradients/Mean_grad/truedivgradients/Reshape_4_grad/Shape*
T0*
Tshape0*#
_output_shapes
:         
}
gradients/zeros_like	ZerosLikeSoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
Ж
;gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
valueB :
         *
dtype0*
_output_shapes
: 
т
7gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims gradients/Reshape_4_grad/Reshape;gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:         
╠
0gradients/SoftmaxCrossEntropyWithLogits_grad/mulMul7gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDimsSoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
c
gradients/Reshape_2_grad/ShapeShapeadd_3*
T0*
out_type0*
_output_shapes
:
╜
 gradients/Reshape_2_grad/ReshapeReshape0gradients/SoftmaxCrossEntropyWithLogits_grad/mulgradients/Reshape_2_grad/Shape*
Tshape0*'
_output_shapes
:         
*
T0
b
gradients/add_3_grad/ShapeShapeMatMul_1*
_output_shapes
:*
T0*
out_type0
f
gradients/add_3_grad/Shape_1Const*
valueB:
*
dtype0*
_output_shapes
:
║
*gradients/add_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_3_grad/Shapegradients/add_3_grad/Shape_1*
T0*2
_output_shapes 
:         :         
н
gradients/add_3_grad/SumSum gradients/Reshape_2_grad/Reshape*gradients/add_3_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Э
gradients/add_3_grad/ReshapeReshapegradients/add_3_grad/Sumgradients/add_3_grad/Shape*'
_output_shapes
:         
*
T0*
Tshape0
▒
gradients/add_3_grad/Sum_1Sum gradients/Reshape_2_grad/Reshape,gradients/add_3_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ц
gradients/add_3_grad/Reshape_1Reshapegradients/add_3_grad/Sum_1gradients/add_3_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:

m
%gradients/add_3_grad/tuple/group_depsNoOp^gradients/add_3_grad/Reshape^gradients/add_3_grad/Reshape_1
т
-gradients/add_3_grad/tuple/control_dependencyIdentitygradients/add_3_grad/Reshape&^gradients/add_3_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_3_grad/Reshape*'
_output_shapes
:         

█
/gradients/add_3_grad/tuple/control_dependency_1Identitygradients/add_3_grad/Reshape_1&^gradients/add_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_3_grad/Reshape_1*
_output_shapes
:

┴
gradients/MatMul_1_grad/MatMulMatMul-gradients/add_3_grad/tuple/control_dependencyVariable_8/read*
T0*(
_output_shapes
:         А*
transpose_a( *
transpose_b(
╢
 gradients/MatMul_1_grad/MatMul_1MatMuldropout/mul-gradients/add_3_grad/tuple/control_dependency*
_output_shapes
:	А
*
transpose_a(*
transpose_b( *
T0
t
(gradients/MatMul_1_grad/tuple/group_depsNoOp^gradients/MatMul_1_grad/MatMul!^gradients/MatMul_1_grad/MatMul_1
э
0gradients/MatMul_1_grad/tuple/control_dependencyIdentitygradients/MatMul_1_grad/MatMul)^gradients/MatMul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/MatMul_1_grad/MatMul*(
_output_shapes
:         А
ъ
2gradients/MatMul_1_grad/tuple/control_dependency_1Identity gradients/MatMul_1_grad/MatMul_1)^gradients/MatMul_1_grad/tuple/group_deps*
_output_shapes
:	А
*
T0*3
_class)
'%loc:@gradients/MatMul_1_grad/MatMul_1
t
 gradients/dropout/mul_grad/ShapeShapedropout/div*
T0*
out_type0*#
_output_shapes
:         
x
"gradients/dropout/mul_grad/Shape_1Shapedropout/Floor*#
_output_shapes
:         *
T0*
out_type0
╠
0gradients/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/dropout/mul_grad/Shape"gradients/dropout/mul_grad/Shape_1*
T0*2
_output_shapes 
:         :         
Й
gradients/dropout/mul_grad/mulMul0gradients/MatMul_1_grad/tuple/control_dependencydropout/Floor*
_output_shapes
:*
T0
╖
gradients/dropout/mul_grad/SumSumgradients/dropout/mul_grad/mul0gradients/dropout/mul_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
а
"gradients/dropout/mul_grad/ReshapeReshapegradients/dropout/mul_grad/Sum gradients/dropout/mul_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Й
 gradients/dropout/mul_grad/mul_1Muldropout/div0gradients/MatMul_1_grad/tuple/control_dependency*
T0*
_output_shapes
:
╜
 gradients/dropout/mul_grad/Sum_1Sum gradients/dropout/mul_grad/mul_12gradients/dropout/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
ж
$gradients/dropout/mul_grad/Reshape_1Reshape gradients/dropout/mul_grad/Sum_1"gradients/dropout/mul_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:

+gradients/dropout/mul_grad/tuple/group_depsNoOp#^gradients/dropout/mul_grad/Reshape%^gradients/dropout/mul_grad/Reshape_1
ы
3gradients/dropout/mul_grad/tuple/control_dependencyIdentity"gradients/dropout/mul_grad/Reshape,^gradients/dropout/mul_grad/tuple/group_deps*
_output_shapes
:*
T0*5
_class+
)'loc:@gradients/dropout/mul_grad/Reshape
ё
5gradients/dropout/mul_grad/tuple/control_dependency_1Identity$gradients/dropout/mul_grad/Reshape_1,^gradients/dropout/mul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dropout/mul_grad/Reshape_1*
_output_shapes
:
f
 gradients/dropout/div_grad/ShapeShapeRelu_2*
T0*
out_type0*
_output_shapes
:
x
"gradients/dropout/div_grad/Shape_1ShapePlaceholder_1*
T0*
out_type0*#
_output_shapes
:         
╠
0gradients/dropout/div_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/dropout/div_grad/Shape"gradients/dropout/div_grad/Shape_1*
T0*2
_output_shapes 
:         :         
Ф
"gradients/dropout/div_grad/RealDivRealDiv3gradients/dropout/mul_grad/tuple/control_dependencyPlaceholder_1*
T0*
_output_shapes
:
╗
gradients/dropout/div_grad/SumSum"gradients/dropout/div_grad/RealDiv0gradients/dropout/div_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
░
"gradients/dropout/div_grad/ReshapeReshapegradients/dropout/div_grad/Sum gradients/dropout/div_grad/Shape*
T0*
Tshape0*(
_output_shapes
:         А
`
gradients/dropout/div_grad/NegNegRelu_2*(
_output_shapes
:         А*
T0
Б
$gradients/dropout/div_grad/RealDiv_1RealDivgradients/dropout/div_grad/NegPlaceholder_1*
T0*
_output_shapes
:
З
$gradients/dropout/div_grad/RealDiv_2RealDiv$gradients/dropout/div_grad/RealDiv_1Placeholder_1*
T0*
_output_shapes
:
г
gradients/dropout/div_grad/mulMul3gradients/dropout/mul_grad/tuple/control_dependency$gradients/dropout/div_grad/RealDiv_2*
T0*
_output_shapes
:
╗
 gradients/dropout/div_grad/Sum_1Sumgradients/dropout/div_grad/mul2gradients/dropout/div_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
ж
$gradients/dropout/div_grad/Reshape_1Reshape gradients/dropout/div_grad/Sum_1"gradients/dropout/div_grad/Shape_1*
Tshape0*
_output_shapes
:*
T0

+gradients/dropout/div_grad/tuple/group_depsNoOp#^gradients/dropout/div_grad/Reshape%^gradients/dropout/div_grad/Reshape_1
√
3gradients/dropout/div_grad/tuple/control_dependencyIdentity"gradients/dropout/div_grad/Reshape,^gradients/dropout/div_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dropout/div_grad/Reshape*(
_output_shapes
:         А
ё
5gradients/dropout/div_grad/tuple/control_dependency_1Identity$gradients/dropout/div_grad/Reshape_1,^gradients/dropout/div_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dropout/div_grad/Reshape_1*
_output_shapes
:
Ъ
gradients/Relu_2_grad/ReluGradReluGrad3gradients/dropout/div_grad/tuple/control_dependencyRelu_2*
T0*(
_output_shapes
:         А
`
gradients/add_2_grad/ShapeShapeMatMul*
T0*
out_type0*
_output_shapes
:
g
gradients/add_2_grad/Shape_1Const*
valueB:А*
dtype0*
_output_shapes
:
║
*gradients/add_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_2_grad/Shapegradients/add_2_grad/Shape_1*
T0*2
_output_shapes 
:         :         
л
gradients/add_2_grad/SumSumgradients/Relu_2_grad/ReluGrad*gradients/add_2_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ю
gradients/add_2_grad/ReshapeReshapegradients/add_2_grad/Sumgradients/add_2_grad/Shape*
T0*
Tshape0*(
_output_shapes
:         А
п
gradients/add_2_grad/Sum_1Sumgradients/Relu_2_grad/ReluGrad,gradients/add_2_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ч
gradients/add_2_grad/Reshape_1Reshapegradients/add_2_grad/Sum_1gradients/add_2_grad/Shape_1*
_output_shapes	
:А*
T0*
Tshape0
m
%gradients/add_2_grad/tuple/group_depsNoOp^gradients/add_2_grad/Reshape^gradients/add_2_grad/Reshape_1
у
-gradients/add_2_grad/tuple/control_dependencyIdentitygradients/add_2_grad/Reshape&^gradients/add_2_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_2_grad/Reshape*(
_output_shapes
:         А
▄
/gradients/add_2_grad/tuple/control_dependency_1Identitygradients/add_2_grad/Reshape_1&^gradients/add_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_2_grad/Reshape_1*
_output_shapes	
:А
┐
gradients/MatMul_grad/MatMulMatMul-gradients/add_2_grad/tuple/control_dependencyVariable_6/read*
T0*(
_output_shapes
:         └*
transpose_a( *
transpose_b(
│
gradients/MatMul_grad/MatMul_1MatMul	Reshape_1-gradients/add_2_grad/tuple/control_dependency* 
_output_shapes
:
└А*
transpose_a(*
transpose_b( *
T0
n
&gradients/MatMul_grad/tuple/group_depsNoOp^gradients/MatMul_grad/MatMul^gradients/MatMul_grad/MatMul_1
х
.gradients/MatMul_grad/tuple/control_dependencyIdentitygradients/MatMul_grad/MatMul'^gradients/MatMul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/MatMul_grad/MatMul*(
_output_shapes
:         └
у
0gradients/MatMul_grad/tuple/control_dependency_1Identitygradients/MatMul_grad/MatMul_1'^gradients/MatMul_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/MatMul_grad/MatMul_1* 
_output_shapes
:
└А
g
gradients/Reshape_1_grad/ShapeShape	MaxPool_1*
T0*
out_type0*
_output_shapes
:
├
 gradients/Reshape_1_grad/ReshapeReshape.gradients/MatMul_grad/tuple/control_dependencygradients/Reshape_1_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         @
Ї
$gradients/MaxPool_1_grad/MaxPoolGradMaxPoolGradRelu_1	MaxPool_1 gradients/Reshape_1_grad/Reshape*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingSAME*/
_output_shapes
:         @
Т
gradients/Relu_1_grad/ReluGradReluGrad$gradients/MaxPool_1_grad/MaxPoolGradRelu_1*/
_output_shapes
:         @*
T0
b
gradients/add_1_grad/ShapeShapeConv2D_1*
T0*
out_type0*
_output_shapes
:
f
gradients/add_1_grad/Shape_1Const*
valueB:@*
dtype0*
_output_shapes
:
║
*gradients/add_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_1_grad/Shapegradients/add_1_grad/Shape_1*2
_output_shapes 
:         :         *
T0
л
gradients/add_1_grad/SumSumgradients/Relu_1_grad/ReluGrad*gradients/add_1_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
е
gradients/add_1_grad/ReshapeReshapegradients/add_1_grad/Sumgradients/add_1_grad/Shape*
Tshape0*/
_output_shapes
:         @*
T0
п
gradients/add_1_grad/Sum_1Sumgradients/Relu_1_grad/ReluGrad,gradients/add_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ц
gradients/add_1_grad/Reshape_1Reshapegradients/add_1_grad/Sum_1gradients/add_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:@
m
%gradients/add_1_grad/tuple/group_depsNoOp^gradients/add_1_grad/Reshape^gradients/add_1_grad/Reshape_1
ъ
-gradients/add_1_grad/tuple/control_dependencyIdentitygradients/add_1_grad/Reshape&^gradients/add_1_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_1_grad/Reshape*/
_output_shapes
:         @
█
/gradients/add_1_grad/tuple/control_dependency_1Identitygradients/add_1_grad/Reshape_1&^gradients/add_1_grad/tuple/group_deps*
_output_shapes
:@*
T0*1
_class'
%#loc:@gradients/add_1_grad/Reshape_1
d
gradients/Conv2D_1_grad/ShapeShapeMaxPool*
T0*
out_type0*
_output_shapes
:
═
+gradients/Conv2D_1_grad/Conv2DBackpropInputConv2DBackpropInputgradients/Conv2D_1_grad/ShapeVariable_4/read-gradients/add_1_grad/tuple/control_dependency*J
_output_shapes8
6:4                                    *
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME
x
gradients/Conv2D_1_grad/Shape_1Const*%
valueB"          @   *
dtype0*
_output_shapes
:
е
,gradients/Conv2D_1_grad/Conv2DBackpropFilterConv2DBackpropFilterMaxPoolgradients/Conv2D_1_grad/Shape_1-gradients/add_1_grad/tuple/control_dependency*&
_output_shapes
: @*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME
Н
(gradients/Conv2D_1_grad/tuple/group_depsNoOp,^gradients/Conv2D_1_grad/Conv2DBackpropInput-^gradients/Conv2D_1_grad/Conv2DBackpropFilter
О
0gradients/Conv2D_1_grad/tuple/control_dependencyIdentity+gradients/Conv2D_1_grad/Conv2DBackpropInput)^gradients/Conv2D_1_grad/tuple/group_deps*/
_output_shapes
:          *
T0*>
_class4
20loc:@gradients/Conv2D_1_grad/Conv2DBackpropInput
Й
2gradients/Conv2D_1_grad/tuple/control_dependency_1Identity,gradients/Conv2D_1_grad/Conv2DBackpropFilter)^gradients/Conv2D_1_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/Conv2D_1_grad/Conv2DBackpropFilter*&
_output_shapes
: @
■
"gradients/MaxPool_grad/MaxPoolGradMaxPoolGradReluMaxPool0gradients/Conv2D_1_grad/tuple/control_dependency*
paddingSAME*/
_output_shapes
:          *
T0*
data_formatNHWC*
strides
*
ksize

М
gradients/Relu_grad/ReluGradReluGrad"gradients/MaxPool_grad/MaxPoolGradRelu*
T0*/
_output_shapes
:          
^
gradients/add_grad/ShapeShapeConv2D*
T0*
out_type0*
_output_shapes
:
d
gradients/add_grad/Shape_1Const*
valueB: *
dtype0*
_output_shapes
:
┤
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*2
_output_shapes 
:         :         *
T0
е
gradients/add_grad/SumSumgradients/Relu_grad/ReluGrad(gradients/add_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Я
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*
Tshape0*/
_output_shapes
:          
й
gradients/add_grad/Sum_1Sumgradients/Relu_grad/ReluGrad*gradients/add_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Р
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
т
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*/
_output_shapes
:          
╙
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1*
_output_shapes
: 
b
gradients/Conv2D_grad/ShapeShapeReshape*
T0*
out_type0*
_output_shapes
:
╟
)gradients/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputgradients/Conv2D_grad/ShapeVariable_2/read+gradients/add_grad/tuple/control_dependency*J
_output_shapes8
6:4                                    *
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME
v
gradients/Conv2D_grad/Shape_1Const*
dtype0*
_output_shapes
:*%
valueB"             
Я
*gradients/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterReshapegradients/Conv2D_grad/Shape_1+gradients/add_grad/tuple/control_dependency*&
_output_shapes
: *
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME
З
&gradients/Conv2D_grad/tuple/group_depsNoOp*^gradients/Conv2D_grad/Conv2DBackpropInput+^gradients/Conv2D_grad/Conv2DBackpropFilter
Ж
.gradients/Conv2D_grad/tuple/control_dependencyIdentity)gradients/Conv2D_grad/Conv2DBackpropInput'^gradients/Conv2D_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients/Conv2D_grad/Conv2DBackpropInput*/
_output_shapes
:         
Б
0gradients/Conv2D_grad/tuple/control_dependency_1Identity*gradients/Conv2D_grad/Conv2DBackpropFilter'^gradients/Conv2D_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
: 
}
beta1_power/initial_valueConst*
valueB
 *fff?*
_class
loc:@Variable_2*
dtype0*
_output_shapes
: 
О
beta1_power
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@Variable_2*
	container *
shape: 
н
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
i
beta1_power/readIdentitybeta1_power*
_class
loc:@Variable_2*
_output_shapes
: *
T0
}
beta2_power/initial_valueConst*
valueB
 *w╛?*
_class
loc:@Variable_2*
dtype0*
_output_shapes
: 
О
beta2_power
VariableV2*
_class
loc:@Variable_2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
н
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Variable_2
i
beta2_power/readIdentitybeta2_power*
T0*
_class
loc:@Variable_2*
_output_shapes
: 
е
!Variable_2/Adam/Initializer/zerosConst*
_class
loc:@Variable_2*%
valueB *    *
dtype0*&
_output_shapes
: 
▓
Variable_2/Adam
VariableV2*
dtype0*&
_output_shapes
: *
shared_name *
_class
loc:@Variable_2*
	container *
shape: 
═
Variable_2/Adam/AssignAssignVariable_2/Adam!Variable_2/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
Б
Variable_2/Adam/readIdentityVariable_2/Adam*
T0*
_class
loc:@Variable_2*&
_output_shapes
: 
з
#Variable_2/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_2*%
valueB *    *
dtype0*&
_output_shapes
: 
┤
Variable_2/Adam_1
VariableV2*
shape: *
dtype0*&
_output_shapes
: *
shared_name *
_class
loc:@Variable_2*
	container 
╙
Variable_2/Adam_1/AssignAssignVariable_2/Adam_1#Variable_2/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
Е
Variable_2/Adam_1/readIdentityVariable_2/Adam_1*&
_output_shapes
: *
T0*
_class
loc:@Variable_2
Н
!Variable_3/Adam/Initializer/zerosConst*
_class
loc:@Variable_3*
valueB *    *
dtype0*
_output_shapes
: 
Ъ
Variable_3/Adam
VariableV2*
shared_name *
_class
loc:@Variable_3*
	container *
shape: *
dtype0*
_output_shapes
: 
┴
Variable_3/Adam/AssignAssignVariable_3/Adam!Variable_3/Adam/Initializer/zeros*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
u
Variable_3/Adam/readIdentityVariable_3/Adam*
T0*
_class
loc:@Variable_3*
_output_shapes
: 
П
#Variable_3/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_3*
valueB *    *
dtype0*
_output_shapes
: 
Ь
Variable_3/Adam_1
VariableV2*
_class
loc:@Variable_3*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
╟
Variable_3/Adam_1/AssignAssignVariable_3/Adam_1#Variable_3/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: 
y
Variable_3/Adam_1/readIdentityVariable_3/Adam_1*
T0*
_class
loc:@Variable_3*
_output_shapes
: 
е
!Variable_4/Adam/Initializer/zerosConst*
_class
loc:@Variable_4*%
valueB @*    *
dtype0*&
_output_shapes
: @
▓
Variable_4/Adam
VariableV2*
shape: @*
dtype0*&
_output_shapes
: @*
shared_name *
_class
loc:@Variable_4*
	container 
═
Variable_4/Adam/AssignAssignVariable_4/Adam!Variable_4/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @
Б
Variable_4/Adam/readIdentityVariable_4/Adam*
T0*
_class
loc:@Variable_4*&
_output_shapes
: @
з
#Variable_4/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_4*%
valueB @*    *
dtype0*&
_output_shapes
: @
┤
Variable_4/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_4*
	container *
shape: @*
dtype0*&
_output_shapes
: @
╙
Variable_4/Adam_1/AssignAssignVariable_4/Adam_1#Variable_4/Adam_1/Initializer/zeros*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @*
use_locking(*
T0
Е
Variable_4/Adam_1/readIdentityVariable_4/Adam_1*&
_output_shapes
: @*
T0*
_class
loc:@Variable_4
Н
!Variable_5/Adam/Initializer/zerosConst*
_class
loc:@Variable_5*
valueB@*    *
dtype0*
_output_shapes
:@
Ъ
Variable_5/Adam
VariableV2*
dtype0*
_output_shapes
:@*
shared_name *
_class
loc:@Variable_5*
	container *
shape:@
┴
Variable_5/Adam/AssignAssignVariable_5/Adam!Variable_5/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@
u
Variable_5/Adam/readIdentityVariable_5/Adam*
_output_shapes
:@*
T0*
_class
loc:@Variable_5
П
#Variable_5/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_5*
valueB@*    *
dtype0*
_output_shapes
:@
Ь
Variable_5/Adam_1
VariableV2*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name *
_class
loc:@Variable_5
╟
Variable_5/Adam_1/AssignAssignVariable_5/Adam_1#Variable_5/Adam_1/Initializer/zeros*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*
_class
loc:@Variable_5
y
Variable_5/Adam_1/readIdentityVariable_5/Adam_1*
_output_shapes
:@*
T0*
_class
loc:@Variable_5
Щ
!Variable_6/Adam/Initializer/zerosConst*
dtype0* 
_output_shapes
:
└А*
_class
loc:@Variable_6*
valueB
└А*    
ж
Variable_6/Adam
VariableV2*
shape:
└А*
dtype0* 
_output_shapes
:
└А*
shared_name *
_class
loc:@Variable_6*
	container 
╟
Variable_6/Adam/AssignAssignVariable_6/Adam!Variable_6/Adam/Initializer/zeros* 
_output_shapes
:
└А*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(
{
Variable_6/Adam/readIdentityVariable_6/Adam*
T0*
_class
loc:@Variable_6* 
_output_shapes
:
└А
Ы
#Variable_6/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_6*
valueB
└А*    *
dtype0* 
_output_shapes
:
└А
и
Variable_6/Adam_1
VariableV2*
	container *
shape:
└А*
dtype0* 
_output_shapes
:
└А*
shared_name *
_class
loc:@Variable_6
═
Variable_6/Adam_1/AssignAssignVariable_6/Adam_1#Variable_6/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А

Variable_6/Adam_1/readIdentityVariable_6/Adam_1*
T0*
_class
loc:@Variable_6* 
_output_shapes
:
└А
П
!Variable_7/Adam/Initializer/zerosConst*
dtype0*
_output_shapes	
:А*
_class
loc:@Variable_7*
valueBА*    
Ь
Variable_7/Adam
VariableV2*
	container *
shape:А*
dtype0*
_output_shapes	
:А*
shared_name *
_class
loc:@Variable_7
┬
Variable_7/Adam/AssignAssignVariable_7/Adam!Variable_7/Adam/Initializer/zeros*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А*
use_locking(
v
Variable_7/Adam/readIdentityVariable_7/Adam*
T0*
_class
loc:@Variable_7*
_output_shapes	
:А
С
#Variable_7/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_7*
valueBА*    *
dtype0*
_output_shapes	
:А
Ю
Variable_7/Adam_1
VariableV2*
dtype0*
_output_shapes	
:А*
shared_name *
_class
loc:@Variable_7*
	container *
shape:А
╚
Variable_7/Adam_1/AssignAssignVariable_7/Adam_1#Variable_7/Adam_1/Initializer/zeros*
validate_shape(*
_output_shapes	
:А*
use_locking(*
T0*
_class
loc:@Variable_7
z
Variable_7/Adam_1/readIdentityVariable_7/Adam_1*
T0*
_class
loc:@Variable_7*
_output_shapes	
:А
Ч
!Variable_8/Adam/Initializer/zerosConst*
_class
loc:@Variable_8*
valueB	А
*    *
dtype0*
_output_shapes
:	А

д
Variable_8/Adam
VariableV2*
dtype0*
_output_shapes
:	А
*
shared_name *
_class
loc:@Variable_8*
	container *
shape:	А

╞
Variable_8/Adam/AssignAssignVariable_8/Adam!Variable_8/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

z
Variable_8/Adam/readIdentityVariable_8/Adam*
T0*
_class
loc:@Variable_8*
_output_shapes
:	А

Щ
#Variable_8/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_8*
valueB	А
*    *
dtype0*
_output_shapes
:	А

ж
Variable_8/Adam_1
VariableV2*
	container *
shape:	А
*
dtype0*
_output_shapes
:	А
*
shared_name *
_class
loc:@Variable_8
╠
Variable_8/Adam_1/AssignAssignVariable_8/Adam_1#Variable_8/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

~
Variable_8/Adam_1/readIdentityVariable_8/Adam_1*
T0*
_class
loc:@Variable_8*
_output_shapes
:	А

Н
!Variable_9/Adam/Initializer/zerosConst*
_class
loc:@Variable_9*
valueB
*    *
dtype0*
_output_shapes
:

Ъ
Variable_9/Adam
VariableV2*
shape:
*
dtype0*
_output_shapes
:
*
shared_name *
_class
loc:@Variable_9*
	container 
┴
Variable_9/Adam/AssignAssignVariable_9/Adam!Variable_9/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:

u
Variable_9/Adam/readIdentityVariable_9/Adam*
T0*
_class
loc:@Variable_9*
_output_shapes
:

П
#Variable_9/Adam_1/Initializer/zerosConst*
_class
loc:@Variable_9*
valueB
*    *
dtype0*
_output_shapes
:

Ь
Variable_9/Adam_1
VariableV2*
	container *
shape:
*
dtype0*
_output_shapes
:
*
shared_name *
_class
loc:@Variable_9
╟
Variable_9/Adam_1/AssignAssignVariable_9/Adam_1#Variable_9/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:

y
Variable_9/Adam_1/readIdentityVariable_9/Adam_1*
T0*
_class
loc:@Variable_9*
_output_shapes
:

W
Adam/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *╖╤8
O

Adam/beta1Const*
valueB
 *fff?*
dtype0*
_output_shapes
: 
O

Adam/beta2Const*
dtype0*
_output_shapes
: *
valueB
 *w╛?
Q
Adam/epsilonConst*
valueB
 *w╠+2*
dtype0*
_output_shapes
: 
ф
 Adam/update_Variable_2/ApplyAdam	ApplyAdam
Variable_2Variable_2/AdamVariable_2/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon0gradients/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_2*
use_nesterov( *&
_output_shapes
: 
╒
 Adam/update_Variable_3/ApplyAdam	ApplyAdam
Variable_3Variable_3/AdamVariable_3/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon-gradients/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_3*
use_nesterov( *
_output_shapes
: 
ц
 Adam/update_Variable_4/ApplyAdam	ApplyAdam
Variable_4Variable_4/AdamVariable_4/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon2gradients/Conv2D_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_4*
use_nesterov( *&
_output_shapes
: @
╫
 Adam/update_Variable_5/ApplyAdam	ApplyAdam
Variable_5Variable_5/AdamVariable_5/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_1_grad/tuple/control_dependency_1*
T0*
_class
loc:@Variable_5*
use_nesterov( *
_output_shapes
:@*
use_locking( 
▐
 Adam/update_Variable_6/ApplyAdam	ApplyAdam
Variable_6Variable_6/AdamVariable_6/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon0gradients/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_6*
use_nesterov( * 
_output_shapes
:
└А
╪
 Adam/update_Variable_7/ApplyAdam	ApplyAdam
Variable_7Variable_7/AdamVariable_7/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_2_grad/tuple/control_dependency_1*
_output_shapes	
:А*
use_locking( *
T0*
_class
loc:@Variable_7*
use_nesterov( 
▀
 Adam/update_Variable_8/ApplyAdam	ApplyAdam
Variable_8Variable_8/AdamVariable_8/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon2gradients/MatMul_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@Variable_8*
use_nesterov( *
_output_shapes
:	А

╫
 Adam/update_Variable_9/ApplyAdam	ApplyAdam
Variable_9Variable_9/AdamVariable_9/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_3_grad/tuple/control_dependency_1*
_class
loc:@Variable_9*
use_nesterov( *
_output_shapes
:
*
use_locking( *
T0
Е
Adam/mulMulbeta1_power/read
Adam/beta1!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam!^Adam/update_Variable_8/ApplyAdam!^Adam/update_Variable_9/ApplyAdam*
_output_shapes
: *
T0*
_class
loc:@Variable_2
Х
Adam/AssignAssignbeta1_powerAdam/mul*
use_locking( *
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
З

Adam/mul_1Mulbeta2_power/read
Adam/beta2!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam!^Adam/update_Variable_8/ApplyAdam!^Adam/update_Variable_9/ApplyAdam*
T0*
_class
loc:@Variable_2*
_output_shapes
: 
Щ
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
use_locking( *
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
┬
AdamNoOp!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam!^Adam/update_Variable_8/ApplyAdam!^Adam/update_Variable_9/ApplyAdam^Adam/Assign^Adam/Assign_1
R
ArgMax/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
c
ArgMaxArgMaxadd_3ArgMax/dimension*#
_output_shapes
:         *

Tidx0*
T0
T
ArgMax_1/dimensionConst*
dtype0*
_output_shapes
: *
value	B :
m
ArgMax_1ArgMaxPlaceholderArgMax_1/dimension*
T0*#
_output_shapes
:         *

Tidx0
N
EqualEqualArgMaxArgMax_1*
T0	*#
_output_shapes
:         
R
Cast_1CastEqual*

SrcT0
*#
_output_shapes
:         *

DstT0
Q
Const_5Const*
valueB: *
dtype0*
_output_shapes
:
]
Mean_1MeanCast_1Const_5*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
Ь
initNoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Т
save/SaveV2/tensor_namesConst*┼
value╗B╕BVariableB
Variable_1B
Variable_2BVariable_2/AdamBVariable_2/Adam_1B
Variable_3BVariable_3/AdamBVariable_3/Adam_1B
Variable_4BVariable_4/AdamBVariable_4/Adam_1B
Variable_5BVariable_5/AdamBVariable_5/Adam_1B
Variable_6BVariable_6/AdamBVariable_6/Adam_1B
Variable_7BVariable_7/AdamBVariable_7/Adam_1B
Variable_8BVariable_8/AdamBVariable_8/Adam_1B
Variable_9BVariable_9/AdamBVariable_9/Adam_1Bbeta1_powerBbeta2_power*
dtype0*
_output_shapes
:
Ы
save/SaveV2/shape_and_slicesConst*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
╡
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2Variable_2/AdamVariable_2/Adam_1
Variable_3Variable_3/AdamVariable_3/Adam_1
Variable_4Variable_4/AdamVariable_4/Adam_1
Variable_5Variable_5/AdamVariable_5/Adam_1
Variable_6Variable_6/AdamVariable_6/Adam_1
Variable_7Variable_7/AdamVariable_7/Adam_1
Variable_8Variable_8/AdamVariable_8/Adam_1
Variable_9Variable_9/AdamVariable_9/Adam_1beta1_powerbeta2_power**
dtypes 
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
l
save/RestoreV2/tensor_namesConst*
valueBBVariable*
dtype0*
_output_shapes
:
h
save/RestoreV2/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Р
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2
Я
save/AssignAssignVariablesave/RestoreV2*
T0*
_class
loc:@Variable*
validate_shape(*
_output_shapes
:	Р
*
use_locking(
p
save/RestoreV2_1/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
Variable_1
j
!save/RestoreV2_1/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes
:*
dtypes
2
в
save/Assign_1Assign
Variable_1save/RestoreV2_1*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(*
_output_shapes
:

p
save/RestoreV2_2/tensor_namesConst*
valueBB
Variable_2*
dtype0*
_output_shapes
:
j
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
о
save/Assign_2Assign
Variable_2save/RestoreV2_2*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
u
save/RestoreV2_3/tensor_namesConst*$
valueBBVariable_2/Adam*
dtype0*
_output_shapes
:
j
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2
│
save/Assign_3AssignVariable_2/Adamsave/RestoreV2_3*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: 
w
save/RestoreV2_4/tensor_namesConst*&
valueBBVariable_2/Adam_1*
dtype0*
_output_shapes
:
j
!save/RestoreV2_4/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
╡
save/Assign_4AssignVariable_2/Adam_1save/RestoreV2_4*
T0*
_class
loc:@Variable_2*
validate_shape(*&
_output_shapes
: *
use_locking(
p
save/RestoreV2_5/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
Variable_3
j
!save/RestoreV2_5/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Ц
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
в
save/Assign_5Assign
Variable_3save/RestoreV2_5*
use_locking(*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: 
u
save/RestoreV2_6/tensor_namesConst*$
valueBBVariable_3/Adam*
dtype0*
_output_shapes
:
j
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
з
save/Assign_6AssignVariable_3/Adamsave/RestoreV2_6*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Variable_3*
validate_shape(
w
save/RestoreV2_7/tensor_namesConst*&
valueBBVariable_3/Adam_1*
dtype0*
_output_shapes
:
j
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
й
save/Assign_7AssignVariable_3/Adam_1save/RestoreV2_7*
use_locking(*
T0*
_class
loc:@Variable_3*
validate_shape(*
_output_shapes
: 
p
save/RestoreV2_8/tensor_namesConst*
valueBB
Variable_4*
dtype0*
_output_shapes
:
j
!save/RestoreV2_8/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
_output_shapes
:*
dtypes
2
о
save/Assign_8Assign
Variable_4save/RestoreV2_8*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @
u
save/RestoreV2_9/tensor_namesConst*$
valueBBVariable_4/Adam*
dtype0*
_output_shapes
:
j
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
_output_shapes
:*
dtypes
2
│
save/Assign_9AssignVariable_4/Adamsave/RestoreV2_9*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @*
use_locking(
x
save/RestoreV2_10/tensor_namesConst*
_output_shapes
:*&
valueBBVariable_4/Adam_1*
dtype0
k
"save/RestoreV2_10/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
_output_shapes
:*
dtypes
2
╖
save/Assign_10AssignVariable_4/Adam_1save/RestoreV2_10*
use_locking(*
T0*
_class
loc:@Variable_4*
validate_shape(*&
_output_shapes
: @
q
save/RestoreV2_11/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
Variable_5
k
"save/RestoreV2_11/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Щ
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
_output_shapes
:*
dtypes
2
д
save/Assign_11Assign
Variable_5save/RestoreV2_11*
use_locking(*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@
v
save/RestoreV2_12/tensor_namesConst*
dtype0*
_output_shapes
:*$
valueBBVariable_5/Adam
k
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Щ
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
й
save/Assign_12AssignVariable_5/Adamsave/RestoreV2_12*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0
x
save/RestoreV2_13/tensor_namesConst*&
valueBBVariable_5/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_13/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
_output_shapes
:*
dtypes
2
л
save/Assign_13AssignVariable_5/Adam_1save/RestoreV2_13*
use_locking(*
T0*
_class
loc:@Variable_5*
validate_shape(*
_output_shapes
:@
q
save/RestoreV2_14/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
Variable_6
k
"save/RestoreV2_14/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_14Assign
Variable_6save/RestoreV2_14*
validate_shape(* 
_output_shapes
:
└А*
use_locking(*
T0*
_class
loc:@Variable_6
v
save/RestoreV2_15/tensor_namesConst*$
valueBBVariable_6/Adam*
dtype0*
_output_shapes
:
k
"save/RestoreV2_15/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
_output_shapes
:*
dtypes
2
п
save/Assign_15AssignVariable_6/Adamsave/RestoreV2_15*
use_locking(*
T0*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А
x
save/RestoreV2_16/tensor_namesConst*&
valueBBVariable_6/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_16/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
▒
save/Assign_16AssignVariable_6/Adam_1save/RestoreV2_16*
_class
loc:@Variable_6*
validate_shape(* 
_output_shapes
:
└А*
use_locking(*
T0
q
save/RestoreV2_17/tensor_namesConst*
valueBB
Variable_7*
dtype0*
_output_shapes
:
k
"save/RestoreV2_17/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
_output_shapes
:*
dtypes
2
е
save/Assign_17Assign
Variable_7save/RestoreV2_17*
use_locking(*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А
v
save/RestoreV2_18/tensor_namesConst*
dtype0*
_output_shapes
:*$
valueBBVariable_7/Adam
k
"save/RestoreV2_18/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
_output_shapes
:*
dtypes
2
к
save/Assign_18AssignVariable_7/Adamsave/RestoreV2_18*
use_locking(*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А
x
save/RestoreV2_19/tensor_namesConst*&
valueBBVariable_7/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_19/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
_output_shapes
:*
dtypes
2
м
save/Assign_19AssignVariable_7/Adam_1save/RestoreV2_19*
T0*
_class
loc:@Variable_7*
validate_shape(*
_output_shapes	
:А*
use_locking(
q
save/RestoreV2_20/tensor_namesConst*
valueBB
Variable_8*
dtype0*
_output_shapes
:
k
"save/RestoreV2_20/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Щ
save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
_output_shapes
:*
dtypes
2
й
save/Assign_20Assign
Variable_8save/RestoreV2_20*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

v
save/RestoreV2_21/tensor_namesConst*
_output_shapes
:*$
valueBBVariable_8/Adam*
dtype0
k
"save/RestoreV2_21/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Щ
save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
_output_shapes
:*
dtypes
2
о
save/Assign_21AssignVariable_8/Adamsave/RestoreV2_21*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(*
_output_shapes
:	А

x
save/RestoreV2_22/tensor_namesConst*&
valueBBVariable_8/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_22/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
_output_shapes
:*
dtypes
2
░
save/Assign_22AssignVariable_8/Adam_1save/RestoreV2_22*
_output_shapes
:	А
*
use_locking(*
T0*
_class
loc:@Variable_8*
validate_shape(
q
save/RestoreV2_23/tensor_namesConst*
valueBB
Variable_9*
dtype0*
_output_shapes
:
k
"save/RestoreV2_23/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
_output_shapes
:*
dtypes
2
д
save/Assign_23Assign
Variable_9save/RestoreV2_23*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:

v
save/RestoreV2_24/tensor_namesConst*
dtype0*
_output_shapes
:*$
valueBBVariable_9/Adam
k
"save/RestoreV2_24/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Щ
save/RestoreV2_24	RestoreV2
save/Constsave/RestoreV2_24/tensor_names"save/RestoreV2_24/shape_and_slices*
dtypes
2*
_output_shapes
:
й
save/Assign_24AssignVariable_9/Adamsave/RestoreV2_24*
use_locking(*
T0*
_class
loc:@Variable_9*
validate_shape(*
_output_shapes
:

x
save/RestoreV2_25/tensor_namesConst*&
valueBBVariable_9/Adam_1*
dtype0*
_output_shapes
:
k
"save/RestoreV2_25/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_25	RestoreV2
save/Constsave/RestoreV2_25/tensor_names"save/RestoreV2_25/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save/Assign_25AssignVariable_9/Adam_1save/RestoreV2_25*
validate_shape(*
_output_shapes
:
*
use_locking(*
T0*
_class
loc:@Variable_9
r
save/RestoreV2_26/tensor_namesConst* 
valueBBbeta1_power*
dtype0*
_output_shapes
:
k
"save/RestoreV2_26/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Щ
save/RestoreV2_26	RestoreV2
save/Constsave/RestoreV2_26/tensor_names"save/RestoreV2_26/shape_and_slices*
_output_shapes
:*
dtypes
2
б
save/Assign_26Assignbeta1_powersave/RestoreV2_26*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Variable_2
r
save/RestoreV2_27/tensor_namesConst* 
valueBBbeta2_power*
dtype0*
_output_shapes
:
k
"save/RestoreV2_27/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Щ
save/RestoreV2_27	RestoreV2
save/Constsave/RestoreV2_27/tensor_names"save/RestoreV2_27/shape_and_slices*
_output_shapes
:*
dtypes
2
б
save/Assign_27Assignbeta2_powersave/RestoreV2_27*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(*
_output_shapes
: 
ш
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27
Ю
init_1NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign
Ю
init_2NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign
Ю
init_3NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign^Variable_6/Assign^Variable_7/Assign^Variable_8/Assign^Variable_9/Assign^beta1_power/Assign^beta2_power/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_8/Adam/Assign^Variable_8/Adam_1/Assign^Variable_9/Adam/Assign^Variable_9/Adam_1/Assign""▒
trainable_variablesЩЦ
.

Variable:0Variable/AssignVariable/read:0
4
Variable_1:0Variable_1/AssignVariable_1/read:0
4
Variable_2:0Variable_2/AssignVariable_2/read:0
4
Variable_3:0Variable_3/AssignVariable_3/read:0
4
Variable_4:0Variable_4/AssignVariable_4/read:0
4
Variable_5:0Variable_5/AssignVariable_5/read:0
4
Variable_6:0Variable_6/AssignVariable_6/read:0
4
Variable_7:0Variable_7/AssignVariable_7/read:0
4
Variable_8:0Variable_8/AssignVariable_8/read:0
4
Variable_9:0Variable_9/AssignVariable_9/read:0"
train_op

Ad