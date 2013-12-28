###
The MIT License (MIT)

Copyright (c) 2013 Thom Porter (www.thomporter.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
###
window.Valid8r = Valid8r = class Valid8r
    res:
        alpha: /^[A-z]+$/
        num: /^-?[0-9]+$/
        numNonNeg: /^[0-9]+$/
        alnum: /^[A-z0-9]+$/
        url: /^(([A-z]+):\/\/)?\/?([^\/\.]+\.)*?([^\/\.]+\.[^:\/\s\.]{2,3}(\.[^:\/\s\.]‌​{2,3})?)(:\d+)?($|\/)([^#?\s]+)?(.*?)?(#[\w\-]+)?$/
        url_noproto: /^\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/
        email_simple: /^[^@]+@[A-z0-9_-]+\.[A-z0-9_.-]{2,}$/
        email_default: /^[A-z0-9!#$%&\'*+\/=?^_`{|}~-]+(?:\.[A-z0-9!#$%&\'*+\/=?^_`{|}~-]+)*@(?:[A-z0-9](?:[A-z0-9-]*[A-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/
        email_rfc5322: /(?:[A-z0-9!#$%&\'*+\/=?^_`{|}~-]+(?:\.[A-z0-9!#$%&\'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[A-z0-9](?:[A-z0-9-]*[A-z0-9])?\.)+[A-z0-9](?:[A-z0-9-]*[A-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[A-z0-9-]*[A-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/
        ipv4: /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
        ipv6: /^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$/
        
        
    constructor: (options) ->
        defaults=
            bindToBlur: false
            type: "text"
            callback: (field,err) ->
            customValidators: {}
            rules: {}
            data: {}
            form: ''
        @options = jQuery.extend defaults, options
        @setRules(@options.rules) if @options.rules
        @callback = @options.callback
        @options.callback = undefined
        @validatingOnBlur = false
        @submittedOnce = false
        
        if @options.form
            @form = jQuery(options.form)
            @form.on('submit', @submitForm)

    submitForm: (e) =>
        @validatingOnBlur = false
        @submittedOnce = true
        num_err = 0
        for f,r of @options.rules
            @validate(f, jQuery(r.selector).val(), (field,err) =>
                if err
                    num_err++
                    @callback(field, err)
                else
                    @callback(field)
            )
        e.preventDefault() if (num_err) 
            
    setRules: (rules) ->
        ### @since v0.1.0 - _rules can be a property of the configuration object
        allowing for other properties to be included, such as _globalConditions
        ### 
        if rules._rules
            @options.globalConditions = rules._globalConditions || {}
            @options.rules = rules._rules
        else
            @options.globalConditions = {}
            @options.rules = rules
        
        jQuery.each @options.rules, (f,o) =>
            
            # add selector if necessary
            if not o.selector
                o.selector = @options.rules[f].selector = '#'+f
            
            # bind to blur event if necessary
            if @options.bindToBlur && not o.doNotBind
                if o.type == 'checks' || o.type == 'radios'
                    jQuery(o.selector).on('click', @validateOnBlur).data('valid8r_field',f)
                else
                    jQuery(o.selector).on('blur', @validateOnBlur).data('valid8r_field',f)
        
    setCallback: (cb) ->
        @callback = cb
        

    satisfiesConditions: (r, rule) ->
        # @since v0.1.0 - conditions can be set globally
        c = r.conditions?[rule.when] || @options.globalConditions[rule.when]
        sel = c.selector || '#' + c.field;
        v = jQuery(sel).val();
        return v == c.is
        
    validateOnBlur: (e) =>
        @validatingOnBlur = true
        f = jQuery(e.target).data('valid8r_field')
        v = jQuery(e.target).val()
        @validate(f, v, @callback)
        
    validate: (field, value, cb) =>
        r=@options.rules[field]
        if (!r)
            return cb(field, 'Not Setup in Rules')
        num_rules = 0
        for rule in r.rules
            continue if (rule.async and not @validatingOnBlur) || (rule.when and not @satisfiesConditions(r, rule)) 
            num_rules++
            switch rule.rule
                when "required" then if not @validRequired(field, value, rule, cb) then return false;
                when "len" then if not  @validLen(field, value, rule, cb) then return false;
                when "isAlpha" then if not @validIsAlpha(field, value, rule, cb) then return false;
                when "isNum" then if not @validIsNum(field, value, rule, cb) then return false;
                when "isAlnum" then if not @validIsAlnum(field, value, rule, cb) then return false;
                when "formattedAs" then if not @validFormat(field, value, rule, cb) then return false;
                when "regex" then if not @validRegex(field, value, rule, cb) then return false;
                when "val" then if not @validVal(field, value, rule, cb) then return false;
                when "email" then if not @validEmail(field, value, rule, cb) then return false;
                when "url" then if not @validUrl(field, value, rule, cb) then return false;
                when "checks" then if not @validChecks(field, r, rule, cb) then return;
                when "radios" then if not @validRadios(field, r, rule, cb) then return false;
                when "custom" then if not @validCustom(field, value, rule, cb) then return false;
                when "ip" then if not @validIp(field, value, rule, cb) then return false;
                else cb(field, 'Invalid Validator: ' + rule.rule) 
                
    validCustom: (field, value, rule, cb) ->
        if (rule.func && typeof rule.func is 'function')
            return rule.func(field, value, cb);
        else if (rule.func && typeof rule.func is 'string')
            if (@options.customValidators[rule.func])
                return @options.customValidators[rule.func](field, value, cb)
            else if (typeof window[rule.func] is 'function')
                return window[rule.func](field, value, cb)
            else
                cb(field,'Invalid Custom Function: ' + rule.func)
                return false;
        else
            cb(field,'Invalid Custom Function: ' + rule.func)
            return false;
            
            
    validRequired: (field, value, rule, cb) ->
        if value == ''
            cb(field, rule.errStr || 'Please enter a value.')
            return false
        cb(field)
        return true
        
    validRadios: (field, parent_rule, rule, cb) ->
        sel = parent_rule.selector || 'input[name="' + field + '"]'
        if not jQuery(sel+':checked').length
            cb(field, rule.errStr || 'Please choose a value.')
            return false
        cb(field)
        return true
        
    validIp: (field, value, rule, cb) ->
        if value
            if rule.v
                if not value.match(@res['ipv'+rule.v])
                    cb(field, rule.errStr || 'Invalid IP Address')
                    return false
            else
                if not value.match(@res.ipv4) && not value.match(@res.ipv6)
                    cb(field, rule.errStr || 'Invalid IP Address')
                    return false
        cb(field)
        return true
        
    validLen: (field, value, rule, cb) ->
        len = value.length
        if rule.min && rule.max
            if len < rule.min || len > rule.max
                cb(field, rule.errStr || 'Between %d and %d characters required.')
                return false

        if rule.min
            if value.length < rule.min
                cb(field, rule.errStr || 'At least %d characters are required.')
                return false
                
        if rule.max
            if value.length > rule.max
                cb(field, rule.errStr || 'At least %d characters are required.')
                return false
        cb(field)
        return true
        
    validIsAlpha: (field, value, rule, cb) ->
        if value != '' and not value.match(@res.alpha)
            cb(field, rule.errStr || 'Please enter alphabetic characters only (A-z).')
            return false
        cb(field)
        return true
        
    validIsNum: (field, value, rule, cb) ->
        if value != ''
            if rule.nonNeg
                if not value.match(@res.numNonNeg)
                    cb(field, rule.errStr || 'Please enter numeric characters only (0-9).')
                    return false
            else
                if not value.match(@res.num)
                    cb(field, rule.errStr || 'Please enter numeric characters only (0-9).')
                    return false
        cb(field)
        return true
    
    validIsAlnum: (field, value, rule, cb) ->
        if value != '' and not value.match(@res.alnum)
            cb(field, rule.errStr || 'Please enter alphanumeric characters only (A-z, 0-9).')
            return false
        cb(field)
        return true
        
    validFormat: (field, value, rule, cb) ->

        if value != ''
            re = @preg_quote(rule.format)
            re = re.replace(/D/g, '\\d').replace(/A/g, '[a-zA-Z]')
            if not value.match(re)
                cb(field, rule.errStr || 'Does not match required format of: ' + rule.format)
                return false
        cb(field)
        return true

    validRegex: (field, value, rule, cb) ->
        if value != '' 
            re = new RegExp(rule.pattern, rule.modifiers)
            if not value.match(re)
                cb(field, rule.errStr || 'Does not match required pattern: ' + rule.pattern)
                return false
        cb(field)
        return true

    validVal: (field, value, rule, cb) ->
        if value != ''
            v = parseFloat(value)
            if v == NaN
                cb(field, rule.nanErrStr || 'Please enter a number.')
                return false
                
            if rule.is
                if v != rule.is
                    cb(field, rule.errStr || 'Please enter ' + rule.is)
                    return false
            if rule.min
                if v < rule.min
                    cb(field, rule.errStr || 'Please enter a number greater than or equal to ' + rule.min)
                    return false
            if rule.max 
                if v > rule.max
                    cb(field, rule.errStr || 'Please enter a number less than or equal to ' + rule.max)
                    return false
            if rule.outside
                if (v >= rule.outside[0] && v <= rule.outside[1])
                    cb(field, rule.errStr || 'Please enter a number outside of ' + rule.outside[0] + '-' + rule.outside[1])
                    return false
        cb(field)
        return true
        
    validEmail: (field, value, rule, cb) ->
        if value != ''
            re = rule.validator || 'default'
            if not @res['email_'+re]
                cb(field, 'INVALID EMAIL VALIDATOR: ' + re)
                return false
            if not value.match(@res['email_'+re])
                cb(field, rule.errStr || 'Pleaes enter a valid email address.')
                return false
        cb(field)
        return true
        
    validUrl: (field, value, rule, cb) ->
        if value isnt ""
            matches = value.match(@res.url)
            if not matches || not matches[4] # 4th match will be the host
                cb(field, rule.errStr || 'Invalid URL, please try again.');
                return false
            protos = []
            if rule.protocols
                if typeof rule.protocols is 'string'
                    protos = rule.protocols.split(',')
                else
                    protos = rule.protocols
                if protos.indexOf(matches[2]) is -1
                    cb(field, rule.errStr || 'Invalid URL Protocol, please enter one of: ' + protos.join(', '))
                    return false
            else if (rule.noProtocols)
                if matches[2]
                    cb(field, rule.errStr || 'Pleaes enter a URL without protocols (eg, http://, https://, etc.)')
                    return false
            else if not matches[2]
                cb(field, rule.errStr || 'Pleaes enter a URL with a protocol (eg, http://, https://, etc.)')
                return false
                
        cb field
        return true
            

    validChecks: (field, parent_rule, rule, cb) ->
        sel = parent_rule.selector || 'input[name="' + field + '"]:checked'
        num_checked = jQuery(sel+':checked').length

        if rule.min && rule.max
            if rule.min > num_checked || rule.max < num_checked
                cb(field, rule.errStr || 'Please check between ' + rule.min + ' and ' + rule.max + ' options.')
                return false
        if rule.min
            if rule.min > num_checked
                cb(field, rule.errStr || 'Please check at least ' + rule.min + ' options.')
                return false
        if rule.max
            if rule.max < num_checked
                cb(field, rule.errStr || 'Please check no more than ' + rule.max + ' options.')
                return false
        cb(field)
        return true

    preg_quote: (str, delimiter) ->
        ###
        From: http://phpjs.org/functions
        +   original by: booeyOH
        +   improved by: Ates Goral (http://magnetiq.com)
        +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
        +   bugfixed by: Onno Marsman
        +   improved by: Brett Zamir (http://brett-zamir.me)
        *     example 1: preg_quote("$40");
        *     returns 1: '\$40'
        *     example 2: preg_quote("*RRRING* Hello?");
        *     returns 2: '\*RRRING\* Hello\?'
        *     example 3: preg_quote("\\.+*?[^]$(){}=!<>|:");
        *     returns 3: '\\\.\+\*\?\[\^\]\$\(\)\{\}\=\!\<\>\|\:'
        ###
        (str + "").replace new RegExp("[.\\\\+*?\\[\\^\\]$(){}=!<>|:\\" + (delimiter or "") + "-]", "g"), "\\$&"
