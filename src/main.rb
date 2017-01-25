# encoding: utf-8

require_relative 'translator/translator'
require_relative 'config'
require 'uri'
require 'clipboard'

def notify(data)
    if data['success']
        message = "Converted(#{data['lang']}) :: #{data['text']}"
        output = `node #{Config::NODE_NOTIFY} --title="QuickTranslator" --message="#{message}"`
        Clipboard.copy data['text']
    else
        message = "#{data['text']}"
        output = `node #{Config::NODE_NOTIFY} --title="ERROR | QuickTranslator" --message="#{message}"`
    end
    p message
end

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8


translator = Translator.new

translator.dest_lang = Translator::TURKISH

converted_result = translator.translate URI.escape("Hello")
notify(converted_result)
