== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# Database

### usersテーブル
+ has_many group_users
+ has_many groups through group_users
+ has_many messages

### messagesテーブル
+ belongs_to user
+ belongs_to chat_group

### groupsテーブル
+ has_many messages
+ has_many group_users
+ has_many users through chat_group_users

### group_usersテーブル 中間テーブル
+ belongs_to user
+ belongs_to chat_group


###users テーブル
|column|
|:--|
|id|
|name|
|email|
|password|
|group_id|

### messagesテーブル
|column|
|:--|
|id|
|text|
|image|
|user_id|
|roup_id|


###groups テーブル
|column|
|:--|
|id|
|name|


###groups_users table テーブル
|column|
|:--|
|id|
|group_id|
|user_id|

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
