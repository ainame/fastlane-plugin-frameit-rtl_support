require 'frameit'
require 'bidi'
require_relative './arabic_reshaper'

# This file exsits to apply a monkey patch into frameit/editor.rb in order to enable RTL support
module Frameit
  class RTLEditor < Frameit::Editor
    include ::Frameit::ArabicReshaper

    @@bidi = Bidi.new

    def fetch(type)
      text = super(type)
      @@bidi.to_visual(reshape(text))
    end
  end
end