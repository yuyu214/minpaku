# Minpaku - 民泊予約アプリ

民泊施設を検索・予約できるWebアプリケーションです。
ユーザーは施設を検索し、お気に入り登録や予約を行うことができます。

---

# アプリ概要

民泊施設を簡単に検索・予約できるサービスです。
ユーザーは施設の検索・詳細確認・予約をアプリ内で行うことができます。

---

# URL

（デプロイしたURLをここに記載）

---

# テスト用アカウント

メールアドレス
[test@example.com](mailto:test@example.com)

パスワード
password

---

# 使用技術

### フロントエンド

* HTML
* CSS
* JavaScript

### バックエンド

* Ruby 3.x
* Ruby on Rails 7.x

### データベース

* MySQL

### 認証

* Devise

### その他

* Git / GitHub

---

# 機能一覧

* ユーザー登録
* ログイン機能
* 施設検索
* 施設登録
* お気に入り登録
* 予約機能

---

# 機能デモ

### ログイン機能

ユーザーがログインしてサービスを利用できます。

![ログイン操作](docs/login.gif)

---

### 施設検索機能

エリア名などの条件を入力して施設を検索できます。

![施設検索操作](docs/facility_search.gif)

---

### 施設登録機能

施設名・住所・画像などを入力して施設を登録できます。

![施設登録操作](docs/facility_register.gif)

---

### お気に入り機能

気に入った施設をお気に入り登録できます。

![お気に入り操作](docs/favorite.gif)

---

### 予約機能

施設の予約をアプリ内で完結できます。

![予約操作](docs/reservation.gif)

---

# データベース設計

### ER図

![ER図](docs/er_diagram.png)

---

### テーブル概要

| テーブル         | 説明     |
| ------------ | ------ |
| users        | ユーザー情報 |
| facilities   | 施設情報   |
| rooms        | 部屋情報   |
| reservations | 予約情報   |
| favorites    | お気に入り  |

---

### モデル関連

User

* has_many :reservations
* has_many :favorites

Facility

* has_many :rooms

Room

* belongs_to :facility
* has_many :reservations

Reservation

* belongs_to :user
* belongs_to :room

Favorite

* belongs_to :user
* belongs_to :facility

---

# 今後の改善予定

* 決済機能（Stripe）
* 口コミ投稿機能
* 画像アップロード機能の強化
* UI/UX改善

---

# 作成者

GitHub
https://github.com/yuyu214
