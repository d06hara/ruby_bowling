
#コメント

=begin
aa
aadfsafdsf




print "hello world"
puts "hello world" # +改行
p "hello world" #デバッグ用


# 変数
# - 英小文字 _

msg = "hello world"
puts msg

msg = "hello world again"
puts msg

# 定数
# - 英大文字

VERSION = 1.1
puts VERSION

VERSION = 1.2
puts VERSION

#数値
# 32 4.8

p 4.8.class
p 4.8.methods

# 四則演算
# + - + / % **
p 10 + 3
p 10 * 3
p 2.4 * 3
p 10 / 3 # 3
p 10 % 3 # 1
p 10.0 / 3
p Rational(2,5) + Rational(3, 4) #分数を表すことができる 2/5 + 3/4
p 2/5r + 3/4r #rationalの略記法

p 52.6.round
p 52.6.floor
p 52.5.ceil

#文字列
# "" 特殊文字　式展開
# '' 

#特殊文字例
puts "hell\no worl\td"
puts 'hell\no world\t'

#式展開例
puts "price #{3000 * 4}"
puts 'price #{3000 * 4}'

name = "taguchi"
puts "hello #{name}"

# + *
puts "hello" + "world"
puts "hello " *  10

# !
# - upcase
# - upcase! 破壊的なメソッド
# - downcase reverseなど

name = "taguchi"
puts name.upcase
puts name
puts name.upcase!
puts name

# ? 真偽値 true false

p name.empty? # false
p name.include?("G") #true

# 配列
colors = ["red", "blue", "yellow"]

p colors[0] # 添字
p colors[-1] #末尾
p colors[0..2]
p colors[0...2]
p colors[5] # nil 何もないという意味

colors[0] = "pink"
colors[1..2] = ["white", "black"]
colors.push("gold")
colors << "silver" #pushの略
p colors

p colors.size
p colors.sort

# ハッシュ
# - key / value

# taguchi 200
# fkoji 400

scores = {"taguchi" => 200, "fkoji" => 400}
scores = {:taguchi => 200, :fkoji => 400} # シンボルを使った書き換え、高速化
scores = {taguchi: 200, fkoji: 400} # さらに簡単な書き方

p scores[:taguchi]
scores[:fkoji] = 600
p scores

p scores.size
p scores.keys
p scores.values
p scores.has_key?(:taguchi)

# 変換

x = 50
y = "3"

p x + y.to_i
p x + y.to_f
p x.to_s + y

scores = {taguchi: 200, fkoji: 400}

p scores.to_a #配列に
p scores.to_h #ハッシュに

# %
puts "hello"
puts 'hello'

