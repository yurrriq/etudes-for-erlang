-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").

-define(TEST_ETUDE(Fun, Format, Cases),
        [ {iolist_to_binary(io_lib:format(Format, Args ++ [Expected])),
           ?_assertMatch(Expected, apply(Fun, Args))}
          || {Expected, Args} <- Cases]).
-endif.
