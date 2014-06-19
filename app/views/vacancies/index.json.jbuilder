json.array!(@vacancies) do |vacancy|
  json.extract! vacancy, :id, :name, :created_at, :valid_until, :salary, :contacts
  json.url vacancy_url(vacancy, format: :json)
end
