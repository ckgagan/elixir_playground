# defmodule ImageProcessing do
#   import Mogrify

#   def resize_image(input_path, output_path, width, height) do
#     input_path
#     |> open()
#     |> resize("#{width}x#{height}")
#     |> save(path: output_path)
#   end

#   def convert_format(input_path, output_path, format) do
#     input_path
#     |> open()
#     |> format(format)
#     |> save(path: output_path)
#   end

#   def add_watermark(input_path, watermark_path, output_path) do
#     input_path
#     |> open()
#     |> custom("composite", watermark_path, "-gravity", "southeast")
#     |> save(path: output_path)
#   end
# end
