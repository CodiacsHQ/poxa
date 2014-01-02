defmodule Poxa.CryptoHelper do
  @doc """
  Compute a SHA-256 MAC message authentication code from app_secret and data to sign.
  """
  @spec hmac256_to_string(binary, binary) :: binary
  def hmac256_to_string(app_secret, to_sign) do
    :hmac.hmac256(app_secret, to_sign)
    |> :hmac.hexlify
    |> :string.to_lower
    |> String.from_char_list!
  end

  @doc """
  Compute a MD5, convert to hexadecimal and downcase it.
  """
  @spec md5_to_string(binary) :: binary
  def md5_to_string(data) do
    data
    |> md5
    |> :hmac.hexlify
    |> :string.to_lower
    |> String.from_char_list!
  end

  defp md5(data), do: :crypto.hash(:md5, data)
end
