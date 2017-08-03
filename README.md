# erl_split

Split a list to list of lists (with same length).

Two functions are provided
   a) split_equal_slow (which uses lists:split)
   b) split_equal_fast (one which tries to replicate the code of lists:split, except for the case when there are uneven entries in the last split)

=== Run =====

Erlang/OTP 19 [erts-8.1] [source] [64-bit] [async-threads:10] [kernel-poll:false]
Eshell V8.1  (abort with ^G)

1> c(split).
 {ok,split}

2> timer:tc(split, split_equal_slow, [lists:seq(1, 10000), 10]).
{7508,
 [[1,2,3,4,5,6,7,8,9,10],
  [11,12,13,14,15,16,17,18,19,20],
  [21,22,23,24,25,26,27,28,29,30],
  [31,32,33,34,35,36,37,38,39,40],
  [...]|...]}

3> timer:tc(split, split_equal_fast, [lists:seq(1, 10000), 10]).
{391,
 [[1,2,3,4,5,6,7,8,9,10],
  [11,12,13,14,15,16,17,18,19,20],
  [21,22,23,24,25,26,27,28,29,30],
  [31,32,33,34,35,36,37,38,39,40],
  [...]|...]}



