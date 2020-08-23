# Application Name - アプリ名
　Branch-Community

# newRead - 概要
  オンラインサロンのマッチングアプリ

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
  
# :iphone: DEMO -  使用方法
  ## 【トップページ】
  <div align="center">
  <img src="https://user-images.githubusercontent.com/67040383/90971714-9861a500-e54d-11ea-948a-6c98e544c85d.png" alt="Image from Gyazo" width="80%">
  </div>
  
  
  ## 【ユーザー／オンラインサロン登録ページ】<br>
  <div align="center">
  <img src="" alt="Image from Gyazo" width="80%">
  </div>
  
  ### 【新着ユーザー／オンラインサロン一覧】<br>
  <div align="center">
  <img src="" alt="Image from Gyazo" width="80%">
  </div>
  
  ## 【ユーザー／オンラインサロン詳細ページ】<br>
  <div align="center">
  <img src="" alt="Image from Gyazo" width="80%">
  </div>
  
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
