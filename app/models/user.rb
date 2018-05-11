require 'csv'
class User < ApplicationRecord
  belongs_to :team
  serialize :dev, Array
  serialize :theme, Array
  THEMES = ["사회 공헌 - 배워서 남 주자", "대학 교육 프로세스 개선", "더 나은 멋사를 위하여", "가정의 달", "일상을 벗어나자"]
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

  def self.get_one_theme
    Team.delete_all

    team_hash = {}
    self.all.each do |s|
      if s.theme.count == 1
        THEMES.each do |t|
          if s.theme.include? t
            team_hash[t].nil? ? team_hash[t] = [] : team_hash[t] << s
          end
        end
      end
    end

    team_hash.each do |k,v|
      team_hash = {}
      num = v.count.fdiv(6).ceil
      num.times do |n|
        team = Team.create(theme: k, title: k+(n+1).to_s)
        team_hash[team] = {univ: [], dev: []}
      end
      v.each do |user|
        # ㅠㅠ 나중에 연습하자
        team_hash.each do |team, data|
          if data.univ.include?(user.univ) && data.dev.select {|dev| dev == user.dev}.count < 4

          else
            #code
          end
        end
        # 프론트엔드인지 백엔드인지

      end
    end
    self.where(id: solo)
  end

  def self.get_themes(theme)
    result = []
    self.all.each do |s|
      result << s.id if s.theme.include? theme
    end
    self.where(id: result)
  end

  def self.get_dev(dev)
    result = []
    self.all.each do |s|
      result << s.id if s.dev.include? dev
    end
    self.where(id: result)
  end
end
