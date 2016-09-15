## QuickTranslator

The basic ruby program that uses yandex's tranlate API.
Simply converts languages. Default Destination language is Turkish.

____________

### Requirements

- ruby 2.3.1p112 or greater
- Dependencies of [Clipboard](https://github.com/janlelis/clipboard) Gem
- Dependencies of [Unirest](http://unirest.io/ruby.html) Gem
- NodeJS
- And Dependencies of [node-notifier](https://github.com/mikaelbr/node-notifier) library

______________

### Usage


You can change destination language easily in `src/main.rb`

```ruby

translator = Translator.new

translator.dest_lang = Translator::TURKISH # For convert to turkish
translator.dest_lang = Translator::ENGLISH # For convert to english
# you can use country code as well
translator.dest_lang = 'tr' # like this

```

This program also need a config file that is hidden in this repository but 
you can create yourself. Example `/src/config.rb` file looks like this.

```ruby

module Config

    API_KEY = "YOUR_AWESOME_YANDEX_API_KEY"
    NODE_NOTIFY = __dir__ + "/../notify.js"

end

```

You can add custom shortcut to run this program.