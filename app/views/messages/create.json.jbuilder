json.created_at @message.created_at.strftime('%Y/%m/%d %H:%M')
json.text       @message.text
json.name       @message.user.name
json.image      @message.image.to_s
