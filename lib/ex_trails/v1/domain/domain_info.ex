defmodule ExTrails.V1.Domain.DomainInfo do
  defstruct [
    :alexa_rank,
    :current_dns,
    :endpoint,
    :hostname
  ]

  alias __MODULE__
  alias ExTrails.V1.Records.{ARecord, AAAARecord, MXRecord, NSRecord, SOARecord, TXTRecord}

  def parse(%DomainInfo{} = info) do
    aData = _get_key(info, "a")
    aaaaData = _get_key(info, "aaaa")
    mxData = _get_key(info, "mx")
    nsData = _get_key(info, "ns")
    soaData = _get_key(info, "soa")
    txtData = _get_key(info, "txt")

    aStruct = struct!(ARecord, aData)
    aaaaStruct = struct!(AAAARecord, aaaaData)
    mxStruct = struct!(MXRecord, mxData)
    nsStruct = struct!(NSRecord, nsData)
    soaSturct = struct!(SOARecord, soaData)
    txtStruct = struct!(TXTRecord, txtData)

    %{info | current_dns: %{a: aStruct, aaaa: aaaaStruct, mx: mxStruct, ns: nsStruct, soa: soaSturct, txt: txtStruct}}
  end

  defp _get_key(%{current_dns: dns}, key) do
    dns
    |> Map.get(key)
    |> Enum.map(fn {key, value} -> {String.to_existing_atom(key), value} end)
    |> Enum.into(%{})
  end
end
