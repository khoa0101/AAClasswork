require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    where_line = params.keys.map { |key| "#{key} = ?"}.join(" AND ")

    results = DBConnection.execute(<<-SQL, *params.values)
      select *
      from #{table_name}
      where #{where_line}
    SQL
    parse_all(results)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
