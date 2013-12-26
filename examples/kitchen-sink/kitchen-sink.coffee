customValidator = (field, value, cb) ->
    if (value != 'custom')
        cb(field, 'Example error from custom validator.')
        return false
    cb(field);
    return true;

customAsynchronousValidator = (field, value, cb) ->
    $.get('./customAsynchronousValidator.php', {field: field, value: value}, (d) ->
        if (d.err) 
            cb(field, d.err)
        else 
            cb(field);
    , 'json').error(->
        cb(field,'AJAX Error - custom validator requires ./customAsynchronousValidator.php to be working.')
    )
    return false;

$ ->
    valid = new Valid8r
        bindToBlur: true
        form: '#example-form'
        callback: (field,err) ->
            o = $('#'+field).parents('.form-group')
            if (err)
                o.addClass('has-error').removeClass('has-success')
                e = o.find('.help-block')
                if (!e.length)
                    if (o.find('.rule').length)
                        e = $('<div class="help-block"></div>').insertBefore(o.find('.rule'))
                    else
                        e = $('<div class="help-block"></div>').appendTo(o)
                e.html(err).show()
                    
            else
                o.removeClass('has-error').addClass('has-success')
                o.find('.help-block').hide()
    
    $.get('./kitchen-sink.json', (d) ->
        valid.setRules(d)
    ,'json')
