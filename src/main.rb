require_relative 'translator/translator'
require_relative 'config'
require 'uri'
require 'clipboard'

def notify(data)
    if data['success']
        message = %(
Language :: #{data['lang']} Converted :: #{data['text']}
Converted Text also copied to clipboard.
        )
        output = `node #{Config::NODE_NOTIFY} --title='QuickTranslator' --message='#{message}'`
        Clipboard.copy data['text']
        p output
    else 
        message = %(
#{data['text']}
        )
        output = `node #{Config::NODE_NOTIFY} --title='ERROR | QuickTranslator' --message='#{message}'`
        p output
    end
end


translator = Translator.new
converted_result = translator.translate URI.escape Clipboard.paste
notify(converted_result)



