# filebrowserCR

Convertion of a php file browser web application ( https://tutorialzine.com/2014/09/cute-file-browser-jquery-ajax-php ) to Crystal-lang to browse and search files.

![File Browser](https://raw.githubusercontent.com/xtokio/filebrowserCR/master/filebrowser.png)

Gif example
![File Browser](https://raw.githubusercontent.com/xtokio/filebrowserCR/master/filebrowser.gif)

## Installation

You need to place your searchable folder inside the `public` folder and modify the file `filebrowser.json` with the correct values from your personal environment/folder destination.

Compile to run
```crystal
crystal src/filebrowserCR.cr
```

Compile to create executable
```crystal
crystal build src/filebrowserCR.cr --release
```

## Contributing

1. Fork it (<https://github.com/xtokio/filebrowserCR/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Luis Gómez](https://github.com/xtokio) - creator and maintainer
