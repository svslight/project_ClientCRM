ThinkingSphinx::Index.define :group, with: :active_record do
  # fields
  indexes name, sortable: true 
  indexes city
  # indexes country.name, as: :country, sortable: true
  indexes group_status.name, as: :group_status, sortable: true
  
  # attributes
  has country_id, group_status_id, created_at, updated_at
end
