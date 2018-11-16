if Mix.env == :test do
  defmodule ExTrails.Mocks do
    def get_mock(module) do
      module_as_file =
        module
        |> Atom.to_string
        |> String.split(".")
        |> List.last
        |> Macro.underscore

      File.cwd!()
      |> Path.join("/mocks/#{module_as_file}.json")
      |> File.read!
    end
  end
end
