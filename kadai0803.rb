# coading:utf-8
require'sqlite3'
require'tk'

$dbdata = "sample_20150521.db"
$data1=nil
$tree=nil
$frame_view = nil
$frame_first = nil
$frame_select = nil
$frame_selectall = nil
$frame_insert = nil

def select(id_text)
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM kogi natural join seito where 科目コード（主キー）= #{id_text};"

	$data1=Hash.new{|hash,key| hash[key] = {}}
	i = 0

	#select
	db.execute(sql) do |row|
		$data1[i][0] = row[0]
		$data1[i][1] = row[1]
		$data1[i][2] = row[2]
		$data1[i][3] = row[3]
		$data1[i][4] = row[4]
		i=i+1
	end

	db.close

	return $data1

end

def selectall
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "SELECT * FROM kogi natural join seito;"

	$data1=Hash.new{|hash,key| hash[key] = {}}
	i = 0

	#select
	db.execute(sql) do |row|
		$data1[i][0] = row[0]
		$data1[i][1] = row[1]
		$data1[i][2] = row[2]
		$data1[i][3] = row[3]
		$data1[i][4] = row[4]
		i=i+1
	end

	db.close

	return $data1

end


def inserts(sbjct, id, grade, cls, name)
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "insert into seito values(#{id},'#{name}',#{cls});"
	db.execute(sql)
	db.close
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "insert into kogi values(#{sbjct},#{id},#{grade},#{cls});"
	db.execute(sql)
	db.close
end

#delete
def del(id)
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "delete from kogi where 科目コード（主キー）= #{id};"
	db.execute(sql)
	db.close
end

#update
def updt(kamoku, clm, fix)
	
	#database open
	db = SQLite3::Database.new($dbdata)

	#sql code
	sql = "update kogi set #{clm} = '#{fix}' where 科目コード（主キー） = #{kamoku};"
	puts sql
	db.execute(sql)
	db.close
end

#treeview
def view(data1)

	#table draw
	i = 0
	i.upto(data1.length-1) do |i|
		$tree.insert(nil, :end, id:nil, text:nil, value:[data1[i][0], data1[i][1], data1[i][2], data1[i][3], data1[i][4]]);
	end
end

#window 
window = TkRoot.new {
	title'応用プログラミング第八回'
	resizable [0,0]
}

$frame_tree = TkFrame.new(window)
$frame_first = TkFrame.new(window)
$frame_select = TkFrame.new(window)
$frame_insert = TkFrame.new(window)
$frame_delete = TkFrame.new(window)
$frame_update = TkFrame.new(window)

$tree = Ttk::Treeview.new($frame_tree, show: :headings).pack

$tree ['columns'] = 'sbjct id grade cls name'

#scroll
yscrollbar = $tree.yscrollbar(TkYScrollbar.new(nil))
yscrollbar.pack('side' => 'right', 'fill' => 'both')

$tree.pack('side' => 'left', 'fill' => 'both', 'expand' => 'yes')
$frame_tree.pack('side' => 'top', 'fill' => 'both', 'expand' => 'yes')

%w(sbjct id grade cls name).zip(%w(科目コード（主キー） 学生番号（主キー） 成績 クラスコード 氏名)).each do |col, item|
	$tree.heading_configure(col, text:item)
end

button_back = TkButton.new($frame_tree,"text"=>"戻る").bg("red").pack
button_back.command = proc {
	$frame_first.pack
	$frame_select.unpack
	$frame_insert.unpack
	$frame_delete.unpack
	$frame_update.unpack
}

#-------------------------------------------------------
# 初期画面設定(最初は表示)
$frame_first.pack

# 登録用画面切り替えボタン
button_in = TkButton.new($frame_first,"text"=>"登録").pack
# 登録ボタンが押されたときの処理
button_in.command = proc {
	$tree.delete($tree.children(nil));
	view(selectall);
	$frame_first.unpack
	$frame_select.unpack
	$frame_insert.pack
}

