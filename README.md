# README

# table schema

* users

|  欄位名稱   | 資料型態  |
|  ----  | ----  |
| role | string |
| username  | string |
| email  | string |
| password| string |

* tasks

|  欄位名稱   | 資料型態  |
|  ----  | ----  |
| id | integer |
| title | string |
| content  | text |
| status  | integer |
| priority  | integer |
| end_time| datetime |
| start_time  | datetime |
| user_id  | integer |
| tag_id  | integer |

* tags

|  欄位名稱   | 資料型態  |
|  ----  | ----  |
| id | integer |
| tag_name | string |

# fly.io環境部署
Rails版本號： 7.1.3.3

網址：https://task-board-main.fly.dev
* 安裝 flyctl 工具
```brew install flyctl```
*  登入 fly.io
```flyctl auth login```
* 在所需部署資料夾中執行
```flyctl launch```
*  Would you like to continue in the web UI?
選擇y，即可進到fly.io進行設定
*  第二次部署
```fly deploy```
