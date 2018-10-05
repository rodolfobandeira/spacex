module SPACEX
  class Resource < Hashie::Trash
    include Hashie::Extensions::IgnoreUndeclared
  end
end
