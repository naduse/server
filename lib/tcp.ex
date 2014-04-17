defmodule TCP do
	@spec listen(integer, list) :: {:ok, record}
	def listen(port, options) do
		:gen_tcp.listen(port, options)
	end

	@spec accept(record) :: {:ok, record}
	def accept(socket) do
		:gen_tcp.accept(socket)
	end

	@spec poll(record) :: tuple | {:error, :closed}
	def poll(socket) do
		poll(socket, 0)
	end

	@spec poll(record, integer) :: tuple | {:error, :closed}
	def poll(socket, len) do
		:gen_tcp.recv(socket, len)
	end

	@spec poll(record, integer, integer) :: tuple | {:error, :closed}
	def poll(socket, len, timeout) do
		:gen_tcp.recv(socket, len, timeout)
	end

	@spec send(record, list) :: tuple
	def send(socket, data) do
		:gen_tcp.send(socket, data)
	end
end