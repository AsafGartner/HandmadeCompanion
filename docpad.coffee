# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
    collections:
        videoPages: ->
            @getCollection("html").findAllLive({relativeOutDirPath: {$beginsWith: "videos"}}).on "add", (model) ->
                model.setMetaDefaults({layout:"video"})

    templateData:
        site:
            title: "Handmade Companion"
            root_url: "https://hero.handmadedev.org"
            guide_url: "https://hero.handmadedev.org/jace/guide/"
            resources_url: "https://hero.handmadedev.org/jace/resources/"
            thanks_url: "https://hero.handmadedev.org/jace/thanks/"

        rootPath: ->
            if process.env["HOSTROOT"]?
                "/#{process.env["HOSTROOT"]}"
            else
                ""
        addSheet: (src)->
            @document.sheets = [] unless @document.sheets? 
            @document.sheets.push(src) unless src in @document.sheets

        sheetLink: (href)->
            "<link rel='stylesheet' type='text/css' href='#{href}' />"

        addScript: (src)->
            @document.scripts = [] unless @document.scripts? 
            @document.scripts.push(src) unless src in @document.scripts

        scriptLink: (src)->
            "<script type='text/javascript' src='#{src}'></script>"        
}

# Export the DocPad Configuration
module.exports = docpadConfig
