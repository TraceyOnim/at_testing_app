defmodule AtTester.Sms do
  def send_sms(message, phone_number) do
    HTTPoison.post(_url(), _body(message, phone_number), _headers())
  end

  defp _url do
    "https://api.sandbox.africastalking.com/version1/messaging"
  end

  defp _body(message, phone_number) do
    %{
      username: Application.get_env(:at_tester, :username),
      to: phone_number,
      message: message,
      from: "27594"
    }
    |> URI.encode_query()
  end

  defp _headers do
    [
      {"Content-Type", "application/x-www-form-urlencoded"},
      {"apiKey", Application.get_env(:at_tester, :at_api_key)},
      {"Accept", "application/json"}
    ]
  end
end
