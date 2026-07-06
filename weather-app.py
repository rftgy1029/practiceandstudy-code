from datetime
import datetime
import requests

AUTH_KEY = "blE3_YUlTT2RN_2FJZ091Q"

STN_ID = "133"

now = datetime.now()
tm = now.strftime("%Y%m%d%H%M")

url = "https://apihub.kma.go.kr/api/typ01/cgi-bin/url/nph-aws2_min?tm2=202302010900&stn=0&disp=0&help=1&authKey=blE3_YUlTT2RN_2FJZ091Q"

params