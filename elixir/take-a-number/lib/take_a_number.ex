defmodule TakeANumber do
  def start() do
    spawn(fn -> list(0) end)
  end

  defp list(ticket_nums) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, ticket_nums)
        list(ticket_nums)

      {:take_a_number, sender_pid} ->
        send(sender_pid, ticket_nums + 1)
        list(ticket_nums + 1)

      :stop -> :ok

      _ -> list(ticket_nums)
    end
  end
end
