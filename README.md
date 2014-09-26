# 楽天でこんなもの売ってましたサービス

![Travis](https://travis-ci.org/328--/rakuten_sold_out.svg?branch=master)

- 楽天ではもう販売されていない商品を紹介
- 楽天APIを利用


# demo

- [demo-page] (https://aqueous-headland-9882.herokuapp.com/)
- Herokuにてデモを公開


# 紹介スライド

- [ 328--/sold_out_slideshow ](https://github.com/328--/sold_out_slideshow)


# 注意

- 楽天APIを登録し，以下の環境変数を設定する必要があります
- `SOLD_OUT_APPID`  アプリID/デベロッパーID
- `SOLD_OUT_AFID`  アフェリエイトID

# 使い方

```
$ git clone https://github.com/328--/rakuten_sold_out
$ echo "export SOLD_OUT_APPID=xxxxxxxxxxxxxxxxxxxx" >> ~/.bash_profile
$ echo "export SOLD_OUT_AFID=xxxxxxx.xxxxx.xxxx.xxxx" >> ~/.bash_profile
$ source ~/.bashrc
$ cd rakuten_sold_out
$ bundle install
$ rails server
```

# ライセンス

- MITライセンスにて提供しています。詳しくは LICENSE.txt ファイルをご確認ください。
