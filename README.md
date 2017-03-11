== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# Database



###users テーブル
|column               |type    |
|:-----               |-----   |
|name                 |string  |
|devise use(email)    |text    |
|devise use (password)|text    |

### アソシエーション
+ has_many group_users
+ has_many groups through group_users
+ has_many messages


### messagesテーブル
|column               |type    |
|:--|                 |------  |
|text|                |text    |
|image|               |string  |
|user_id|             |integer |
|group_id|            |integer |

### アソシエーション
+ belongs_to user
+ belongs_to group


###groups テーブル
|column                |type  |
|:--                   |----  |
|name                  |string|

### アソシエーション
+ has_many messages
+ has_many group_users
+ has_many users through group_users

###groups_users table テーブル
|column                |type   |
|:--                   |--     |
|group_id              |integer|
|user_id               |integer|

### アソシエーション 中間テーブル
+ belongs_to user
+ belongs_to group


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