#区切り文字を使いたい場合以下の書き方が便利
puts %Q(he"llo) #上と同じ
puts %(he"llo) # 上と同じ
puts %q(hello) #したと同じ

p ["red", "blue"]
p ['red', 'blue']

p %W(red blue)
p %w(red blue)


# "文字列" % 値
# %s 文字列
# %d 整数
# %f 浮動小数点数ｓ

p "name: %s" % "taguchi"
p "name: %10s" % "taguchi" #10桁分の幅
p "name: %-10s" % "taguchi"

p "id: %d, rate: %f" % [355, 3.284] #値が複数の場合は配列
p "id: %05d, rate: %10.2f" % [355, 3.284] # ５桁に表示したい、小数点の後と前で桁数(前：１０桁　後2桁)を指定

#printf, sprintf でもこの書式は使える

printf("name: %10s\n", "taguchi")
printf("id: %05d, rate: %10.2f\n", 355, 3.284)
p sprintf("name: %10s\n", "taguchi")
p sprintf("id: %05d, rate: %10.2f\n", 355, 3.284)

=end

#if
# > < >= <= == !=
# &&(AND) ||(OR) !(NOT)

#score = gets.to_i #　文字列を数値に変換

# if score > 80 then
#   puts "great!"
# elsif score > 60 then
#   puts "good!"
# else
#   puts "so so ..."
# end

#puts "great!" if score > 80 #ifを後ろに書く書き方


# case

# signal = gets.chomp # chompは最後の改行コードを取り除く

# case signal
# when "red" then  #thenは省略できる
#   puts "stop!"
# when "green", "blue" then
#   puts "go!"
# when "yellow" then
#   puts "caution!"
# else
#   puts "wrong signal"
# end



# while

i = 0

# while i < 10 do
#   puts "#{i}:hello"
#   # i = i + 1
#   i += 1
# end


# times

# 10.times do |i| # | 変数 | で変数に入れることができる
#   puts "#{i}:hello"
# end

# 10.times { |i| puts "#{i}: hello!"} # 1行で書く書き方



# for

# for i in (15..20) do #doは省略できる
#   p i
# end

# for color in ["red", "blue"] do
#   p color
# end

# for name, score in {taguchi:200, fkoji:400} do
#   puts "#{name}: #{score}"
# end

# (15..20).each do |i| #doは省略できる
#   p i
# end

# ["red", "blue"].each do |color|
#   p color
# end

# {taguchi:200, fkoji:400}.each do |name, score|
#   puts "#{name}: #{score}"
# end



# loop

# i = 0
# loop do
#   p i += 1
# end

# break
# next

# 10.times do |i|
#   if i == 7 then
#     # break
#     next
#   end
#   p i
# end


# メソッド
# def sayHi(name = "tom") # 引数
#   puts "hi! #{name}"
# end

# # sayHi("taguchi")
# sayHi "taguchi"
# sayHi


# def sayHi(name = "tom") # 引数
#   score = 80
#   return "hi! #{name}"
# end

# p sayHi
# p score


# クラス
# クラスメソッド
# クラス変数 @@をつけることがルール
# クラス定数

# アクセス権
# -public
# -protected
# -private: レジーバーを指定できない

class User

  @@count = 0 # クラス変数

  VERSION = 1.1 # クラス定数


  # アクセサ
  attr_accessor :name
  attr_reader :name
  # setter: name=(value)
  # getter: name

  # def initialize(name)
  #   @@count += 1
  #   @name = name # インスタンス変数
  # end

  def sayHi
    # self インスタンス自信をさす
    # self.name -> @name
    # puts "hi! i am #{@name}"
    # puts "hi! i am #{self.name}"
    # puts "hi! i am #{name}"
    puts "hi"
    sayPrivate
  end

  private #クラスの中でなら呼び出すことができる

  def sayPrivate
    puts "private"
  end

  def self.info
    puts "#{VERSION}: User Class, #{@@count} instances."
  end

end

# クラスの継承
# User: 親クラス、Super Class
# AdminUser: 子クラス、sub Class
class AdminUser < User

  def sayHello
    # puts "Hello from #{@name}"
    puts "hello"
    sayPrivate
  end

  # オーバーライド
  def sayHi
    puts "hi! from admin!"
  end
end


#User.new.sayPrivate # NG
User.new.sayHi
AdminUser.new.sayHello

# tom = AdminUser.new("tom")
# tom.sayHi
# tom.sayHello

# tom = User.new("tom")
# bob = User.new("bob")
# steave = User.new("steave")
# User.info
# p User::VERSION # クラス定数は外からアクセスできる :: をつける


# tom = User.new("tom")

# tom.name = "tom Jr." #インスタンス変数には通常外部からアクセスできないが、アクセサを使用することでアクセス可能になる
# p tom.name

# tom.sayHi # メソッドを受け取っているオブジェクト➡︎レシーバー

# bob = User.new("bob")
# bob.sayHi


# module 変数や定数をまとめられるもの
# - 名前空間

def movie_encode
end

def movie_export
end

module Movie
  VERSION = 1.1

  def self.encode
    puts "encoding..."
  end

  def self.export
    puts "exporting..."
  end
end

Movie.encode
Movie.export
p Movie::VERSION

# - ミックスイン（継承関係にない複数のクラスに共通の機能を持たせるときに便利)
module Debug

  def info
    puts "#{self.class} debug info ..."
  end
end

class Player
  include Debug
end

class Monster
  include Debug
end

Player.new.info 
Monster.new.info 


# 例外

#自分で例外クラスを作る場合
class MyError < StandardError; end # StandardError:rubyの標準的な例外クラス

x = gets.to_i

begin #例外が発生しそうな処理を後ろに書く
  if x == 3
    raise MyError #自分のクラスを発動
  end
  p 100 / x
rescue MyError
  puts "not 3!"
rescue => ex #例外が発生した時の処理、exのオブジェクトに発生した例外を入れる
  p ex.message
  p ex.class
  puts "stopped!"
ensure #例外が発生してもしなくても行いたい処理
  puts "--END-- "
end