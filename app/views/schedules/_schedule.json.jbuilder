json.extract! schedule, :id, :title, :startDate, :endDate, :allDay, :scheduleMemo, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
