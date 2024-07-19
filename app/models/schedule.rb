class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :title, length: {maximum: 20}
    validates :startDate, presence: true
    validates :endDate, presence: true
    validates :scheduleMemo, length: {maximum: 500}
    validate :startDate_endDate_check

    def startDate_endDate_check
        errors.add(:endDate,"は開始日より遅い日を選択してください")if startDate > endDate
    end
end
