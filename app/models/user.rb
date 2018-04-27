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

  def self.set_array
    self.all.each do |u|
      if u.dev.include?("&")
        u.dev = u.dev.split("&")
      else
        temp_ary = []
        temp_ary << u.dev
        u.dev = temp_ary
      end

      if u.theme.include?(",")
        u.theme = u.theme.split(",")
      else
        temp_ary = []
        temp_ary << u.theme
        u.theme = temp_ary
      end
      u.save
    end
  end
end
