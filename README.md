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
| title | string |
| content  | text |
| end_time| datetime |
| start_time  | datetime |

* tags

|  欄位名稱   | 資料型態  |
|  ----  | ----  |
| tag_name | string |

# fly.io環境部署

* 安裝 flyctl 工具
```brew install flyctl```
*  登入 fly.io
```flyctl auth login```
* 在所需部署資料夾執行
```flyctl launch```