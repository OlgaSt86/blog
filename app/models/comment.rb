# frozen_string_literal: true

class Comment < ApplicationRecord
  include Visible
  include Likeable
  belongs_to :article
end
