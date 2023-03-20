# **AUTOMATIC SERVICE INSTALLATION GUIDE**

## Requirements
1. Ubuntu 20.04
2. Docker
3. Docker-compose


## Installation

1. Clone the respository to your local  machine by running  the command

        git clone https://github.com/phattrann/excel2pandas.git

2. Move to folder

        cd excel2pandas_


3. Create .env And copy this code to .env

        MINIO_SECRET_ACCESS_KEY = "KPMG@2023"  
        MINIO_ACCESS_KEY_ID = "KPMG@2023"
        MINIO_STORAGE_BUCKET_NAME = "kpmg"
        MINIO_END_POINT =  "ip_server:9000"

        KAKFA_END_POINT = "ip_server:9092"
        KAFKA_PANDAS_TOPIC = "pandas-topic"
        KAFKA_XLWING_TOPIC = "xlwings-topic"

        SERVER_BACKEND = "http://ip_server:8690"

4. And then build auto with command line 

        bash auto_build_and_deploy.sh


# **END**









