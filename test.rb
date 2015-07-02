# -*- coding: utf-8 -*-
require 'sqlite3'
require 'dbi'

dbdata="sample_20150514.db"

print "See you World!"

db=SQLite3::Database.new(dbdata)

print"IDを入力してください:"
id=gets.to_i

print "名前を入力してください:"
name=gets.chomp

print "電話番号を入力してください:"
tel=gets.chomp

db.execute(sql)

db.close

