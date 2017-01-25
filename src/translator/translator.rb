# encoding: utf-8

require_relative '../config'
require 'unirest'

class Translator

    ENGLISH = :en
    TURKISH = :tr
    API_URL = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=%s&text=%s&lang=%s"


    attr_writer :dest_lang

    def dest_lang
        @dest_lang || :tr
    end

    def translate(text)

        url = API_URL % [Config::API_KEY, text, self.dest_lang.to_s]

        response = Unirest.get(url).body

        result = {}

        if response['code'] == 200
            result['success'] = true
            result['lang'] = response['lang']
            result['text'] = response['text'].join ' '
        else
            result['success'] = false
            result['text'] = "Translation failed!! Response Code: #{response['code']}"
        end

        result
    end


end
