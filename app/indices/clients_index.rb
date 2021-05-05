ThinkingSphinx::Index.define :client, with: :active_record do
  # fields
  indexes surname, sortable: true 
  indexes name
  indexes patronymic
  indexes birthdate
  
  # attributes
  has country_id, group_id, group_position_id, team_position_id, created_at, updated_at
end
