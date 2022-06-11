class Address < ApplicationRecord
  belongs_to :customer

  def address_display
    '〒' + potal_code + ' ' + address + ' ' + name
  end
end
