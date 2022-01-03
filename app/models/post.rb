# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class Post < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('created_at DESC') }
end