# 条件検索用画面切り替えボタン
button_sel = TkButton.new($frame_first,"text"=>"条件検索").pack
# 条件検索ボタンが押されたときの処理
button_sel.command = proc {
	$tree.delete($tree.children(nil));
	view(selectall);
	$frame_first.unpack
	$frame_select.pack
	$frame_insert.unpack
}

# 削除用画面切り替えボタン
button_del = TkButton.new($frame_first,"text"=>"削除").pack
# 削除ボタンが押されたときの処理
button_del.command = proc {
	$tree.delete($tree.children(nil));
	view(selectall);
	$frame_first.unpack
	$frame_select.unpack
	$frame_delete.pack
}

# 更新用画面切り替えボタン
button_up = TkButton.new($frame_first,"text"=>"更新").pack
# 更新ボタンが押されたときの処理
button_up.command = proc {
	$tree.delete($tree.children(nil));
	view(selectall);
	$frame_first.unpack
	$frame_select.unpack
	$frame_update.pack
}

# 全検索実行ボタン
button_all = TkButton.new($frame_first,"text"=>"全検索実行").bg("green").pack
# 全検索実行ボタンが押されたときの処理
button_all.command = proc {
	$tree.delete($tree.children(nil));	# Treeviewデータをクリア
 	view(selectall);
}

#-------------------------------------------------------

# 条件検索用の画面準備(最初は非表示)
$frame_select.unpack

#entry
TkLabel.new($frame_select, 'text'=>'検索する科目コードを入力してください').pack
#
entry=TkEntry.new($frame_select).pack
#
button=TkButton.new($frame_select,"text"=>"検索実行").pack
#
button.command=proc{
	$tree.delete($tree.children(nil));
	view(select(entry.value));
}
#-------------------------------------------------------

# 登録用の画面準備(最初は非表示)
$frame_insert.unpack

#entries
TkLabel.new($frame_insert, 'text'=>'科目コード').pack
sbjct_entry=TkEntry.new($frame_insert).pack
TkLabel.new($frame_insert, 'text'=>'id').pack
id_entry=TkEntry.new($frame_insert).pack
TkLabel.new($frame_insert, 'text'=>'成績').pack
grade_entry=TkEntry.new($frame_insert).pack
TkLabel.new($frame_insert, 'text'=>'クラス').pack
cls_entry=TkEntry.new($frame_insert).pack
TkLabel.new($frame_insert, 'text'=>'氏名').pack
name_entry=TkEntry.new($frame_insert).pack
#
insert_button=TkButton.new($frame_insert,"text"=>"INSERT!!").pack
#
insert_button.command=proc{
	$tree.delete($tree.children(nil));
	inserts(sbjct_entry.value, id_entry.value, grade_entry.value, cls_entry.value,name_entry.value);
	view(selectall);
}
#-------------------------------------------------------

# 削除用の画面準備(最初は非表示)
$frame_delete.unpack
#delete
TkLabel.new($frame_delete, 'text'=>'削除する科目コードを入力してください').pack
del_entry=TkEntry.new($frame_delete).pack
#
del_button=TkButton.new($frame_delete,"text"=>"DELETE!!").pack
#
del_button.command=proc{
	$tree.delete($tree.children(nil));
	del(del_entry.value);
	view(selectall);
}
#-------------------------------------------------------

# 更新用の画面準備(最初は非表示)
$frame_update.unpack
#update
TkLabel.new($frame_update, 'text'=>'科目コード').pack
kamoku_entry=TkEntry.new($frame_update).pack
TkLabel.new($frame_update, 'text'=>'カラム名').pack
c_entry=TkEntry.new($frame_update).pack
TkLabel.new($frame_update, 'text'=>'修正内容').pack
fix_entry=TkEntry.new($frame_update).pack
#
updt_button=TkButton.new($frame_update,"text"=>"UPDATE!!").pack
#
updt_button.command=proc{
	$tree.delete($tree.children(nil));
	updt(kamoku_entry.value, c_entry.value.encode("utf-8"), fix_entry.value);
	view(selectall);
}

#disp
Tk.mainloop