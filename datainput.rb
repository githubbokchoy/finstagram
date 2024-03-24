#db = 'db/db.sqlite3'
#db = SQLite3::Database('./db/db.sqlite3')
require 'sqlite3'
db = SQLite3::Database.open './db/db.sqlite3'

db.execute("INSERT INTO comments (user_id, finstagram_post_id, text) VALUES (?, ?, ?)", [2, 1, "Mar 24 2024 1st comments"])



# begin
#     ActiveRecord::Base.connection.execute custom_sql
#     User.where("id in (#{custom_sql})")  
#   rescue 
#     puts "Error"
#   end


#user_id: 1, finstagram_post_id: 1, text: "Mar 23 2024 comment again"},
 # {user_id: 2, finstagram_post_id: 1, text: "Mar 23 2024 #2 comment"}

#  INSERT INTO table (column1,column2 ,..)
# VALUES( value1,	value2 ,...);

# trancate_sql="TRUNCATE #{table_name}"
#     ActiveRecord::Base.connection.execute(trancate_sql)

#db = SQLite3::Database.new('RM.db')


# require 'sqlite3'

# db = SQLite3::Database.open 'test.db'
# db.execute "INSERT INTO images (path, thumbs_up) VALUES (?, ?)", 'image1.png', 0