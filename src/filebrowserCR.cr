# TODO: Write documentation for `FilebrowserCR`
require "kemal"

# Default configuration
port = 3000
folder_path = "/Users/luis/Desktop/Code/Crystal/apps/filebrowserCR/public"
folder = "#{folder_path}/test"

class Configuration
  JSON.mapping(
    port: Int32,
    path: String,
    folder: String
  )
end

output = File.read("filebrowser.json")
response = JSON.parse(output.to_s)
json = Configuration.from_json(response.to_json)

port = json.port
folder_path = json.path
folder = "#{json.path}/#{json.folder}"

# JSON generator
def read_folder(folder,folder_path)
  d = Dir.new(folder)
  response = JSON.build do |json|
    json.object do
      json.field "name" , d.path.gsub(folder_path+"/", "")
      json.field "type" , "folder"
      json.field "path" , d.path.gsub(folder_path+"/", "")

      json.field "items" do
        json.array do
          d.each_child do |x|
            if !Dir.exists?(d.path+"/"+x)
              json.object do
                json.field "name" , d.path.gsub(folder_path+"/", "")+"/"+x
                json.field "type" , "file"
                json.field "path" , d.path.gsub(folder_path+"/", "")+"/"+x
                json.field "size" , File.size(d.path+"/"+x)
              end
            else
              json.raw read_folder(d.path+"/"+x,folder_path)
            end
          end            
        end
      end

    end
  end

  response
end

module FilebrowserCR
  VERSION = "0.1.0"

  error 404 do
    render "src/views/404.ecr" , "src/layouts/base.ecr"
  end

  error 500 do
    render "src/views/404.ecr" , "src/layouts/base.ecr"
  end

  static_headers do |response, filepath, filestat|
    response.headers.add("Cache-control", "public")
    response.headers.add("Cache-control", "max-age=31557600")
    response.headers.add("Cache-control", "s-max-age=31557600")
    response.headers.add("Content-Size", filestat.size.to_s)
  end

  # TODO: Put your code here
  get "/" do |env|
    render "src/views/index.ecr" , "src/layouts/base.ecr"
  end

  get "/scan" do |env|
    json = read_folder(folder,folder_path)
  end

end
Kemal.run(port)