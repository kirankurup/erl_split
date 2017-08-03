-module(split).

-export([split_equal_slow/2, split_equal_fast/2]).

split_equal_slow(List, Size) ->
  split_equal_slow(List, Size, []).

split_equal_slow([], _, Acc) ->
  %% to preserve order
  lists:reverse(Acc);

split_equal_slow(List, Size, Acc) ->
  case length(List) > Size of
    true ->
      {SplitHead, SplitRest} = lists:split(Size, List),
      split_equal_slow(SplitRest, Size, [SplitHead] ++ Acc);
    false ->
      split_equal_slow([], Size, [List] ++ Acc)
  end.


split_equal_fast(List, Size) ->
  split_equal_fast(List, Size, []).

split_equal_fast([], _, Acc) ->
  %% to preserve order
  lists:reverse(Acc);

split_equal_fast(List, Size, Acc) ->
  {SplitHead, SplitRest} = split(Size, List),
  split_equal_fast(SplitRest, Size, [SplitHead] ++ Acc).

split(Size, List) ->
  split(Size, List, []).

split(_, [], Acc) ->
  {lists:reverse(Acc), []};

split(0, Rest, Acc) ->
  {lists:reverse(Acc), Rest};

split(Size, [H|R], Acc) ->
  split(Size -1, R, [H] ++ Acc).
