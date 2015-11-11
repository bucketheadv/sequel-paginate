$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sequel/paginate'

Dir.glob(File.expand_path("../fixtures/**/*.rb", __FILE__)).map(&method(:require))
