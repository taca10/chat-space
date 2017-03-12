# Database

###users テーブル
|column               |type    |option    |
|:-----               |-----   |          |
|name                 |string  |※add_index|
###deviseを使う

### アソシエーション
+ has_many group_users
+ has_many groups through group_users
+ has_many messages


### messagesテーブル
|column              |type    |
|:--                 |------  |
|text                |text    |
|image               |string  |
|user_id             |integer |
|group_id            |integer |

### アソシエーション
+ belongs_to user
+ belongs_to group


###groups テーブル
|column                |type  |option    |
|:--                   |----  |          |
|name                 |string |※add_index|

### アソシエーション
+ has_many messages
+ has_many group_users
+ has_many users through group_users

###group_user テーブル
|column                |type   |
|:--                   |---    |
|group_id              |integer|
|user_id               |integer|

### アソシエーション 中間テーブル
+ belongs_to user
+ belongs_to group
