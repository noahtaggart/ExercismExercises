defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
    end
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<0x7F, 0x45, 0x4C, 0x46,  body::binary>> -> "application/octet-stream"
      <<0x42, 0x4D,  body::binary>> -> "image/bmp"
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,  body::binary>> -> "image/png"
      <<0xFF, 0xD8, 0xFF,  body::binary>> -> "image/jpg"
      <<0x47, 0x49, 0x46,  body::binary>> -> "image/gif"
    end
  end

  def verify(file_binary, extension) do
    file_type = type_from_extension(extension)
    binary = type_from_binary(file_binary)

    if file_type == binary do
      {:ok, file_type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
