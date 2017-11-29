# Scoping defines helper functions for managing scoped resources
module Scoping
  # Retrieve handles retreiving scoped resources
  module Retrieve
    def scoped(user)
      return name.constantize.all if user.has_role? :coach
      table_name = name.downcase + 's'
      sql = "SELECT #{table_name}.* FROM users
             INNER JOIN users_roles ON users.id = users_roles.user_id
             INNER JOIN scopes ON scopes.role_id = users_roles.role_id
             INNER JOIN #{table_name} ON #{table_name}.id = scopes.resource_id
             WHERE users.id = #{user.id} AND scopes.resource = '#{name.capitalize}';"
      records = ActiveRecord::Base.connection.execute(sql)
      fields = records.fields
      records.values.map { |vals| name.constantize.instantiate(Hash[fields.zip(vals)]) }
    end
  end

  # Scopify module adds scopes to resources
  module Scopey
    def scopify(roles)
      resource_name = self.class.name
      if roles
        roles.each do |role_id|
          Scope.create(resource: resource_name, resource_id: id, role_id: role_id)
        end
      else
        Role.all.each do |role|
          Scope.create(resource: resource_name, resource_id: id, role_id: role.id)
        end
      end
    end
  end
end
