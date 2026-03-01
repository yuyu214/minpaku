# Minpaku - 民泊予約アプリ

## ■ アプリ概要

Minpakuは、民泊施設を検索・予約できるWebアプリケーションです。  
ユーザーはエリア検索を行い、施設詳細を確認し、予約まで完結できます。

実務を想定し、認証機能・CRUD・検索・関連付け・予約処理を一通り実装しました。

---

## ■ 開発背景

ポートフォリオとして制作しました。  
実際の予約サービスをイメージし、

・ユーザー認証  
・施設と部屋の関連付け  
・検索機能  
・予約機能  

を実装し、Railsの基礎力を証明できる構成にしています。

---

## ■ URL

（デプロイ後に記載）
例：https://minpaku-app.herokuapp.com

---

## ■ 使用技術

- Ruby 3.x
- Rails 7
- PostgreSQL
- Devise（ユーザー認証）
- Bootstrap / CSS
- Heroku

---

## ■ 機能一覧

### ユーザー機能
- 新規登録 / ログイン
- ゲストログイン
- マイページ表示
- 予約履歴確認

### 施設機能
- 施設一覧表示
- エリア検索（部分一致検索）
- 施設詳細ページ
- 画像アップロード機能

### 予約機能
- 予約作成
- 予約確認画面
- 予約キャンセル

---

## ■ ER図

## ■ ER図

![ER図](docs/er_diagram.png)

---

## ■ テーブル設計

- users
- facilities
- rooms
- reservations

関連付け：

- User has_many Reservations
- Facility has_many Rooms
- Room has_many Reservations

---

## ■ 工夫した点

・検索機能をJOINで実装し、N+1問題を回避  
・Deviseを用いた安全な認証設計  
・関連付けを明確にしたデータベース設計  
・UIをシンプルかつ直感的に設計  

---

## ■ 苦労した点

・施設と部屋、予約の関連設計  
・予約確認画面からのデータ受け渡し  
・バリデーション設計  

---

## ■ 今後の改善点

・管理者機能の追加  
・レビュー機能の実装  
・決済機能の導入（Stripeなど）  
・AWS環境への移行  

---

## ■ ローカル環境での起動方法

```bash
git clone https://github.com/your-name/minpaku.git
cd minpaku
bundle install
rails db:create
rails db:migrate
rails s