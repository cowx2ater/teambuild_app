require 'csv'
class User < ApplicationRecord
  serialize :dev, Array
  serialize :theme, Array
  def self.import_user
    items = []
    CSV.foreach('./db/result.csv', headers: true) do |row|
      row = row.to_h
      if row["dev"].include?("&")
        row["dev"] = row["dev"].split("&").map(&:strip)
      else
        temp_ary = []
        temp_ary << row["dev"]
        row["dev"] = temp_ary
      end

      if row["theme"].include?(",")
        row["theme"] = row["theme"].split(",").map(&:strip)
      else
        temp_ary = []
        temp_ary << row["theme"]
        row["theme"] = temp_ary
      end
      items << (row.to_h)
    end
    User.import(items)
  end
end
