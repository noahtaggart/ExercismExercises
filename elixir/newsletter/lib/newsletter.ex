defmodule Newsletter do
  def read_emails(path) do
    File.read!(path)
    |>String.split()
  end

  def open_log(path) do
    path
    |>File.open!([:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    pid
    |>File.close()
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log = open_log(log_path)
    emails_path
    |>read_emails()
    |>Enum.each(fn email ->
      if send_fun.(email) == :ok, do: log_sent_email(log, email)
    end)
    close_log(log)



  end
end
