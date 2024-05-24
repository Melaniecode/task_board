# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
| text  | string |
| end_time| datetime |
| start_time  | datetime |

* tags

|  欄位名稱   | 資料型態  |
|  ----  | ----  |
| tag_name | string |