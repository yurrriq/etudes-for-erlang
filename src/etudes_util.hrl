-define(IF(Test, Then, Else), case Test of true -> Then; false -> Else end).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-define(TEST_ETUDE(Fun, Format, Cases),
        [ begin
              PrettyArgs = [ case Arg of
                                 AFun when is_function(AFun) ->
                                     {module,M} = erlang:fun_info(AFun, module),
                                     {name,F} = erlang:fun_info(AFun, name),
                                     {arity,A} = erlang:fun_info(AFun, arity),
                                     {file, Beam} = cover:is_compiled(M),
                                     {ok,{M,[{abstract_code,{_,Code}}]}} = beam_lib:chunks(Beam, [abstract_code]),
                                     [Src] = [Expr || {function,_,F1,A1,_}=Expr <- Code, F == F1, A == A1],
                                     erl_pp:function(Src);
                                 _ ->
                                     Arg
                             end
                             || Arg <- Args ],
              {iolist_to_binary(io_lib:format(Format, PrettyArgs ++ [Expected])),
               ?_assertMatch(Expected, apply(Fun, Args))}
          end
          || {Expected, Args} <- Cases]).
-endif.
