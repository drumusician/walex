# This file steals liberally from https://github.com/supabase/realtime,
# which in turn draws on https://github.com/cainophile/cainophile

require Protocol

defmodule WalEx.Changes do
  defmodule(Transaction, do: defstruct([:changes, :commit_timestamp]))

  defmodule(NewRecord,
    do: defstruct([:type, :record, :schema, :table, :columns, :commit_timestamp])
  )

  defmodule(UpdatedRecord,
    do:
      defstruct([
        :type,
        :old_record,
        :record,
        :schema,
        :table,
        :columns,
        :commit_timestamp
      ])
  )

  defmodule(DeletedRecord,
    do: defstruct([:type, :old_record, :schema, :table, :columns, :commit_timestamp])
  )

  defmodule(TruncatedRelation, do: defstruct([:type, :schema, :table, :commit_timestamp]))
end

Protocol.derive(Jason.Encoder, WalEx.Changes.Transaction)
Protocol.derive(Jason.Encoder, WalEx.Changes.NewRecord)
Protocol.derive(Jason.Encoder, WalEx.Changes.UpdatedRecord)
Protocol.derive(Jason.Encoder, WalEx.Changes.DeletedRecord)
Protocol.derive(Jason.Encoder, WalEx.Changes.TruncatedRelation)
