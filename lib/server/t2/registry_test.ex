defmodule Registry.Test do

  defmacro rg(name) do
    quote do
      {:via, Registry, {MyRegistry, unquote(name)}}
    end
  end
end
