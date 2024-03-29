# Modifed the example from https://talk.jekyllrb.com/t/how-to-properly-indicate-an-error-during-site-generation/447/2

module MyFilters
    def log_info(msg)
        bad_file = @context.registers[:page]['path']
        err_msg = "In #{bad_file}: #{msg}"
        warn err_msg
        return msg
    end
    def log_warning(msg)
        bad_file = @context.registers[:page]['path']
        err_msg = "\033[33mIn #{bad_file}: #{msg}\033[0m"
        warn err_msg
        return msg
    end
    def log_error(msg)
        bad_file = @context.registers[:page]['path']
        err_msg = "\033[31mIn #{bad_file}: #{msg}\033[0m"
        warn err_msg
        return msg
    end
    def raise_error(msg)
        raise msg
    end
end

Liquid::Template.register_filter(MyFilters)
