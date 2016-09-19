% gisla.hrl

-type flow() :: mfa() | function().
-type flow_name() :: atom() | binary() | string().

-record(entry, {
               name :: flow_name(),
            forward :: flow(),
           rollback :: flow(),
     timeout = 5000 :: non_neg_integer()
}).

-type pipeline() :: [ #entry{} ].

-record(flow, {
          name          :: flow_name(),
          pipeline = [] :: pipeline(),
    direction = forward :: 'forward' | 'rollback',
          state         :: term()
}).
