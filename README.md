# Application Name - アプリ名
　Branch-Community

# newRead - 概要
  オンラインサロンのマッチングアプリ

# 使用環境
  Ruby/Ruby on Rails/Haml/Scss/MySQL/Github/heroku/Visual Studio Code<br>
  <br>
  
# :ledger: Deploy - 本番環境
  IPアドレス：https://branch-community.herokuapp.com/<br>
  <br>
    <br>
  ＜テスト用アカウント＞<br>
  ・ユーザー用<br>
    メールアドレス: test.user@com<br>
    パスワード: test1234<br>
    <br>
  ・オンラインサロン用<br>
    メールアドレス名: test.salon@com<br>
    パスワード: test1234
    <br>
    
# :ledger: Production Background - 制作背景
  【社会背景】<br>
  オンラインで、"心地よいモノ、コト、バ”を求めるニーズが高まっている。<br>
  会員制SNSやオンラインゲーム、マッチングアプリ、UberEatsなどオンライン上で完結する<br>
  サービスが増加している。<br>
  個人の発信では、インフルエンサーと呼ばれる人物が、YouTube、Twitter、Instagramなどの<br>
  プラットフォームで自身の考えやノウハウを表現し、世界に影響を及ぼす時代となった。<br>
  個人の持つ、特異な才能や情報の価値が希少なものとなってきた。<br>
  上記の影響力のある個人が、有料で情報開示するオンラインサロンを始めるケースが増加している。<br>
  
  【なぜ、オンラインサロンのマッチングアプリが必要なのか】<br>
  オンラインサロンの特性上、クローズドな面が大きく、怪しい印象を感じてしまう。<br>
  オンラインサロン運営側は、ビジネスという側面はありつつも、根源的には一人でも多くの人に<br>
  自身の思いを広めていきたいと考えているのではないか。<br>
  運営側とユーザー側、両者の思いのズレを埋める為のサービスの開発を検討した。<br>
  運営側とユーザー側の橋渡し役を果たす、透明性の高いWEBサービスを提供したいと考え、<br>
  開発に至った。<br>

# 実装機能
  ・新規会員登録<br>
  ・登録情報編集機能<br>
  ・お気に入り機能<br>
  ・ユーザー一覧表示機能<br>
  ・お気に入り機能<br>
  ・DM機能<br>
  ・サロン申込機能<br>
  
# :iphone: DEMO -  使用方法
  ## 【トップページ】
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90971714-9861a500-e54d-11ea-948a-6c98e544c85d.png" alt="Image from Gyazo" width="80%">
  </div>
  
  
  ## 【ユーザー／オンラインサロン登録ページ】<br>
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90971742-ea0a2f80-e54d-11ea-94de-effaa9e319a0.gif" alt="Image from Gyazo" width="80%">
  </div>
  
  ### 【お気に入り機能】<br>
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90971972-fee7c280-e54f-11ea-8ca3-8d324491a7ba.gif" alt="Image from Gyazo" width="80%">
  </div>
  
  ## 【ユーザー／オンラインサロン詳細ページ】<br>
  <div align="center">
  </div>
  
# Device - 工夫したポイント
  カテゴリー、所在地、プロフィールから、ユーザーの目的に合うオンラインサロンが見つかるようにしました。<br>
  デザインは、ユーザーとオンラインサロンが際立つように極力シンプルなものにしました。<br>
  まだ、未実装ではありますが、今後は相互の疑問解消のため、下記の機能を実装することで、よりオンラインサロンが<br>
  身近となるように改良していきます。<br>
  
# :computer: To be implemented - 実装予定
・　チャットルーム機能<br>
・　おすすめユーザー（オンラインサロン）表示機能<br>
・　アクティブユーザー表示機能<br>
・　ユーザー（オンラインサロン）ランキング機能<br>
　 and more...<br>
  
# :pencil2: Database Design - DB設計
  
## usersテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|birth_place|integer|null: false|
|sex|integer|null: false|
|birth_date|date|null: false|
|category|integer|null: false|
|profile|text|null: false|
|email|string|null: false|
|image|string|null: false|
|password|string|null: false|
### Association
- has_many :salonfavorites, dependent: :destroy
- has_many :salonfavorites, through: :salonfavorites, source: :salon
- has_many :userfavorites, dependent: :destroy
- has_many :userfavorites, through: :favorites, source: :salon
- has_many :rooms

## salonsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|birth_place|integer|null: false|
|category|integer|null: false|
|profile|text|null: false|
|email|string|null: false|
|image|string|null: false|
|password|string|null: false|
### Association
- has_many :salonfavorites, dependent: :destroy
- has_many :salonfavorites, through: :salonfavorites, source: :user
- has_many :userfavorites, dependent: :destroy
- has_many :userfavorites, through: :favorites, source: :user
- has_many :rooms

## salonfavoritesテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false|
|salon|references|null: false|
### Association
- belongs_to :user
- belongs_to :salon

## userfavoritesテーブル
|Column|Type|Option|
|------|----|------|
|salon|references|null: false|
|user|references|null: false|
### Association
- belongs_to :salon
- belongs_to :user

## roomsテーブル
|Column|Type|Option|
|------|----|------|
|salon|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- has_many :messages
- belongs_to :user
- belongs_to :salon

## messagesテーブル
|Column|Type|Option|
|------|----|------|
|room|references|null: false, foreign_key: true|
|is_user|boolean|
|content|text|
### Association
- belongs_to :room
