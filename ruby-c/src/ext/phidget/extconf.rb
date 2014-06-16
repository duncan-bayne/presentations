require 'mkmf'

extension_name = 'phidget'
have_library('phidget21')
dir_config(extension_name)
create_makefile(extension_name)
