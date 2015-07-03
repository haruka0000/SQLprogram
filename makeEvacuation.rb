def earthquake
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM 地震;"

	#select
	db.execute(sql) do |row|

		# the building in Evacuation table?
		#sql code
        check_sql = "SELECT 建物名 FROM 避難所 where 建物名='#{row[1]}';"
        print "#"
        if db.execute(check_sql).size == 0
            sql1 = "insert into 避難所 values('#{row[1]}', '#{row[2]}', 'A', ' ', ' ', ' ', ' ', ' ', ' ');"
        else
            sql1 = "update 避難所 set 地震='A' where 建物名='#{row[1]}';"
		end

        db.execute(sql1)
    end

	db.close

end

def tsunami
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM 津波;"

	#select
	db.execute(sql) do |row|

		# the building in Evacuation table?
		#sql code
        check_sql = "SELECT 建物名 FROM 避難所 where 建物名='#{row[1]}';"
        print "#"
        if db.execute(check_sql).size == 0
            sql2 = "insert into 避難所 values('#{row[1]}', '#{row[2]}', ' ', 'A', ' ', ' ', ' ', ' ', ' ');"
        else
            sql2 = "update 避難所 set 津波='A' where 建物名='#{row[1]}';"
		end

        db.execute(sql2)
    end

	db.close

end

def flood
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM 洪水;"

	#select
	db.execute(sql) do |row|

		# the building in Evacuation table?
		#sql code
        check_sql = "SELECT 建物名 FROM 避難所 where 建物名='#{row[1]}';"
        print "#"
        if db.execute(check_sql).size == 0
            sql1 = "insert into 避難所 values('#{row[1]}', '#{row[2]}', ' ', ' ', 'A', ' ', ' ', ' ', ' ');"
        else
            sql1 = "update 避難所 set 洪水='A' where 建物名='#{row[1]}';"
		end

        db.execute(sql1)
    end

	db.close

end

def surge
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM 高潮;"

	#select
	db.execute(sql) do |row|

		# the building in Evacuation table?
		#sql code
        check_sql = "SELECT 建物名 FROM 避難所 where 建物名='#{row[1]}';"
        print "#"
        if db.execute(check_sql).size == 0
            sql1 = "insert into 避難所 values('#{row[1]}', '#{row[2]}', ' ', ' ', ' ', 'A', ' ', ' ', ' ');"
        else
            sql1 = "update 避難所 set 高潮='A' where 建物名='#{row[1]}';"
		end

        db.execute(sql1)
    end

	db.close

end

def landslide
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM 土砂;"

	#select
	db.execute(sql) do |row|

		# the building in Evacuation table?
		#sql code
        check_sql = "SELECT 建物名 FROM 避難所 where 建物名='#{row[1]}';"
        print "#"
        if db.execute(check_sql).size == 0
            sql1 = "insert into 避難所 values('#{row[1]}', '#{row[2]}', ' ', ' ', ' ', ' ', 'A', ' ', ' ');"
        else
            sql1 = "update 避難所 set 土砂='A' where 建物名='#{row[1]}';"
		end

        db.execute(sql1)
    end

	db.close

end

def fire
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM 火事;"

	#select
	db.execute(sql) do |row|

		# the building in Evacuation table?
		#sql code
        check_sql = "SELECT 建物名 FROM 避難所 where 建物名='#{row[1]}';"
        print "#"
        if db.execute(check_sql).size == 0
            sql1 = "insert into 避難所 values('#{row[1]}', '#{row[2]}', ' ', ' ', ' ', ' ', ' ', 'A', ' ');"
        else
            sql1 = "update 避難所 set 火事='A' where 建物名='#{row[1]}';"
		end

        db.execute(sql1)
    end

	db.close

end

def inlandwaters
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM 内水;"

	#select
	db.execute(sql) do |row|

		# the building in Evacuation table?
		#sql code
        check_sql = "SELECT 建物名 FROM 避難所 where 建物名='#{row[1]}';"
        print "#"
        if db.execute(check_sql).size == 0
            sql1 = "insert into 避難所 values('#{row[1]}', '#{row[2]}', ' ', ' ', ' ', ' ', ' ', ' ', 'A');"
        else
            sql1 = "update 避難所 set 内水='A' where 建物名='#{row[1]}';"
		end

        db.execute(sql1)
    end

	db.close

end


def makeTable()
    earthquake
    print "\n1 finish!! \n"

    tsunami
    print "\n2 finish!! \n"

    flood
    print "\n3 finish!! \n"

    surge
    print "\n4 finish!! \n"

    landslide
    print "\n5 finish!! \n"

    fire
    print "\n6 finish!! \n"

    inlandwaters
    print "\n7 finish!! \n"

end
