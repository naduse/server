
defmodule Test do
	import TCP

	def server() do
		{:ok, listen_sock} = listen(43594, [{:active, true}, :binary])
		{:ok, accept_sock} = accept(listen_sock)
		spawn(fn() -> recv(accept_sock) end)
	end

	defp recv(sock) do
		case poll(sock, 0, 20) do
			{:ok, data} ->
				# TCP.send(sock, data) # ambiguous
				IO.puts data |> inspect
				recv(sock)
			{:error, :closed} -> :ok
		end
	end
end

Test.server