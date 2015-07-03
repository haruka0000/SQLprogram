# coading:utf-8
require'sqlite3'
require'tk'


$dbdata = "Evacuation.db"
$data1=nil
$tree=nil
$frame_view = nil
$frame_first = nil
$frame_select = nil
$frame_selectall = nil
$frame_insert = nil

def select(evac)
    #database open
    db = SQLite3::Database.new($dbdata)

    #sql code
    sql = "SELECT * FROM 避難所 where 建物名= '#{evac}';"

    $data1=Hash.new{|hash,key| hash[key] = {}}
    i = 0

    #select
    db.execute(sql) do |row|
        $data1[i][0] = row[0]
        $data1[i][1] = row[1]
        $data1[i][2] = row[2]
        $data1[i][3] = row[3]
        $data1[i][4] = row[4]
        $data1[i][5] = row[5]
        $data1[i][6] = row[6]
        $data1[i][7] = row[7]
        $data1[i][8] = row[8]
        i=i+1
    end

    db.close

    return $data1

end

def selectall
    #database open
    db = SQLite3::Database.new($dbdata)

    #sql code
    sql = "SELECT * FROM 避難所"

    $data1=Hash.new{|hash,key| hash[key] = {}}
    i = 0

    #select
    db.execute(sql) do |row|
        $data1[i][0] = row[0]
        $data1[i][1] = row[1]
        $data1[i][2] = row[2]
        $data1[i][3] = row[3]
        $data1[i][4] = row[4]
        $data1[i][5] = row[5]
        $data1[i][6] = row[6]
        $data1[i][7] = row[7]
        $data1[i][8] = row[8]
        i=i+1
    end

    db.close

    return $data1
end


#treeview
def view(data1)

    #table draw
    i = 0
    i.upto(data1.length-1) do |i|
        $tree.insert(nil, :end, id:nil, text:nil, value:[data1[i][0], data1[i][1], data1[i][2], data1[i][3], data1[i][4], data1[i][5], data1[i][6], data1[i][7], data1[i][8]]);
    end
end

#window 
window = TkRoot.new {
    title'応用プログラミング'
    resizable [0,0]
}

$frame_tree = TkFrame.new(window)
$frame_first = TkFrame.new(window)
$frame_select = TkFrame.new(window)
$frame_insert = TkFrame.new(window)
$frame_delete = TkFrame.new(window)
$frame_update = TkFrame.new(window)

$tree = Ttk::Treeview.new($frame_tree, show: :headings).pack

$tree ['columns'] = 'evac address earthquake tsunami flood surge landslide fire inlandwaters'

#scroll
yscrollbar = $tree.yscrollbar(TkYScrollbar.new(nil))
yscrollbar.pack('side' => 'right', 'fill' => 'both')

$tree.pack('side' => 'left', 'fill' => 'both', 'expand' => 'yes')
$frame_tree.pack('side' => 'top', 'fill' => 'both', 'expand' => 'yes')

%w(evac address earthquake tsunami flood surge landslide fire inlandwaters).zip(%w(建物名 住所 地震 津波 洪水 高潮 土砂 火事 内水)).each do |col, item|
    $tree.heading_configure(col, text:item)
end

# 初期画面設定(最初は表示)
$frame_first.pack


button_back = TkButton.new($frame_tree,"text"=>"戻る").bg("red").pack
button_back.command = proc {
        $frame_first.pack
        $frame_select.unpack
        $frame_insert.unpack
        $frame_delete.unpack
        $frame_update.unpack
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


# 全検索実行ボタン
button_all = TkButton.new($frame_first,"text"=>"全検索実行").bg("green").pack
# 全検索実行ボタンが押されたときの処理
button_all.command = proc {
        $tree.delete($tree.children(nil));  # Treeviewデータをクリア
        view(selectall);
}

# 条件検索用の画面準備(最初は非表示)
$frame_select.unpack
# entry
TkLabel.new($frame_select, 'text'=>'検索する建物名を入力してください').pack
#
entry=TkEntry.new($frame_select).pack
#
button=TkButton.new($frame_select,"text"=>"検索実行").pack
#
button.command=proc{
        $tree.delete($tree.children(nil));
            view(select(entry.value));
}

#disp
Tk.mainloop
