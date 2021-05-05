ThinkingSphinx::Index.define :group, with: :active_record do
  # fields
  indexes name, sortable: true 
  indexes city
  
  # attributes
  has country_id, group_status_id, created_at, updated_at
end
